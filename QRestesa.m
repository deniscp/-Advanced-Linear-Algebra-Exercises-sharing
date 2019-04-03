function [Q,R] = QRestesa(A)

rankA = rank(A);
min_dim = min(size(A));

if min_dim ~= rankA
    fprintf('Matrix A is not full rank\n')
else
    fprintf('Matrix A is full rank\n')
end

Q = [];
R = [];

old_rank = 0;

for i= (1: size(A,2) )
    new_rank = rank( A(:,1:i) );
    fprintf('Step %i; old rank: %i, new rank: %i\n',i,old_rank,new_rank);
    a_i = A(:,i);
    r_i = zeros(rankA,1);
    R_ji = 0;
    
    q_tilde = a_i;
    j = 0;
    
    
    for j = (1 : size(Q,2))
        %fprintf('i: %i, j: %i\n',i,j);
        q_j = Q(:,j);
        R_ji = a_i' * q_j;
        r_i(j) =  R_ji;
        q_tilde= q_tilde - R_ji * q_j;
    end
    
    if new_rank ~= old_rank
        %fprintf('-\n');
        
        q = q_tilde / norm(q_tilde);
        R_ji = a_i' * q;
        
        if size(j) == [0,0]
            j=0;
        end
        
        r_i(j+1) = R_ji;
        
        Q = [ Q q ];
    else
        fprintf('Skip a_%i\n',i)
    end
    
    
    R = [ R r_i ];
    old_rank = new_rank;
end
end