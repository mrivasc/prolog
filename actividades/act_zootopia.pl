animal(nick).
animal(bellweather).
animal(sra_nutriales).
animal(bogo).
animal(gazelle).
animal(stuart).
animal(bonnie).
animal(judy).
animal(otto).
animal(duke).
animal(doug).
animal(mr_big).
animal(mrs_big).
animal(frubelina).
animal(gideon).
animal(jesse).
animal(woolter).
animal(emmitt).
animal(manchas).
carnivoro(nick).
carnivoro(sra_nutriales).
carnivoro(duke).
carnivoro(gideon).
carnivoro(emmitt).
carnivoro(manchas).
herbivoro(stuart).
herbivoro(bonnie).
herbivoro(judy).
herbivoro(bellweather).
herbivoro(otto).
herbivoro(bogo).
herbivoro(doug).
herbivoro(jesse).
herbivoro(woolter).
insectivoro(mr_big).
insectivoro(mrs_big).
insectivoro(frubelina).
mamifero(nick).
mamifero(judy).
mamifero(bogo).
mamifero(emmitt).
mamifero(bellweather).
mamifero(manchas).
roedor(mr_big).

conocido(nick, judy).
conocido(judy, nick).
conocido(nick, bogo).
conocido(bogo, nick).
conocido(judy, bogo).
conocido(bogo, judy).
conocido(judy, bellweather).
conocido(bellweather, judy).
conocido(judy, duke).
conocido(duke, judy).
conocido(judy, leonzalez).
conocido(leonzalez, judy).
conocido(judy, doug).
conocido(doug, judy).
conocido(judy, woolter).
conocido(woolter, judy).
conocido(judy, sra_nutriales).
conocido(sra_nutriales, judy).
conocido(otto, judy).
conocido(judy, mr_big).
conocido(judy, frubelina).
conocido(frubelina, judy).
conocido(judy, gideon).
conocido(gideon, judy).
conocido(judy, jesse).
conocido(jesse, judy).
conocido(judy, benjamin).
conocido(benjamin, judy).
le_agrada(nick, judy).
le_agrada(judy, nick).
le_agrada(bogo, judy).
le_agrada(judy, bogo).
le_agrada(nick, bogo).
le_agrada(bogo, nick).
le_agrada(benjamin, bogo).
le_agrada(bogo, benjamin).
le_agrada(leonzalez, bogo).
le_agrada(bogo, leonzalez).
le_agrada(gideon, judy).
le_agrada(judy, gideon).
le_agrada(benjamin, judy).
le_agrada(judy, benjamin).
le_agrada(judy, frubelina).
le_agrada(frubelina, judy).
le_agrada(gazelle, judy).
le_agrada(sra_nutriales, judy).
le_agrada(judy, sra_nutriales).
le_agrada(bogo, sra_nutriales).
le_agrada(sra_nutriales, bogo).
le_agrada(stuart, gideon).
le_agrada(gideon, stuart).
le_agrada(judy, leonzalez).
le_agrada(leonzalez, judy).
le_agrada(nick, leonzalez).
le_agrada(leonzalez, nick).
le_agrada(bellweather, doug).
le_agrada(doug, bellweather).
le_agrada(woolter, doug).
le_agrada(doug, woolter).
le_agrada(jesse, doug).
le_agrada(doug, jesse).
le_agrada(gazelle, bogo).
no_le_agrada(bellweather, judy).
no_le_agrada(judy, bellweather).
no_le_agrada(bellweather, nick).
no_le_agrada(nick, bellweather).
no_le_agrada(bellweather, sra_nutriales).
no_le_agrada(sra_nutriales, bellweather).
no_le_agrada(judy, duke).
no_le_agrada(duke, judy).
no_le_agrada(nick, duke).
no_le_agrada(duke, nick).
no_le_agrada(mr_big, duke).
no_le_agrada(duke, mr_big).
no_le_agrada(frubelina, duke).
no_le_agrada(duke, frubelina).
no_le_agrada(bellweather, leonzalez).
no_le_agrada(judy, doug).
no_le_agrada(doug, judy).
no_le_agrada(nick, doug).
no_le_agrada(doug, nick).

antagonista(bellweather).
antagonista(duke).
antagonista(doug).
antagonista(woolter).

policia(bogo).
policia(benjamin).
policia(judy).

desaparecido(emmitt).
desaparecido(manchas).

%  Padres
padre(mr_wilde, nick).      % Mr. Wilde es el padre de Nick
padre(otto, bonnie).        % Otto Hopps es el padre de Bonnie
padre(otto, terry).         % Otto Hopps es el padre de Terry
padre(stuart, timmy).       % Stuart es el padre de Timmy
padre(stuart, molly).       % Stuart es el padre de Molly
padre(stuart, judy).        % Stuart es el padre de Judy
padre(mr_big, frubelina).   % Mr. Big es padre de Frubelina

% Madres
madre(mrs_wilde, nick).     % Mrs. Wilde es la madre de Nick
madre(bonnie, timmy).       % Bonnie es madre de Timmy
madre(bonnie, molly).       % Bonnie es madre de Molly
madre(bonnie, judy).        % Bonnie es madre de Judy
madre(mrs_big, frubelina).  % Mrs. Big es madre de Frubelina

% Reglas
% 1. A un carnívoro no le agradan los herbívoros
no_simpatizan(X, Y) :- carnivoro(X), herbivoro(Y), no_le_agrada(X,Y).

% 2. Si es mamífero y desaparecido, entonces es estuvo bajo efecto de la droga 
bajo_efecto(X) :- mamifero(X), desaparecido(X).

% 3. Si le gusta Gazelle, entonces le gusta el arte
fanatico(X) :- le_agrada(gazelle, X).

% 4. Si es antagonista, entonces es malo
malo(X) :- antagonista(X).

% 5. Si X es antagonista y Y es policía, entonces X no le agrada a Y
antagonista_policia(X, Y) :- antagonista(X), policia(Y).

% 6. Si ambos son antagonistas, entonces son cómplices
complices(X, Y) :- antagonista(X), antagonista(Y).

% 7. Si X es mamífero y Y es conocido, entonces X le agrada a Y
le_agrada_mamifero(X, Y) :- mamifero(X), conocido(X, Y).

% 8. Si X es mamífero y Y es policía, entonces X le agrada a Y
se_agradan(X, Y) :- mamifero(X), policia(Y).

% 9. Si X es mamífero y Y es antagonista, entonces X no le agrada a Y
no_se_agradan(X, Y) :- mamifero(X), antagonista(Y).

% 10. Si X es policia y Y es malo, entonces son contrarios
contrarios(X, Y) :- policia(X), malo(Y).

% 11. Si un animal es un carnívoro y le gusta otro carnívoro, entonces ese otro carnívoro también le gusta.
le_agrada_a_carnivoro(X, Y) :- carnivoro(X), carnivoro(Y), le_agrada(X, Y), le_agrada(Y, X).

% 12. Si un animal le gusta otro animal y ambos son conocidos y uno es un policía, entonces el otro también es un policía.
ambos_policias(X, Y) :- le_agrada(X, Y), conocido(X, Y), policia(X), policia(Y).

% 13. Si un animal es conocido por otro animal y ese otro animal es un antagonista, entonces el primero es un carnívoro.
carnivoro_conocido(X, Y) :- conocido(X, Y), antagonista(Y), carnivoro(X).

% 14. Verifica si es herbívoro o carnívoro
herbivoro_o_carnivoro(X) :- herbivoro(X) ; carnivoro(X).

% 15. Hijos de X
hijo(X, Y) :- padre(Y, X); madre(Y, X).

% 16. Hermano de X
hermano(X, Y) :- 
    hijo(X, Z), 
    hijo(Y, Z), 
    X \= Y, 
    X @< Y.

% 17. Hijos de Bonnie
hijos_de_bonnie(X) :- hijo(X, bonnie).

% 18. Abuelo de X
abuelo(X, Y) :- padre(X, Z), padre(Z, Y) ; padre(X, Z), madre(Z, Y).

% 19. Sobrino de X
sobrino(X, Y) :- hijo(X, Z), hermano(Z, Y).

% 20. Amigos de Judy
amigos_de_judy(X) :- conocido(judy, X), le_agrada(judy, X).

% 21. Enemigos de Judy
enemigos_de_judy(X) :- conocido(judy, X), no_le_agrada(judy, X).