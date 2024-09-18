% Este código identifica si un número es par o impar
% Método 1: utilizando mod

% Caso base: 0 es par
es_par(0) :- !.

% Caso base: 1 es impar
es_impar(1) :- !.

% Caso base: -1 es impar
es_impar(-1) :- !.

% Siguientes casos: N es par si mod 2 == 0
es_par(N) :-
    N mod 2 =:= 0.

es_impar(N) :-
    N mod 2 =\= 0.