detect_lin_rel_data;
N=size(Y,2);
n=size(Y,1);
%controllo il rango di Y, in questo caso n perche` le misure sono le colonne
if rank(Y)==n;
  [U,S,V]=svd(Y);
  q = U(:,n);
  %possiamo semplificare i calcoli del denominatore senza usare sommatorie e al numeratore sfruttando la SVD
  rho = S(n,n)/(sqrt(trace(Y'*Y)))
else
  disp('Matrice non skinny')
end