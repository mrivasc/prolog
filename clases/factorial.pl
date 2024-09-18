% FACTORIAL
factorial(0,1) :- write('El factorial de 0 es 1'), !.
factorial(1,1) :- !.

factorial(N, X) :- 
    N > 0,  % Asegurarse de que N es positivo
    Anterior is N - 1, 
    factorial(Anterior, Y),
    X is N * Y.