% Código para determinar si un número es primo (true) o no (false)
% Empezarmos a evaluar casos base como que el número 2 y 3 son primos

% Caso base: un número menor o igual a 1 no es primo
es_primo(N) :- 
    N =< 1, !, fail.

% El número 2 es primo
es_primo(2) :- !.  % Corte aquí para evitar búsqueda adicional después de encontrar que 2 es primo.

% El número 3 es primo
es_primo(3) :- !.  % Corte aquí para evitar búsqueda adicional después de encontrar que 3 es primo.

% Verifica los divisores, comenzando en 2
es_primo(N) :-
    N > 3,
    N mod 2 =\= 0, % Elimina los múltiplos de 2
    es_primo(N, 3).

% Caso de éxito: si Div^2 > N, entonces N es primo
es_primo(N, Div) :-
    Div * Div > N, !.

% Caso de fallo: si N es divisible por Div, entonces N no es primo
es_primo(N, Div) :-
    N mod Div =:= 0, !, fail.

% Si no es divisible, incrementa el divisor en 2 (para probar solo impares)
es_primo(N, Div) :-
    Div2 is Div + 2,
    es_primo(N, Div2).
