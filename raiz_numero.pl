% Código para obtener la raíz x de un número n
% Se tiene que realizar n^(1/x), donde n es el número y x es la raíz

% Caso base: la raíz es negativa
raiz(Numero, _) :-
    Numero < 0, !,
    write('Error. La raiz es negativa.').

raiz(Numero, Raiz) :-
    is(Resultado, ^(Numero, 1/Raiz)),
    write('El resultado es: '), write(Resultado).