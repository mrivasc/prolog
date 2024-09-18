% FIBONACCI
fibonacci(0,0) :- !.
fibonacci(1,1) :- !.
fibonacci(N, X) :- 
    Anterior1 is N - 1,
    Anterior2 is N - 2,
    fibonacci(Anterior1, Y1),
    fibonacci(Anterior2, Y2),
    X is Y1 + Y2.