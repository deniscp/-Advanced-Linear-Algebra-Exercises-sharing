function [Q1,Q2,R,L] = fullQR(A)

%since the QR procedure is incremental, we first compute the Q1 matrix associated
%to the input A matrix with the generalized QR algorithm using genQR.m,
%then we compute the Q2 matrix associated to the A matrix exending it with
%the appropriate matrix I using the full QR procedure with fullQR.m
[Q1,R,L] = genQR(A);
Q2=[];
A_extended = [ A eye(size(A,1)) ];

old_rank = size(Q1,2);

fprintf('\nComputing Q2:\n');

for i= (size(A,2)+1 : size(A_extended,2) ) %for the remaining columns of the input A matrix exendend with I
    
    new_rank = rank( A_extended(:,1:i) );    %compute the rank of the considered sub-matrix
    fprintf('Step %i; old rank: %i, new rank: %i\n',i,old_rank,new_rank);
    
    if new_rank ~= old_rank %if we are processing an independent column, i.e. norm of q tilde > 0
        
        a_i = A_extended(:,i);
        q_tilde = a_i;
        
        for j = (1 : size(Q1,2))
            q_j = Q1(:,j);
            q_tilde= q_tilde - (a_i' * q_j) * q_j;
        end
        
        for j = (1 : size(Q2,2))
            q_j = Q2(:,j);
            q_tilde= q_tilde - (a_i' * q_j) * q_j;
        end
        
        q = q_tilde / norm(q_tilde);
        Q2 = [ Q2 q ];
        
    else
        fprintf('Skip a_%i\n',i)
    end
    
    old_rank = new_rank;
end
end