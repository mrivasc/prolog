/*
 * EJERCICIO: recibe una lista de listas y devuelve la suma total de las longitudes de todas las listas que contienen
 * al menos un número par. Si una lista no contiene números pares, entonces, su longitud no se suma.
 *
 * sumar_longitudes_con_par/2
 * 
 * @param ListaDeListas - Una lista de listas de números.
 * @param SumaTotal - La suma total de las longitudes de las sublistas que contienen al menos un número par.
 * 
 * Ejemplos de ejecución:
 * ?- sumar_longitudes_con_par([[1, 2, 3], [4, 5], [7, 8, 9, 10]], 0, SumaTotal).
 * SumaTotal = 9.

 * ?- sumar_longitudes_con_par([[1, 3, 5], [7, 9], [11]], 0, SumaTotal).
 * SumaTotal = 0.

 * ?- sumar_longitudes_con_par([[2, 4], [1, 3], [10, 12]], 0, SumaTotal).
 * SumaTotal = 4.

 * sumar_longitudes_con_par([ [1,3], [2,1], [6,2,8], [11,9,0]  ], SumaTotal). 
 * SumaTotal = 8
 */

sumar_longitudes_con_par(ListaDeListas, SumaTotal) :-
    sumar_longitudes_con_par(ListaDeListas, 0, SumaTotal).

% Caso base - cuando no quedan listas, retornamos la suma total
sumar_longitudes_con_par([], SumaActual, SumaActual) :- !.

% Caso recursivo 1 - la sublista contiene al menos un número par
sumar_longitudes_con_par([Sublista | Resto], SumaTemp, SumaTotal) :-
    contiene_par(Sublista), 
    longitud(Sublista, Longitud), 
    NuevaSuma is SumaTemp + Longitud, 
    sumar_longitudes_con_par(Resto, NuevaSuma, SumaTotal), !.

% Caso recursivo 2 - la sublista no contiene números pares
sumar_longitudes_con_par([_ | Resto], SumaTemp, SumaTotal) :-
    sumar_longitudes_con_par(Resto, SumaTemp, SumaTotal), !.

% Verifica si una lista contiene al menos un número par
contiene_par([Elemento | _]) :-
    Elemento mod 2 =:= 0, !.

contiene_par([_ | Resto]) :-
    contiene_par(Resto).

% Calcula la longitud de una lista de manera recursiva
longitud([], 0).
longitud([_ | Resto], Longitud) :-
    longitud(Resto, LongitudResto),
    Longitud is LongitudResto + 1.