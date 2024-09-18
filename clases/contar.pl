contar(A, B) :-
    =:=(A,B),
    writeln(B),
    !.

contar(A, A) :-
    writeln(A),
    !. 

contar(A, B) :-
    writeln(A),
    is(A1, +(A, 1)),
    contar(A1, B).

contar_intervalo(A, A, 1) :- !.

contar_intervalo(A, B, N) :-
    is(A1, +(A, 1)),
    contar_intervalo(A1, B, N1),
    is(N, +(N1, 1)).