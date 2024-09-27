% Ejercicio: Insertar un elemento en una lista en una posición dada
% Lista vacía
insertar_en_posicion(Elemento, _, [], [Elemento]) :- !.

% Casos bases: insertar en la primera posición
insertar_en_posicion(Elemento, 1, Lista, [Elemento|Lista]) :- !.


% Caso recursivo: insertar en otra posición
insertar_en_posicion(Elemento, Posicion, [Cabeza|Cola], [Cabeza|Resultado]) :-
    % Comprobamos que la posición donde se quiere insertar es mayor que 1.
    Posicion > 1,
    
    % Calculamos la nueva posición como Posicion - 1, avanzando recursivamente hacia la posición deseada.
    is(NuevaPosicion, -(Posicion, 1)),
    
    % Se sigue procesando la cola hasta que llegamos a la posición correcta para insertar.
    insertar_en_posicion(Elemento, NuevaPosicion, Cola, Resultado), !.
    
    % El corte (`!`) garantiza que, una vez que hemos insertado el elemento en la posición deseada,
    % no se intenten otras soluciones en el backtracking.

% ========================================= %
% Ejemplos de ejecución
% insertar_en_posicion(5, 2, [1,2,3,4], R).
% R = [1, 5, 2, 3, 4]

% insertar_en_posicion(c, 3, [a,b,d,e], R). 
% R = [a, b, c, d, e] 

% insertar_en_posicion(c,5,[a,b,d,e],R). 
% R = [a, b, d, e, c].