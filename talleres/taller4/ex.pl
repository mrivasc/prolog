/*
 * EJERCICIO 1 - recorrer una lista de listas
 * recorrer_lista/1
 * 
 * Recursively traverses a list, printing each element.
 * 
 * @param List The list to be traversed.
 * 
 * Base Case:
 * - An empty list is handled by the first clause, which stops the recursion.
 * 
 * Recursive Case:
 * - The head of the list (an element) is printed.
 * - The tail of the list (remaining elements) is processed by the recursive call to recorrer_lista/1.
*/
recorrer_lista_de_listas([]) :- !.

% Caso recursivo
recorrer_lista_de_listas([Sublista | RestoDeListas]) :-
    recorrer_lista(Sublista),
    recorrer_lista_de_listas(RestoDeListas).

% Caso base - recorrido de lista
recorrer_lista([]) :- !.

% Caso recursivo - recorrido de lista
recorrer_lista([Elemento | RestoDeElementos]) :-
    write(Elemento), nl,
    recorrer_lista(RestoDeElementos).

/* ********************************************************************************* */

/*
 * 
 * EJERCICIO 2 - reemplazar el elemento X por Y en una lista
 * 
 * reemplazar(ValorAntiguo, ValorNuevo, ListaDeListas, NuevaLista)
 * 
 * Este predicado reemplaza todas las ocurrencias de un valor antiguo (ValorAntiguo) 
 * por un valor nuevo (ValorNuevo) en una lista de listas (ListaDeListas), 
 * generando una nueva lista de listas (NuevaLista).
 * 
 * - Caso base: Si la lista de listas está vacía, la nueva lista también será vacía.
 * - Caso recursivo: Para cada sublista en la lista de listas, se reemplazan sus elementos 
 *   y se procesa el resto de las sublistas.
 * 
 * reemplazar_en_sublista(ValorAntiguo, ValorNuevo, Sublista, SublistaReemplazada)
 * 
 * Este predicado reemplaza todas las ocurrencias de un valor antiguo (ValorAntiguo) 
 * por un valor nuevo (ValorNuevo) en una sublista (Sublista), generando una nueva sublista 
 * (SublistaReemplazada).
 * 
 * - Caso base: Si la sublista está vacía, la nueva sublista también será vacía.
 * - Caso recursivo 1: Si el valor actual es igual al valor a reemplazar, se reemplaza 
 *   y se continúa con el resto de los elementos.
 * - Caso recursivo 2: Si el valor actual no es igual al valor a reemplazar, se mantiene 
 *   el valor actual y se continúa con el resto de los elementos.

 * Ejemplo de uso:
    * ?- reemplazar(1, 2, [[1, 2, 3], [4, 5, 6], [7, 8, 9]], NuevaLista).
    * NuevaLista = [[2, 2, 3], [4, 5, 6], [7, 8, 9]].
    *
 */

% Caso base - lista de listas vacía
reemplazar(_, _, [], []) :- !.

% Caso recursivo - para cada sublista reemplazar sus elementos y procesar el resto de listas
reemplazar(ValorAntiguo, ValorNuevo, [Sublista | OtrasSublistas], [SublistaReemplazada | OtrasSublistasReemplazadas]) :-
    reemplazar_en_sublista(ValorAntiguo, ValorNuevo, Sublista, SublistaReemplazada),
    reemplazar(ValorAntiguo, ValorNuevo, OtrasSublistas, OtrasSublistasReemplazadas), !.

% Caso base - si la sublista a reemplazar está vacía, entonces, retornar la lista vacía
reemplazar_en_sublista(_, _, [], []) :- !.

% Caso recursivo 1 - si el valor actual = valor a reemplazar
reemplazar_en_sublista(ValorAntiguo, ValorNuevo, [ValorAntiguo | RestoDeElementos], [ValorNuevo | RestoDeElementosReemplazados]) :-
    reemplazar_en_sublista(ValorAntiguo, ValorNuevo, RestoDeElementos, RestoDeElementosReemplazados), !.

% Caso recursivo 2 - si el valor actual != valor a reemplazar
reemplazar_en_sublista(ValorAntiguo, ValorNuevo, [Elemento | RestoDeElementos], [Elemento | RestoDeElementosReemplazados]) :-
    reemplazar_en_sublista(ValorAntiguo, ValorNuevo, RestoDeElementos, RestoDeElementosReemplazados), !.

/* ********************************************************************************* */

/*
 * 
 * EJERCICIO 3 - contar ocurrencias de números pares en una lista de listas
 * 
 * contar_listas_pares/2:
 *   - Predicado principal que cuenta el número de sublistas que contienen solo números pares.
 *   - Parámetros:
 *     - ListaDeListas: Lista de listas de números.
 *     - ConteoTotal: Variable donde se almacenará el conteo total de sublistas con solo números pares.
 * 
 * contar_listas_pares/3:
 *   - Predicado auxiliar que realiza el conteo de sublistas con solo números pares.
 *   - Parámetros:
 *     - ListaDeListas: Lista de listas de números.
 *     - ConteoActual: Conteo acumulado de sublistas con solo números pares.
 *     - ConteoTotal: Variable donde se almacenará el conteo total de sublistas con solo números pares.
 * 
 *   - Caso base:
 *     - Cuando la lista de listas está vacía, el conteo actual es el conteo total.
 * 
 *   - Caso recursivo 1:
 *     - Si todos los elementos de la sublista actual son pares, se incrementa el conteo temporal y se continúa con el resto de la lista.
 * 
 *   - Caso recursivo 2:
 *     - Si no todos los elementos de la sublista actual son pares, se continúa con el resto de la lista sin incrementar el conteo temporal.
 * 
 * todos_pares/1:
 *   - Predicado auxiliar que verifica si todos los elementos de una lista son números pares.
 *   - Parámetros:
 *     - Lista: Lista de números a verificar.
 * 
 *   - Caso base:
 *     - Una lista vacía se considera que tiene todos sus elementos pares.
 * 
 *   - Caso recursivo:
 *     - Si el primer elemento de la lista es par, se verifica el resto de la lista.
 */
% Predicado principal
contar_listas_pares(ListaDeListas, ConteoTotal) :-
    contar_listas_pares(ListaDeListas, 0, ConteoTotal).

% Caso base - cuando no quedan listas, retornamos el conteo
contar_listas_pares([], ConteoActual, ConteoActual) :- !.

% Caso recursivo 1 - todos los elementos de la sublista son pares
contar_listas_pares([Sublista | Resto], ConteoTemp, ConteoTotal) :-
    todos_pares(Sublista),        % Verificamos si todos son pares
    NuevoConteo is ConteoTemp + 1, % Incrementamos el conteo
    contar_listas_pares(Resto, NuevoConteo, ConteoTotal), !.

% Caso recursivo 2 - no todos los elementos de la sublista son pares
contar_listas_pares([_ | Resto], ConteoTemp, ConteoTotal) :-
    contar_listas_pares(Resto, ConteoTemp, ConteoTotal), !.

% Función auxiliar todos_pares
% Caso base: una lista vacía tiene todos los elementos pares
todos_pares([]) :- !.

% Caso recursivo: comprobamos si el primer elemento es par, y seguimos con el resto
todos_pares([Elemento | Resto]) :-
    Elemento mod 2 =:= 0, % Comprobamos que el elemento es par
    todos_pares(Resto).

/* ********************************************************************************* */

% ! EJERCICIO 3: longitud máxima de una lista de listas (FORMA UNO)
longitud_lista_mas_larga([], 0) :- !.

% Caso recursivo - comparar la longitud de la lista actual con el resto de las listas
longitud_lista_mas_larga([PrimeraLista | RestoDeListas], LongitudMaxima) :-
    length(PrimeraLista, LongitudActual),
    longitud_lista_mas_larga(RestoDeListas, LongitudResto),
    LongitudMaxima is max(LongitudActual, LongitudResto).

/* ********************************************************************************* */

% ! EJERCICIO 3: longitud máxima de una lista de listas (FORMA DOS)
longitud_lista_mas_larga_2([], 0) :- !.
% Caso recursivo - comparar la longitud de la lista actual con el resto de las listas
longitud_lista_mas_larga_2([PrimeraLista | RestoDeListas], LongitudMaxima) :-
    longitud_lista(PrimeraLista, LongitudPrimera),
    longitud_lista_mas_larga(RestoDeListas, LongitudResto),
    maximo_numero(LongitudPrimera, LongitudResto, LongitudMaxima).

% Función auxiliar para calcular la longitud de una lista
longitud_lista([], 0) :- !.

longitud_lista([_ | Resto], Longitud) :-
    longitud_lista(Resto, LongitudResto),
    Longitud is LongitudResto + 1.  

% Función auxiliar para calcular el máximo entre dos números
maximo_numero(A, B, A) :- A >= B, !.

maximo_numero(A, B, B) :- B > A.
