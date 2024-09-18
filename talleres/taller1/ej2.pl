/*
* Determinar si comprar un juego o no. A su vez
*/

% * Hechos
% juego_disponible/1
juego_disponible(minecraft).
juego_disponible(fortnite).
juego_disponible(lol).
juego_disponible(overwatch).
juego_disponible(roblox).
juego_disponible(valorant).
juego_disponible(rocket_league).
juego_disponible(totk).
juego_disponible(gta_v).

% * Relaciones
% tiene/2
tiene(javito, minecraft).
tiene(pepito, fortnite).
tiene(rodri, totk).

% * Reglas
% comprar_juego/1
comprar_juego(Juego) :-
    juego_disponible(Juego),
    not(tiene(javito, Juego)),
    not(tiene(pepito, Juego)),
    not(tiene(rodri, Juego)).
    % not(tiene(_, Juego)). % Otra forma de hacerlo