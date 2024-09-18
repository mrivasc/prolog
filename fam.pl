% madre(femenino).
% padre(masculino).

tei(femenino).
vilma(femenino).
telma(femenino).
gabriela(femenino).
jeannette(femenino).
sonia(femenino).
rosibel(femenino).
andrea(femenino).
michelle(femenino).

cheyo(masculino).
jose(masculino).
michael(masculino).
roque(masculino).
javier(masculino).

padre(cheyo,vilma).
padre(cheyo,telma).
padre(cheyo,freddy).
padre(freddy,william).
padre(luis,roque).
padre(jose,jeannette).
padre(jose,gabriela).
padre(roque,javier).
padre(roque,michelle).
padre(luis,sonia).
padre(santos,celina).
padre(miguel,michael).
padre(miguel,steven).

madre(jeannette,javier).
madre(jeannette,michelle).
madre(tei,vilma).
madre(tei,telma).
madre(tei,freddy).
madre(vilma,jeannette).
madre(vilma,gabriela).
madre(telma,michael).
madre(telma,steven).
madre(martha,william).
madre(margarita,celina).
madre(celina,roque).
madre(celina,sonia).
madre(sonia,rosibel).
madre(rosibel,andrea).

% Reglas
antepasado(X,Y) :- padre(X,Y).
antepasado(X,Y) :- madre(X,Y).
antepasado(X,Y) :- padre(P,Y), antepasado(X,P), !.
antepasado(X,Y) :- madre(M,Y), antepasado(X,M), !.


% abuelo(X,Y):-padre(X,Z),padre(Z,Y).
% abuela(X,Y):-madre(X,Z),madre(Z,Y).

abuela_materna(X,Y) :- madre(X,Z), madre(Z,Y).
abuela_paterna(X,Y) :- madre(X,Z), padre(Z,Y).
abuelo_materno(X,Y) :- padre(X,Z), madre(Z,Y).
abuelo_paterno(X,Y) :- padre(X,Z), padre(Z,Y).

% Hermanastro por parte de papá
hermanastro(X,Y) :- padre(Z,X), padre(Z,Y), madre(W,X), madre(V,Y), X \= Y, W \= V.

% hermano(X,Y):-padre(Z,X),padre(Z,Y),madre(W,X),madre(W,Y),X\=Y.
hermano(X,Y):-padre(Z,X),padre(Z,Y),madre(W,X),madre(W,Y),\==(X,Y).
hermana(X,Y):-padre(Z,X),padre(Z,Y),madre(W,X),madre(W,Y),\==(X,Y).
% hermana(X,Y):-padre(Z,X),padre(Z,Y),madre(W,X),madre(W,Y),X\=Y.


tio(X,Y):-hermano(X,Z),padre(Z,Y).
tio(X,Y):-hermano(X,Z),madre(Z,Y).

tia(X,Y):-hermana(X,Z),padre(Z,Y).
tia(X,Y):-hermana(X,Z),madre(Z,Y).

primo(X,Y):-tio(Z,X),padre(Z,Y).

% prima(X,Y):-tia(Z,X),padre(Z,Y).
% sobrino(X,Y):-tio(Y,X);tia(Y,X).
% sobrina(X,Y):-tio(Y,X);tia(Y,X).
% nieto(X,Y):-abuelo(Y,X);abuela(Y,X).
% nieta(X,Y):-abuelo(Y,X);abuela(Y,X).
% bisabuelo(X,Y):-abuelo(X,Z),abuelo(Z,Y).
% bisabuela(X,Y):-abuela(X,Z),abuela(Z,Y).
% bisnieto(X,Y):-nieto(X,Z),nieto(Z,Y).
% bisnieta(X,Y):-nieta(X,Z),nieta(Z,Y).
