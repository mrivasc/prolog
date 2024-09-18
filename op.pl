% Operaciones en Prolog
% SUMA
suma(A,B,Ans) :- Ans is A+B.

/*
14 ?- suma(5,3,X).
X = 8.
*/

resta(A,B,Ans) :- Ans is A-B.

/*
21 ?- resta(5,3,Ans). 
Ans = 2.
*/

multiplicar(A,B,Ans) :- Ans is A*B; write('Mensaje').

         % input % output (X)
% ec_primer((A,B), X) :- A =\= 0; write('A no puede ser != 0'); X is -B/A.

ec_primer((A, B), X) :-
    (   A =:= 0
    ->  write('A no puede ser 0'), nl
    ;   X is -B / A,
        write('El resultado es: '),
        write(X)
    ).

/*
5 ?- ec_primer((5,2),X). 
X = -0.4.

6 ?- ec_primer((6,9),X). 
X = -1.5.
*/

% ec_segundo((A,B,C), X1, X2) :- 
%     D is B*B - 4*A*C,                  % Cálculo del discriminante
%     (
%         A =:= 0 ->                     % División entre 0 
%         write('No se puede dividir entre 0');

%         D < 0 ->                       % Si el discriminante es negativo, las soluciones son imaginarias
%         write('La solución es imaginaria (raíz negativa)');

%         D =:= 0 ->                     % Si el discriminante es 0, hay una única solución
%         X1 is -B / (2*A),
%         X2 is X1;
        
%         D > 0 ->                       % Si el discriminante es positivo, hay dos soluciones reales
%         X1 is (-B + sqrt(D)) / (2*A),
%         X2 is (-B - sqrt(D)) / (2*A)
%     ).

% Evaluando que A != 0
ec_segundo(0,_,_,_,_) :- !, write('a no puede ser cero'), fail. 

% Evaluando que el D > 0
ec_segundo(A,B,C,_,_) :- 
    D is (B*B - (4*A*C)), 
    D<0,
    write('La solucion es imaginaria'),
    !, fail.

% Evaluando el caso que el discriminante es igual a 0
ec_segundo(A,B,C,X,Y) :- 
    D is (B*B - (4*A*C)), 
    D=:=0,
    X is -B / (2*A),
    Y is X,!.

% En cada una de las reglas anteriores se corta (!) el camino hasta donde la regla permita, es decir,
% dado que se evaluó alguna condición, se para hasta ahí para no continuar por dicho camino

ec_segundo(A,B,C,X1,X2) :-
    D is (B*B - (4*A*C)), 
    X1 is (-B + sqrt(D)) / (2*A),
    X2 is (-B - sqrt(D)) / (2*A).

% FACTORIAL
factorial(0,1) :- write('El factorial de 0 es 1'), !.
factorial(1,1) :- !.

factorial(N, X) :- 
    N > 0,  % Asegurarse de que N es positivo
    Anterior is N - 1, 
    factorial(Anterior, Y),
    X is N * Y.


% FIBONACCI
fibonacci(0,0) :- !.
fibonacci(1,1) :- !.
fibonacci(N, X) :- 
    Anterior1 is N - 1,
    Anterior2 is N - 2,
    fibonacci(Anterior1, Y1),
    fibonacci(Anterior2, Y2),
    X is Y1 + Y2.

% SUMATORIA
sumatoria(0,0) :- !.
sumatoria(N, X) :- 
    Anterior is N - 1,
    sumatoria(Anterior, Y),
    X is N + Y.