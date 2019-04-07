% costruiamo le matrici di interesse

A = [ 
      [9:-1:0] + 0.5; 
      ones(1,10); 
      ([4:-1:0] + 0.5) zeros(1,5); 
    ]; 

b = [10; 1; 5]; 

% la specifica del primo punto e` y = [0;0;0] 
y = [0;0;0] 

 
y_hat = y - b; 

% controlliamo se bassa, rango massimo 
rank(A) == 3; 

xln = A \ y_hat;
xln_pinv = pinv(A) * y_hat; 


% check if x
xln = xln_pinv

% creo vettore position and velocity 

for i=1:10
  vel(i) = A(2, 1:i) * xln(1:i) + 1;
  ai = [i-0.5:-1:0.5]; 
  pos(i) = ai * xln(1:i) + i ;
end

% plot the position and velocity
subplot(3,1,1)
plot(xln)
title('Vettore forza')

subplot(3,1,2)
plot(pos)
title ('Posizione') 

subplot(3,1,3)
plot(vel)
title('Velocita`')

    
% Secondo punto dell'esercizio 
A2 = [ A(1,:); A(2,:) ] ;
y2 = [-10; -1] 

I = eye(10); 
u = logspace(-4, 4,50); 
for i=1:50
  % vettore f
  f = inv(A2'*A2 + u(i) * I ) * A2' * y2 ;
  % calcolo J1, J2 con il nuovo vettore delle forze
  J1(i) = (norm( A2 * f - y2 ))^2;
  J2(i) = norm(f) ^ 2; 
end

% plot la curva di trade-off
hold on
figure (2)
plot(J2, J1); 
title ('Curva trade-off' ) ;
ylabel('J1 = p(10)^2 + p^{\bullet}(10)^2')
xlabel('J2 = ||x||^2')
      
 