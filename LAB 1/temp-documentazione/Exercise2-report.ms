.TL 
Lab 1 - Report esercizio 2
.AU 
Nomi brutti 
.AI 
Politecnico di Milano 
.AB

.AE 

.EQ
delim $$
.EN

.SH Soluzione 
.PP 
Per modellare questo problema, vogliamo utilizzare la funzione dei least squares, 
in modo da minimizzare l'errore dovuto dalle rielazione nella formula $y = Ax + v$,
dove 
.B v 
e' un disturbo piccolo centrato in 0

I termini noti per questo scenario sono l'insieme dei vettori di input
.EQ
x(1), ... , x(N) ~  \[mo] ~ \[Re] sup n 
.EN 
E l'insieme corrispettivo dei vettori di output
.EQ
y(1), ... , y(N) ~  \[mo] ~ \[Re] sup m
.EN
Il problema ora consiste nel minimizzare la funzione 
.EQ
J =  sum from k=1 to N ||Ax(k) - y(k)|| sup 2
.EN 
Notando che il termine non noto del quale produrre una versionen LS e` la matrice 
.EQ
A ~ \[mo] ~ \[Re] sup { mxn } 
.EN


