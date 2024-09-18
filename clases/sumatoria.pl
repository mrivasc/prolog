% SUMATORIA
sumatoria(0,0) :- !.
sumatoria(N, X) :- 
    Anterior is N - 1,
    sumatoria(Anterior, Y),
    X is N + Y.