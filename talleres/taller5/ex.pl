%* 1. Escribe un predicado que calcule la altura de un árbol binario. La profundidad es la longitud del camino
%* más largo desde la raíz hasta una hoja.

% Caso base
altura([],0) :- !.

% Caso recursivo
altura([_, Izq, Der], Altura) :- 
    altura(Izq, AlturaIzq),
    altura(Der, AlturaDer),
    is(AlturaMax, max(AlturaIzq, AlturaDer)),
    is(Altura, AlturaMax + 1).

% [8, [3, [1, [], []], [6, [4, [], []], [7, [], []]]], [10, [], [14, [13, [], []], []]]]
% Altura 4

% ?- altura([5, [3, [2, [], []], [4, [], []]], [8, [7, [], []], [9, [], []]]], Altura).
% Altura = 3.

%* Un árbol binario es balanceado si la diferencia de altura entre sus subárboles izquierdo y derecho es como máximo 1 en cada nodo.
%* Escribe un predicado que determine si un árbol es balanceado

% Caso base
es_balanceado([]) :- !.

% Caso recursivo
es_balanceado([_, Izq, Der]) :- 
    altura(Izq, AlturaIzq),
    altura(Der, AlturaDer),
    is(Diferencia, abs(AlturaIzq - AlturaDer)),
    Diferencia =< 1,
    es_balanceado(Izq),
    es_balanceado(Der). 

% Caso de prueba
% [5, [3, [2, [], []], [4, [], []]], [8, [7, [], []], [9, [], []]]]
% Es balanceado

% [8, [3, [1, [], []], [6, [4, [], []], [7, [], []]]], [10, [], [14, [13, [], []], []]]]
% No es balanceado

%* Implementa un predicado en Prolog que cuente el número de hojas (aquellos que no tienen hijos) y el número de nodos internos
%* (aquellos que tienen al menos un hijo) en un árbol binario dado. El predicado debe devolver ambos resultados en una sola llamada

% Caso base: árbol vacío
contar_nodos([], 0, 0) :- !.

% Caso recursivo: llegué a una hoja
contar_nodos([_, [],[]], 1, 0) :- !.

% Caso recursivo: llegué a un nodo interno
contar_nodos([_, Izq, Der], Hojas, Internos) :- 
    contar_nodos(Izq, HojasIzq, InternosIzq),
    contar_nodos(Der, HojasDer, InternosDer),
    is(Hojas, HojasIzq + HojasDer),
    is(Internos, InternosIzq + InternosDer + 1).

%* Ejercicio 4

% Caso base
buscar_rango([], _, _, []).

% Caso recursivo
buscar_rango([Valor, Izq, Der], Max, Min, Res) :-
    Valor >= Min,
    Valor =< Max,
    buscar_rango(Izq, Max, Min, ResIzq),
    buscar_rango(Der, Max, Min, ResDer),
    append(ResIzq, [Valor|ResDer], Res), !.

buscar_rango([Valor, _, Der], Max, Min, Res) :-
    Valor < Min,
    buscar_rango(Der, Max, Min, Res), !.

buscar_rango([Valor, Izq, _], Max, Min, Res) :-
    Valor > Max,    
    buscar_rango(Izq, Max, Min, Res), !.

%* Ejercicio 5. Crear un predicado que verificque si un árbol es un árbol de búsqueda binaria
es_arbol_busqueda([]) :- !.

% Caso recursivo
es_arbol_busqueda([Valor, Izq, Der]) :-
    todos_menores(Izq, Valor),
    todos_mayores(Der, Valor),
    es_arbol_busqueda(Izq),
    es_arbol_busqueda(Der).

% Caso base: todos menores
todos_menores([], _) :- !.

% Caso recursivo
todos_menores([Valor, Izq, Der], Limite) :-
    Valor < Limite,
    todos_menores(Izq, Limite),
    todos_menores(Der, Limite).

% Caso base: todos mayores
todos_mayores([], _) :- !.

% Caso recursivo
todos_mayores([Valor, Izq, Der], Limite) :-
    Valor > Limite,
    todos_mayores(Izq, Limite),
    todos_mayores(Der, Limite).