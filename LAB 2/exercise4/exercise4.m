% Parte 1 dell'esercizio 4

% Matrice di partenza
A = [1 1 1; -1 1 1; 0 0 2];

% Calcolo dell'esponenziale della matrice
A5 = expm(5*A);

% Considero il LAS
% x(0) = x0
% x(1) = expm(A)*x(0)
% x(2) = expm(2*A)*x(0)
% x(5) = expm(5*A)*x(0)

% Vogliamo che norm(x(5)) sia massima ( x(5) = expm(5*A) * x(0) ) con norm(x(0)) = 1

% Calcolo la scomposizione SVD dell'esponenziale della matrice
[U,S,V] = svd(A5);

% Calcolo del primo autovalore della matrice
eigen = S(1);

% Calcolo del primo autovettore della matrice
v1 = V(:,1);

% Controllo che la norma tra i prodotti sia uguale
prova1 = norm(A5*v1);
prova2 = norm(eigen*v1);

check = prova1 == prova2;

% Calcolo dello stato iniziale che massimizzi norm(x(5))
x0 = v1;

% Calcolo dello stato x(5) massimo
x5 = norm(expm(5*A)*x0);

%%
% Parte 2 dell'esercizio 4
 
% Matrice di partenza
A = [1 1 1; -1 1 1; 0 0 2];

% Calcolo dell'esponenziale della matrice
A1 = expm(-1*A);

% Controllo che il determinante sia diverso da 0
check1 = det(A) ~= 0; 
check2 = det(A1) ~= 0;

% Considero il LAS
% x_der = A*x
% x(0) = x0
% x(1) = expm(A)*x(0)
% x(2) = expm(2*A)*x(0)
% x(-1) = expm(-1*A)*x(0)

% Vogliamo che norm(x(-1)) sia minima ( x(-1) = expm(-1*A) * x(0) ) con norm(x(0)) = 1

% Calcolo la scomposizione SVD dell'esponenziale della matrice
[U,S,V] = svd(A1);

% Calcolo dell'ultimo autovalore della matrice
eigen = S(9);

% Calcolo dell'ultimo autovettore della matrice
v3 = V(:,3);

% Controllo che la norma tra i prodotti sia uguale
prova1 = norm(A1*v3);
prova2 = norm(eigen*v3);

check = prova1 == prova2;

% Calcolo dello stato iniziale che minimizzi norm(x(-1))
x0 = v3;

% Calcolo dello stato x(-1) minimo
x1 = norm(expm(-1*A)*x0);