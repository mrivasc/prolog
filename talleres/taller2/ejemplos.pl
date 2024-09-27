calorias(paella,200).
calorias(gazpacho,150).
calorias(consome,300).
calorias(filete,400).
calorias(pollo,280).
calorias(trucha,160).
calorias(bacalao,300).
calorias(flan,280).
calorias(nueces_miel,500).
calorias(naranja,50).

valor_calorico(X, Y, Z, Calorias) :-
calorias(X, A),
calorias(Y, B),
calorias(Z, C),
% is(V, +(A, +(B, C))) prefija
Calorias is A + B + C.

comida_equilibrada(X, Y, Z) :-
valor_calorico(X, Y, Z, Calorias),
Calorias =< 800, write("La comida esta equilibrada con "),
write(Calorias),
writeln(" calorias"), !.
% el corte se realiza para que, si se cumple esa condición, que ya no siga a buscar la siguiente regla con el mismo nombre.

comida_equilibrada(X, Y, Z) :-
valor_calorico(X, Y, Z, V),
V > 800,
write(" La comida no esta equilibrada con "),
write(V),
writeln(" calorias"), fail.


%%%%%%%%%%%%%

%suma_digitos(N, Sum) :-
%N < 10, !.
%Sum is N, 
%!.

suma_digitos(N, N) :- N < 10, !.

suma_digitos(N, Suma) :-
N >= 10,
is(UltimoDigito, mod(N, 10)),
is(RestoNumeros, div(N, 10)),
suma_digitos(RestoNumeros, SumaParcial),
is(Suma, +(SumaParcial, UltimoDigito)).


%%%%%%

es_palindromo(Numero) :-
% invertir número
invertir_numero(Numero, NumeroInvertido),
% comparar con el original
Numero =:= NumeroInvertido.


invertir_numero(Numero, Invertido) :-
invertir_numero_aux(Numero, 0, Invertido).


invertir_numero_aux(0, Acumulador, Acumulador) :- !.

invertir_numero_aux(Numero, Acumulador, Invertido) :-
Numero > 0,
is(Digito, mod(Numero, 10)),
is(NuevaCantidad, +(Digito, *(Acumulador, 10))),
is(RestoNumeros, div(Numero,10)),
invertir_numero_aux(RestoNumeros, NuevaCantidad, Invertido).

%Regla para generar un número aleatorio entre 1 y 100.
number_to_guess(X) :-random(N), is(X, floor(*(N, 101))).

% Predicado principal para jugar.
play :-
    number_to_guess(NumberToGuess),
    guess_number(NumberToGuess, 0).
    
 % Predicado para adivinar el número.
 guess_number(NumberToGuess, Attempts) :
write("Guess a number between 1 and 100: "),
 read(Guess),
 NewAttempts is Attempts + 1,
 validate_number(NumberToGuess, Guess, NewAttempts).
 % Predicado para validar el número ingresado.
 validate_number(NumberToGuess, Guess, Attempts) :
=:=(NumberToGuess, Guess),
 write("You guessed it in "), write(Attempts), writeln(" attempts!"),
 nl,
 !.
 validate_number(NumberToGuess, Guess, Attempts) :
>(NumberToGuess, Guess),
 write("The number is greater than "), writeln(Guess), nl,
 guess_number(NumberToGuess, Attempts).
 validate_number(NumberToGuess, Guess, Attempts) :
<(NumberToGuess, Guess),
 write("The number is less than "), writeln(Guess), nl,
 guess_number(NumberToGuess, Attempts).