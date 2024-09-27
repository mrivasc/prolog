primo(1) :- !.
primo(2) :- !.
primo(3) :- !.

primo(N) :-
    N > 3,
    N mod 2 =\= 0,!,
    primo(N, 3).

primo(N, Div) :-
    Div * Div > N, !.

primo(N, Div) :-
    N mod Div =:= 0, !, fail
    Div2 is Div + 2,
    primo(N, Div2).