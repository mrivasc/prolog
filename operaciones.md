## Operaciones y comandos en Prolog
```
Suma
1 ?- Y is +(2,3).
Y = 5.

Resta
2 ?- Y is 2-3.
Y = -1.

Valor absoluto
3 ?- W is abs(-100).
W = 100.

Menor que
2 ?- <(3,5).
true.

3 ?- =<(3,5).
true.

Igualdad
4 ?- =:=(4,5).
false.

5 ?- =:=(5,5). 
true.

Desigualdad
7 ?- =\=(5,5).
false.

8 ?- =\=(4,5). 
true.

Llamada a constantes
9 ?- is(X,pi).
X = 3.141592653589793.
```