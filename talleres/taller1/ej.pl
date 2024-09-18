/*
* Atributos: Pelo, capacidad de volar, forma de reproducción
* Determinar si es mamífero, ave, pez, anfibio o reptil
*/

% * Hechos
% MAMÍFEROS
% tiene_pelo/1
tiene_pelo(gato).
tiene_pelo(perro).
tiene_pelo(elefante).
tiene_pelo(leon).

% da_leche/1
da_leche(gato).
da_leche(perro).
da_leche(elefante).
da_leche(leon).

% AVES
% vuela/1
vuela(aguila).
vuela(halcon).
no_vuela(pinguino).

% pone_huevos/1
pone_huevos(aguila).
pone_huevos(halcon).
pone_huevos(pinguino).
pone_huevos(rana).
pone_huevos(cocodrilo).
pone_huevos(serpiente).

% PECES
% tiene_escamas/1
tiene_escamas(salmon).
tiene_escamas(atun).
tiene_escamas(trucha).

% REPTILES
% tiene_escamas/1
tiene_escamas(cocodrilo).
tiene_escamas(serpiente).

% vive_en_agua/1
vive_en_agua(salmon).
vive_en_agua(atun).
vive_en_agua(trucha).

% ANFIBIOS
vive_en_agua(rana).
vive_en_tierra(rana).


% * Reglas
es_mamifero(Animal) :- 
    tiene_pelo(Animal), 
    da_leche(Animal).

% Se puede dejar de ambas formas. Siendo un "o" lógico 
% o también se puede separar en dos reglas distintas
es_ave(Animal) :- 
    vuela(Animal) ; 
    no_vuela(Animal), 
    pone_huevos(Animal).
% es_ave(Animal) :- no_vuela(Animal), pone_huevos(Animal).

es_anfibio(Animal) :- 
    vive_en_agua(Animal), 
    vive_en_tierra(Animal), 
    pone_huevos(Animal).

es_reptil(Animal) :- 
    tiene_escamas(Animal), 
    pone_huevos(Animal).

es_pez(Animal) :- 
    tiene_escamas(Animal), 
    vive_en_agua(Animal).