% * EJERCICIO 8
% Hacer un predicado que establezca la relación entre una lista, y otra que tiene 
% los datos de la primera, pero sin repetidos consecutivos.

% Caso base: listas vacías
lista_sin_repetidos_consecutivos([], []).

% Caso base: misma lista
lista_sin_repetidos_consecutivos([X], [X]).

% Si el primer elemento es igual al segundo, omitimos el primero
lista_sin_repetidos_consecutivos([X, X|T], L) :-
    lista_sin_repetidos_consecutivos([X|T], L).

% Si el primer elemento es distinto al segundo, incluimos el primero
lista_sin_repetidos_consecutivos([X, Y | T], [X | L]) :-
    X \= Y,
    lista_sin_repetidos_consecutivos([Y | T], L).

% Ejemplo de uso:
% ?- lista_sin_repetidos_consecutivos([1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 4], L).
% L = [1, 2, 3, 4] ;


% * EJERCICIO 12
% Hacer un predicado que establezca la relación entre una lista, un número
% entero N, y otra lista que equivale a la primera pero con los datos que estaban
% en cada N posiciones eliminados.

% Predicado principal que inicia el contador en 1
% Predicado principal que inicia el contador en 1
remove_every_nth(List, N, ResultList) :-
    remove_every_nth(List, N, 1, ResultList).

% Caso base: una lista vacía produce una lista vacía
remove_every_nth([], _, _, []).

% Si la posición actual es múltiplo de N, omitimos el elemento
remove_every_nth([_|Tail], N, Count, Result) :-
    Count mod N =:= 0,  % Verifica si la posición actual es múltiplo de N
    NextCount is Count + 1,  % Incrementa el contador
    remove_every_nth(Tail, N, NextCount, Result).  % Llama recursivamente con la cola de la lista

% Si la posición actual no es múltiplo de N, incluimos el elemento
remove_every_nth([Head|Tail], N, Count, [Head|ResultTail]) :-
    Count mod N =\= 0,  % Verifica si la posición actual no es múltiplo de N
    NextCount is Count + 1,  % Incrementa el contador
    remove_every_nth(Tail, N, NextCount, ResultTail).  % Llama recursivamente con la cola de la lista

% Ejemplo de uso:
% ?- remove_every_nth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3, L).
% L = [1, 2, 4, 5, 7, 8, 10] ;
