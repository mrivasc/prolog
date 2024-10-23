/*
 * Tarea: Implementa un predicado nodos_pares/2 que reciba un árbol binario de búsqueda (BST) y devuelva una lista con todos
 * los valores de los nodos que sean pares.
 * 
 * Caso base:
 * nodos_pares([], [])
 * Este caso maneja el árbol vacío, devolviendo una lista vacía.
 * 
 * Caso recursivo:
 * nodos_pares([Valor, Izq, Der], Pares)
 * Este caso maneja los nodos cuyo valor es par. Se verifica si el valor del nodo es par, 
 * luego se llama recursivamente a los subárboles izquierdo y derecho, y se combinan los resultados.
 * 
 * nodos_pares([_, Izq, Der], Pares)
 * Este caso maneja los nodos cuyo valor no es par. Se llama recursivamente a los subárboles izquierdo y derecho, y se combinan los resultados.
 *
 * Ejemplos de ejecución:
 ?- nodos_pares([33, [19, [10, [9, [], []], [15, [], []]], [22, [], []]], [36, [34, [], []], [38, [], []]]], Pares).
 * Pares = [10, 22, 36, 34, 38].

 ?- nodos_pares([8, [3, [1, [], []], [6, [4, [], []], [7, [], []]]], [10, [], [14, [13, [], []], []]]], Pares).
 * Pares = [8, 6, 4, 14].

 ?- nodos_pares([5, [3, [2, [], []], [4, [], []]], [8, [7, [], []], [9, [], []]]], Pares).
 * Pares = [2, 4, 8].
*/

% Caso base
nodos_pares([], []) :- !.

% Caso recursivo
nodos_pares([Valor, Izq, Der], Pares) :-
    0 is mod(Valor, 2),
    nodos_pares(Izq, ParesIzq),
    nodos_pares(Der, ParesDer),
    append([Valor], ParesIzq, ParesTemp),
    append(ParesTemp, ParesDer, Pares), !.

nodos_pares([_, Izq, Der], Pares) :-
    nodos_pares(Izq, ParesIzq),
    nodos_pares(Der, ParesDer),
    append(ParesIzq, ParesDer, Pares), !.

