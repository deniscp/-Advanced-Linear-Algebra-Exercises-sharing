function [Q,R,Atilde] = genQR(A)

min_dim = min(size(A));

if min_dim ~= rank(A) 
    fprintf('Matrix A is not full rank\n')
else
    fprintf('Matrix A is full rank\n')
end

pointer = 0;
Q = [];
R = [];
Atilde = [];

old_rank = 0;

for i= (1: size(A,2) )
    new_rank = rank( A(:,1:i) );
    fprintf('Step %i; old rank: %i, new rank: %i\n',i,old_rank,new_rank);
    ri = zeros(1,rank(A));
    a_i = A(:,i);
    if new_rank ~= old_rank
        
        q_tilde = a_i;
        
        for j = (1 : size(Q,2))
            %fprintf('i: %i, j: %i\n',i,j);
            q_j = Q(:,j);
            ri(j) = (a_i' * q_j);
            q_tilde= q_tilde - ri(j) * q_j;
        end
        ri(i-pointer) = norm(q_tilde);
        
        %fprintf('-\n');
        q = q_tilde / ri(i-pointer);
        
        
        Q = [ Q q ];
        R = [ R ri' ];
        Atilde = [Atilde a_i];
    else
        for j = (1 : size(Q,2))
            %fprintf('i: %i, j: %i\n',i,j);
            q_j = Q(:,j);
            ri(j) = (a_i' * q_j);
            
        end
        R = [ R ri' ];
        fprintf('Skip a_%i\n',i)
        
        pointer = pointer + 1;
    end
    old_rank = new_rank;
end

end