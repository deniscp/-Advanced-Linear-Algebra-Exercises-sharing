%{
   DOMANDA 1
   
   Obiettivo
   Trovare le costanti che minimizzano la funzione J:
    J = (1/N) * sommatoria((log(T_model_i/T_i))^(2))
   Considerando che:
    T_model(l) = C * l^(B) * l^(g*l)
    l e T appartengono a R^(mxn)


   Soluzione
   Per minimizzare la funzione J modifichiamo la funzione logaritmica al suo interno:
    log(T_model_i/T_i) = log(T_model_i) - log(T_i) =
                       = log(C * l_i^(B) * l_i^(g*l_i)) - log(T_i) =
                       = log(C) + log(l_i^(B)) + log(l_i^(g*l_i)) - log(T_i) =
                       = log(C) + B*log(l_i) + g*l_i*log(l_i) - log(T_i)
   
   Considero:
    x = [log(C) ;    
           B    ; 
           g    ]
    x appartiene a R^(nxp) dove p = numero di costanti (in questo caso 3)
   
    b = [log(T_i)]

    a_i = [1  log(l_i)  l_i*log(l_i)] 
    A = [a_1;  a_2;  ...;  a_m]
    A appartiene a R^(mxp)

   Di conseguenza:
    log(T_model_i/T_i) = log(C) + B*log(l_i) + g*l_i*log(l_i) - log(T_i) =
                       = A*x - b
   
   Abbiamo ricondotto la funzione non lineare ad una funzione affine.
   
   La funzione J pu� essere riscritta come:
    J = (1/N) * sommatoria(A*x - b)^(2))
   riconducendo il nostro problema ad un problema di least squares 
   
   Per calcolare x utilizziamo la seguente formula (A deve essere into):
    x = (A' * A)^(-1) * A' * y
    dove A � la nostra matrice A
         y � la nostra matrice b
        (A' * A)^(-1) * A' = pseudoinversa di A
   
   Ricordando che otterremo:
    x = [log(C) ;    
           B    ; 
           g    ]
   dovremo modificare la soluzione per ottenere il valore di C
    C = e^(x(1))
   
   Dato che abbiamo ricondotto il nostro problema ad un problema di least
    squares, possiamo dichiarare che questa soluzione riconduce sempre al
    minimo valore globale di J. Se avessimo dovuto usare il metodo della
    linearizzazione, il minimo valore ottenuto di J sarebbe stato locale.
   
   Per poter utilizare la formula:
    x = pseudoinverse_A * y
   la matrice A deve essere into, ovvero deve essere full rank skinny.
   Quindi dato che A appartiene a R^(mxp) deve valere:
    rank(A) = min(m,p)
    m >= p  ---> rank(A) = p
%}

   
%{
   DOMANDA 2
   
   Applica il metodo calcolato precedentemente sui dati all'interno del
    file empacII_data.m e calcola i valori di C, B, g e il valore
    corrispondente a J.
%}

% Dati provenienti dal file empacII_data
l =[17
    80
    32
    53
    17
    61
    27
    66
    69
    75
    46
     9
    23
    92
    16
    83
    54
   100
     8
    45
    11
    97
     1
    78
    82
    87
     9
    40
    26
    81
    44
    92
    19
    27
    15
    14
    87
    58
    55
    15
    86
    63
    36
    52
    41
     8
    24
    13
    19
    24
    42
     5
    91
    95
    50
    49
    34
    91
    37
    12
    79
    39
    25
    41
    10
    14
    95
    96
    58
     6
    24
    36
    83
     2
     5
    17
    65
    74
    65
    46
    55
    30
    75
    19
    69
    19
    37
    63
    79
     9
    93
    78
    49
    44
    45
    31
    51
    52
    82
    80];

T =   1.0e+04 *[   0.000000000447813
   0.009760384308405
   0.000000039134240
   0.000010016593270
   0.000000000447813
   0.000077754813847
   0.000000009618349
   0.000278087962435
   0.000596562117644
   0.002740777035068
   0.000001636905804
   0.000000000020030
   0.000000002979517
   0.206291564437725
   0.000000000318720
   0.020916130993005
   0.000012953620715
   1.584893192461114
   0.000000000012262
   0.000001261076165
   0.000000000048588
   0.737338150380910
   0.000000000000010
   0.005872573063303
   0.016223045200313
   0.057814487774767
   0.000000000020030
   0.000000338596106
   0.000000007210903
   0.012583313585844
   0.000000970912311
   0.206291564437725
   0.000000000862956
   0.000000009618349
   0.000000000224666
   0.000000000156613
   0.057814487774767
   0.000036122660143
   0.000016746430612
   0.000000000224666
   0.044835278433362
   0.000129507192271
   0.000000116309008
   0.000007742787139
   0.000000441159343
   0.000000000012262
   0.000000004014742
   0.000000000107764
   0.000000000862956
   0.000000004014742
   0.000000574290468
   0.000000000002026
   0.159933331614303
   0.442886942694434
   0.000004621117614
   0.000003567731517
   0.000000067669968
   0.159933331614303
   0.000000152182213
   0.000000000073025
   0.007570866557667
   0.000000259633704
   0.000000005389569
   0.000000441159343
   0.000000000031623
   0.000000000156613
   0.442886942694434
   0.571429105603431
   0.000036122660143
   0.000000000003972
   0.000000004014742
   0.000000116309008
   0.020916130993005
   0.000000000000091
   0.000000000002026
   0.000000000447813
   0.000215578841066
   0.002125906802376
   0.000215578841066
   0.000001636905804
   0.000016746430612
   0.000000022470948
   0.002740777035068
   0.000000000862956
   0.000596562117644
   0.000000000862956
   0.000000152182213
   0.000129507192271
   0.007570866557667
   0.000000000020030
   0.266105413164255
   0.005872573063303
   0.000003567731517
   0.000000970912311
   0.000001261076165
   0.000000029683134
   0.000005982885689
   0.000007742787139
   0.016223045200313
   0.009760384308405];

% Composizione vettore di logaritmi dei runtime
log_T = log(T);

% Composizione vettore di logaritmi delle lunghezze
log_l = log(l);

% Composizione vettore di logaritmi delle lunghezze moltiplicati per le
%   lunghezze corrispondenti
llog_l = [];
for i = 1: size(l,1)
    llog_l(i) = l(i)*log_l(i);
end
llog_l = llog_l';

% Composizione della matrice A
A = [ones(size(llog_l,1),1)  log_l  llog_l];

% Controllo che la matrice A sia into
controllo1 = size(A,1) >= size(A,2);
controllo2 = rank(A) == size(A,2);

% Calcolo dei least squares (log(C), B, g): x = pseudoinverse_A * y
Xleast = (A' * A)^(-1) * A' * log_T;

% Calcolo C (C, B, g)
Xleast(1) = exp(Xleast(1));

% Costruzione vettore dei risultati J
J = 0;
for i = 1: size(l,1)
    J = J + (log(Xleast(1)) + Xleast(2)*log_l(i) + Xleast(3)*l(i)*log_l(i) - log_T(i))^(2);
end

J = J/size(l,1);