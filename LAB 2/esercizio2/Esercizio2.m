%Recupero il gain massimo di Y^T, il valore M da usare per trovare i pesi
%w, oltre che il primo input vector dell'SVD, 
[U,S,V] = svd(Y');
M = S(1,1);
x2 = V(:,1);

%riscalo il vettore x2 in modo da trovare il vettore di pesi w secondo la
t = sqrt(T/M);

w = t*x2

%recupero i segnali approssimati 
s_hat = w'*Y;

%istogramma, picchi in -10 circa e +12 circa
hist(s_hat,50);

%recupero margine di errore
err_counter = 0;

s_hat_sign = zeros(1,T);
for i = 1:T
    s_hat_sign(1,i) = sign(s_hat(1,i));
    if s_hat_sign(1,i) ~= s(1,i)
        err_counter = err_counter + 1;
    end
end

err_rate_perc = (err_counter/T)*100 % 2.9%

%contro prova error rate
s_hat_neg = -w'*Y;

%recupero margine di errore
err_counter = 0;

for i = 1:T
    s_hat_sign(1,i) = sign(s_hat_neg(1,i));
    if s_hat_sign(1,i) ~= s(1,i)
        err_counter = err_counter + 1;
    end
end

err_rate_neg_perc = (err_counter/T)*100 % 97.1%

sum_opposite_perc = (err_rate_neg + err_rate) % 100%
