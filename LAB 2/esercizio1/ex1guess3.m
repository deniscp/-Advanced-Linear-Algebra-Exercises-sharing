% leggi file 
gauss_fit_data;
figure (1)
plot(t,y, 'or');
xlabel('campionamento t_i');
ylabel('val campioni y_i');
% tolleranza di aggiornamento

tol = 1.e-14;
nmax = 1000;
figure
plot(t, y,'or');
% III  GUESS
% Scegliamo dei parametri iniziale non ragionevole e vediamo che l'algoritmo fallisce
disp('III GUESS\n')
a = 12; mu = 20; sigma = 42;
p0 = [a;mu;sigma];
[p,E,iter]=Gauss_Newton_method(t,y,N,p0,tol,nmax);