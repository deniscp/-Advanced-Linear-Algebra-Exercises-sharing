% leggi file dei dati  e stampa
gauss_fit_data;
figure (1)
plot(t,y, 'or');
xlabel('campioni t_i');
ylabel('valore dei campioi y_i');
% tolleranza di aggiornamento
tol = 1.e-14;
nmax = 1000;
figure
plot(t, y,'or');
%% II GUESS
fprintf('II GUESS\n')
a = 20; mu = 40; sigma = 30;
p0 = [a;mu;sigma];
[p,E,iter]=Gauss_Newton_method(t,y,N,p0,tol,nmax);