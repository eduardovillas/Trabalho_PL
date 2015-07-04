
pita(A,B,C) :- geraCquadrado( C, C0), geraTermos( A, B, C0 ).

geraCquadrado( C, C0 ) :- natural_apartir(0, C), C0 is C * C.

geraTermos( A, B, SOMA) :- 
natural_apartir(0, A), 
natural_apartir(0, B),
A0 is A * A, B0 is B * B,
SOMA is A0 + B0.

natural_apartir(_, N) :-
    nonvar(N), !, fail.

natural_apartir(A, A).
natural_apartir(A, N) :-
    A1 is A + 1,
    natural_apartir(A1, N).