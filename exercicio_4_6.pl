%% primo(?N) is nondet
%
%  Verdadeiro se N � um n�mero primo. Quando N � uma vari�vel, este predicado
%  gerar n�meros primos.

:- begin_tests(primo).

test(primo7) :- primo(7).

test(primo8, fail) :- primo(8).

test(primo, all(N == [2, 3, 5, 7, 11, 13, 17, 19])) :-
    primo(N),
    ( N > 20, !, fail ; true).

:- end_tests(primo).


% N � primo se N � inteiro e n�o existe divisor de N entre 2 e N-1.
primo(N) :-
    integer(N), !,
    N0 is N - 1,
    \+((divisor(2, N0, _, N))).

% Gera todos os n�mero primos come�ando com 2.
primo(N) :-
    entre(2, infinito, N),
    primo(N).


%% divisor(+A, +B, -D, +N) is nondet
%
%  Gera divisores D de N tal que A <= D <= B. D deve ser uma vari�vel.

divisor(A, B, D, N) :-
    var(D),
    entre(A, B, D),
    divisivel(N, D).

%% entre(+A, +B, -N) is nondet
%
%  Gerar inteiros N tal que A <= N <= B. Se B = infinito, ent�o gera inteiros N
%  tal que A <= N. N deve ser uma vari�vel.
%  Veja o predicado pr�-definido between/3.

:- begin_tests(entre).

test(entre, all(N == [3, 4, 5, 6, 7])) :-
    entre(3, 7, N).

:- end_tests(entre).

entre(_, _, N) :-
    nonvar(N), !, fail.

entre(A, infinito, A).
entre(A, infinito, N) :-
    A1 is A + 1,
    entre(A1, infinito, N).

entre(A, B, A) :-
    A =< B.
entre(A, B, N) :-
    A < B,
    A1 is A + 1,
    entre(A1, B, N).


%% divisivel(+N, +D) is semidet
%
%  Verdadeiro se N � divis�vel por D.

divisivel(N, D) :-
    N mod D =:= 0.