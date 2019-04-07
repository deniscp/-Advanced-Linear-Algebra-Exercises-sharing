function [Q,Q1,Q2,R,L] = fullQR(A)

[Q,R,L] = genQR(A)
Q1=Q;
Q2=[];
A = [ A eye(size(A,1)) ]
old_rank = size(Q1,2)

end