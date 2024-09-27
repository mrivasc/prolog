calculo(N,M) :-
    M =:= 0,
    write(N).
calculo(N,M) :-
    N1 is N mod M,
    calculo(M,N1).