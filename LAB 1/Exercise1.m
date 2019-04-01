%Usa la funzione genQR.m


A =[  1    20     3    -5    24     0    -2     0    -4    -1     1    -2    13     1    -3     1
    -1   -10    -3     5   -14     2   -20    -1   -20     0     2     0   -13    -1     3    -1
     0    40     0    20    40    -8    24    -8    16    -4     8    -8   -40     0    -8     4
    -2   -20     0    10   -22     1    -8    -2    -4     2     1    -2   -26     2    -6     2
    -2   -10    -6     5   -18    -1    22     0    20    -1    -2     0   -16     0    -4     2
     2   -10     0     5    -8     0   -10    -1    -8     1     2     1    -4     2    -4     1
    -1   -20     3   -10   -18     1   -24     2   -20     2     2    -2    17    -2     4    -1
     0     0    -3   -10    -3    -2    -8     1   -12    -2     0     2    20    -1     5    -2
     2   -20     6    -5   -12    -2     8    -1     8     0     1     1    16     0    -4     2
     6   -30   -18   -30   -42     3     0     3     0     0     0     0    78     6    -6     0
    -2   -20     6    10   -16     0   -12    -2   -14    -1     2    -2   -26     1    -5     2
    -1     0     0     5    -1     2    12     1    10    -1    -1     0   -13     0     4    -2];

%Calcolo della QR di A
[Qa,Ra, Atilde] = genQR(A);

%Coefficienti del sistema lineare
B = [1  2   0   -1  2   2;
     0  0   7   -4  4   4;
     2  4   -7  -1  0   0];
 
%Matrice dello spazio delle soluzioni
Bsolutions = [B' eye(6)];
%Calcolo delle scomposizione QR dello spazio delle soluzioni
[Qb,Rb, Btilde] = genQR(Bsolutions);
%Recupero delle ultime size - rank colonne
Qbsol = Qb(:,rank(B)+1:size(B,2))
%Test delle soluzioni in matrice di zeri
Solutions = [B*Qbsol(:,1)   B*Qbsol(:,2)    B*Qbsol(:,3)]

 
 
