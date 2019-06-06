function [p,E,iter]=Gauss_Newton_method(t,y,N,p0,tol,nMaxIt)
% t = istanti di tempo,
% y = valori della funzione
% N = numero di campioni
% tol = treshold di tolleranza per il metodo di GN: l'algoritmo termina se l'aggiornamento del vettore dei parametri e` piccolo
% nMaxIt = limite delle iterazioni
% OUTPUT : 
% p = vettore dei parametri
% E = vettore che tiene traccia dei valori dell'RMS

% tt: t_i; pp: parametri
f = @(tt, pp) pp(1) .* exp(-((tt-pp(2)).^2./(pp(3)^2)));

%derivate rispetto a a, mu, sigma
df_da = @(tt,pp) exp(-((tt-pp(2)).^2./(pp(3)^2)));
df_dmu = @(tt,pp) 2.*pp(1) ./ (pp(3)^2) .*(tt-pp(2)).* exp(-((tt-pp(2)).^2./(pp(3)^2)));
df_dsigma = @(tt,pp) 2.*pp(1) ./ (pp(3)^3) .* ((tt-pp(2)).^2).* exp(-((tt-pp(2)).^2./(pp(3)^2)));

% inizializzazione dell'algoritmo
iter = 0;
r0 = f(t,p0)-y;
A0 = [ df_da(t,p0), df_dmu(t,p0), df_dsigma(t,p0) ];
b0 = A0*p0-r0;
% RMS iniziale
E0 = sqrt(1/N * sum((f(t,p0) - y).^2));
% init dei dati
p = p0;
A = A0;
b = b0;
% set the initial error as follows in order to enter the cycle:
err = tol + 1;
Ek = E0
E = E0;
errore_rank = 0;

while (err>tol) && (abs(Ek)~=0) && (iter<nMaxIt)
   if (det(A' * A)==0)
       disp('A non e full rank');
       errore_rank = 1;
       rA = rank(A)
       break
   end
   iter = iter + 1;
   pseudoinvA = pinv(A);
   p_new = pseudoinvA * b;
   r = f(t,p_new) - y;
   A = [ df_da(t,p_new), df_dmu(t,p_new), df_dsigma(t,p_new) ];
   b = A * p_new - r;
   err = norm(p_new - p)/norm(p);
   p = p_new;
   Ek = sqrt(1/N * sum((f(t,p) - y).^2));
   E = [E;Ek];
end

if(errore_rank == 1)
    disp('GN non converge\n')
 else
    if (iter < nMaxIt)
        fprintf('Converge in %d iterazioni \n', iter);
        fprintf('\t a=%12.6f, \n', p(1));
        fprintf('\t mu =%12.6f, \n', p(2));
        fprintf('\t sigma =%12.6f. \n\n', p(3));
    else
        fprintf('Converge troppo lentamente \n')
    end
end

figure
plot(t,y, 'or');
xlabel('campioni t_i');
% plot con parametri iniziali :
hold on
plot(t,f(t,p0), '-g');
% plot con valori finali 
hold on
plot(t,f(t,p), '-b');
legend('campioni y_i','f(t,p^{(0)})','f(t,p^{(f)})')
% plot dell'evoluzione dell'errore
figure
plot([0:iter],E, 'ob');
xlabel('iterazione k');
ylabel('RMS  E_k');
end