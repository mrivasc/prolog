% Código para calcular el MCM de un número utilizando el MCD
mcd(X, 0, X) :- !.
mcd(X, Y, MCD) :- Resto is X mod Y, mcd(Y, Resto, MCD).

mcm(X, Y, MCM) :- mcd(X, Y, MCD), MCM is (X * Y) / MCD.
