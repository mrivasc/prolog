/*
* Ejercicio 3
* Identificar aliados y enemigos
*/

% * Hechos
enemigo(rusia, ucrania).
enemigo(ucrania, rusia).
enemigo(rusia, japon).
enemigo(japon, rusia).
enemigo(el_salvador, honduras).
enemigo(vietnam, china).
enemigo(china, ucrania).

% * Reglas
aliado(Atacante, Enemigo, Aliado) :-
    enemigo(Atacante, Enemigo),
    enemigo(Enemigo, Atacante),
    enemigo(Aliado, Enemigo),
    Aliado \== Atacante,   % Aliado diferente del Atacante
    Aliado \== Enemigo,    % Aliado diferente del Enemigo
    Atacante \== Enemigo.  % Atacante diferente del Enemigo