% FACTORIAL
factorial(0,1) :- write('El factorial de 0 es 1'), !.
factorial(1,1) :- !.

factorial(N, X) :- 
    N > 0,  % Asegurarse de que N es positivo
    Anterior is N - 1, 
    factorial(Anterior, Y),
    X is N * Y.

% Desarrolla un predicado en Prolog que calcule el numero de permutaciones posibles de un conjunto de n elementos tomados de r en r. la formula para calcular el numero de permutacion es: nPr = (n!) / (n-r)! El predicado debe recibir dos argumentos: n: el numero total de elementos r: el numero de elemntos a tomar
permutaciones(NElementos, RTomados, Permutaciones) :-
    NElementos >= RTomados,                         % Asegurarse de que NElementos es mayor o igual a RTomados
    factorial(NElementos, FactorialN),              % Calcular el factorial de NElementos
    Diferencia is NElementos - RTomados,            % Calcular NElementos - RTomados
    factorial(Diferencia, FactorialDiferencia),     % Calcular el factorial de la diferencia
    Permutaciones is FactorialN // FactorialDiferencia. % Calcular el número de permutaciones