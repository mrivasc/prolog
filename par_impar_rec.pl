% Este código identifica si un número es par o impar
% Método 2: utilizando recursividad

% Caso base: 0 es par
es_par(0) :- !.

% Caso general: N es par si N-2 es par.
% El objetivo de esta regla recursiva es llegar a 0, que es par.
es_par(N) :-
    N > 0,
    % N2 is N-2
    is(N2, -(N, 2)),
    es_par(N2).

% Para cubrir números negativos
es_par(N) :-
    N < 0,
    is(N2, +(N, 2)),
    es_par(N2).


% Caso base: 1 es impar
es_impar(1) :- !.

% Caso base: -1 es impar
es_impar(-1) :- !.

% Caso general: N es impar si N-2 es impar.
% El objetivo de esta regla recursiva es llegar a 1 o -1, que son impares.
es_impar(N) :-
    N > 1,
    is(N2, -(N, 2)),
    es_impar(N2).

% Para cubrir números negativos
es_impar(N) :-
    N < -1,
    is(N2, +(N, 2)),
    es_impar(N2).