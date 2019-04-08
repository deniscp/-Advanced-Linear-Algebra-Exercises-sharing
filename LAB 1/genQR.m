function [Q,R,L] = genQR(A)

rankA = rank(A);
min_dim = min(size(A));

if min_dim ~= rankA
    fprintf('The input matrix is not full rank\n')
else
    fprintf('The input matrix is full rank\n')
end

Q = [];
R = [];
L = [];
%Matrix L if right-multiplied to the input matrix selects a set of maximal columns
%that is linearly indipendent. If right-multiplied to the R matrix makes it
%square and upper triangular.

old_rank = 0;

for i= (1: size(A,2) ) %for all the columns of the input A matrix
    new_rank = rank( A(:,1:i) );    %compute the rank of the considered sub-matrix
    fprintf('Step %i; old rank: %i, new rank: %i\n',i,old_rank,new_rank);
    a_i = A(:,i);
    r_i = zeros(rankA,1);
    R_ji = 0;
    
    q_tilde = a_i;    
    
    for j = (1 : size(Q,2))
        q_j = Q(:,j);
        
        R_ji = a_i' * q_j;
        r_i(j) =  R_ji;
        
        q_tilde= q_tilde - R_ji * q_j;
    end
    
    if new_rank ~= old_rank %if we are processing an independent column, i.e. norm of q tilde > 0
        
        q = q_tilde / norm(q_tilde);
        Q = [ Q q ];
        
        j=size(Q,2);
        R_ji = a_i' * q;
        r_i(j) = R_ji;
        
        l= zeros(size(A,2),1);
        l(i) = 1;
        L = [ L l ];
        
    else
        fprintf('Skip a_%i\n',i)
    end
    
    R = [ R r_i ];
    
    old_rank = new_rank;
end
end
