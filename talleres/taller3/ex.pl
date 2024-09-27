% 1. Agregar elementos al inicio de una lista
agregar_elemento(Elemento, Lista, NuevaLista) :-
    =(NuevaLista, [Elemento | Lista]).

% eliminar_primero([1,2,3,4,5],Res).
% Res = [2, 3, 4, 5].


% 2. Eliminar el primer elemento de una lista
% eliminar_primero(Lista, NuevaLista) :-
%     =(Lista, [Cabeza | Cola]),
%     =(NuevaLista, Cola).

% agregar_elemento(1,[2,3,4],Res).
% Res = [1, 2, 3, 4].

% Forma más simplificada para quitar el primer elemento de una lista
eliminar_primero([_ | Cola], Cola) :- !.


% 3. Mostrar los elementos de una lista en orden de aparición
% Caso base: lista vacía
mostrar_elementos([]) :- !.

mostrar_elementos([Cabeza | Cola]) :-
    write(Cabeza), write(" "),
    mostrar_elementos(Cola).


% 4. Mostrar los elementos de una lista en orden inverso
% Caso base: lista vacía
mostrar_elementos_invertido([]) :- !.

mostrar_elementos_invertido([Cabeza | Cola]) :-
    mostrar_elementos_invertido(Cola),
    write(Cabeza), write(" ").


% 5. Buscar elemento en una lista y devolver su posición
% Caso base: el elemento buscado no está en la lista (-1)
buscar_elemento(_, [], _, -1) :- !.

% Caso recursivo
% buscar_elemento(Elemento, [Cabeza | _], Contador, Posicion) :-
%     ==(Elemento, Cabeza),
%     is(Posicion, Contador).

buscar_elemento(Elemento, [Elemento | _], Contador, Contador) :- !.   % cambio: se agrega el caso en que el elemento buscado sea la cabeza

% buscar_elemento(Elemento, [Cabeza | Cola], Contador, Posicion) :-
%     \==(Elemento, Cabeza),
%     is(NuevoContador, +(Contador, 1)),
%     % se envía solamente la cola porque sabemos que la cabeza no es el elemento que buscamos. a su vez, se envía el nuevo contador +1
%     buscar_elemento(Elemento, Cola, NuevoContador, Posicion).

buscar_elemento(Elemento, [_ | Cola], Contador, Posicion) :-
    is(NuevoContador, +(Contador, 1)),
    % se envía solamente la cola porque sabemos que la cabeza no es el elemento que buscamos. a su vez, se envía el nuevo contador +1
    buscar_elemento(Elemento, Cola, NuevoContador, Posicion).

realizar_busqueda(Elemento, Lista, Posicion) :-
    buscar_elemento(Elemento, Lista, 1, Posicion).


% 6. Contar ocurrencias de una lista
% Caso base: cuando la lista está vacía se devuelve el mismo contador que presente
contar_ocurrencias(_, [], Contador, Contador) :- !.

% Caso recursivo
contar_ocurrencias(Elemento, [Elemento | Cola], Contador, Resultado) :-
    is(NuevoContador, +(Contador, 1)),
    contar_ocurrencias(Elemento, Cola, NuevoContador, Resultado), !.

contar_ocurrencias(Elemento, [_ | Cola], Contador, Resultado) :-
    contar_ocurrencias(Elemento, Cola, Contador, Resultado).

% Regla para llamar sin enviar el contador
contar_ocurrencias(Elemento, Lista, Resultado) :-
    contar_ocurrencias(Elemento, Lista, 0, Resultado).


% 7. Eliminar todas las ocurrencias de un elemento en una lista
% eliminar_ocurrencias/3
% eliminar_ocurrencias(+Elemento, +Lista, -NuevaLista)
%
% Elimina todas las ocurrencias de un elemento en una lista.
%
% Parámetros:
%   +Elemento: El elemento que se desea eliminar de la lista.
%   +Lista: La lista original de la cual se eliminarán las ocurrencias del elemento.
%   -NuevaLista: La lista resultante después de eliminar todas las ocurrencias del elemento.
%
% Caso base:
%   Si la lista está vacía, la nueva lista también será vacía.
%
% Caso recursivo:
%   Si el primer elemento de la lista es el elemento a eliminar, se omite y se continúa con el resto de la lista.
%   Si el primer elemento de la lista no es el elemento a eliminar, se incluye en la nueva lista y se continúa con el resto de la lista.
% Caso base: lista vacía
eliminar_ocurrencias(_, [], []) :- !.

% Caso recursivo
eliminar_ocurrencias(Elemento, [Elemento | Cola], NuevaLista) :-
    eliminar_ocurrencias(Elemento, Cola, NuevaLista), !.

eliminar_ocurrencias(Elemento, [Cabeza | Cola], NuevaLista) :-
    eliminar_ocurrencias(Elemento, Cola, NuevaCola),
    =(NuevaLista, [Cabeza | NuevaCola]).
