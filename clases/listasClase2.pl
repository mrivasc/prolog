% Longitud de una lista
/**
 * longitud/2
 * 
 * Calculates the length of a list.
 * 
 * Usage:
 *   longitud([a, b, c], Length).
 *   % Length will be 3.
 * 
 * Base Case:
 *   longitud([], 0).
 *   % The length of an empty list is 0.
 * 
 * Recursive Case:
 *   longitud([_|Resto], Longitud).
 *   % The length is calculated by recursively finding the length of the tail (Resto)
 *   % and adding 1 to it.
 */

longitud([], 0) :- !.
longitud([_|Resto], Longitud) :-
    longitud(Resto, LongitudResto), 
    Longitud is LongitudResto + 1.

/**
 * sumatoria/2
 * 
 * sumatoria(+Lista, -Sumatoria)
 * 
 * Calcula la sumatoria de los elementos de una lista.
 * 
 * @param Lista Una lista de números.
 * @param Sumatoria La sumatoria de los elementos de la lista.
 */
sumatoria([], 0) :- !.
sumatoria([Cabeza|Cola], Sumatoria) :-
    sumatoria(Cola, SumatoriaResto),
    Sumatoria is SumatoriaResto + Cabeza.

/**
 * unir_lista/3
 * 
 * unir_lista(+Lista1, +Lista2, -Resultado)
 * 
 * Unifica Resultado con la lista obtenida al concatenar Lista1 y Lista2.
 * 
 * @param Lista1 La primera lista a concatenar.
 * @param Lista2 La segunda lista a concatenar.
 * @param Resultado La lista resultante de la concatenación de Lista1 y Lista2.
 */
unir_lista([], Lista, Lista).
unir_lista([Cabeza|Cola], Lista, [Cabeza|RestoLista]) :-
    unir_lista(Cola, Lista, RestoLista).