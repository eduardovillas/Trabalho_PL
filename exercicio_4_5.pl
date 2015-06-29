%% ordenacao(+L, -S) is semidet
%
%  Verdadeiro se S � a lista L com os elementos ordenados.

:- begin_tests(ordenacao).

test(ordenacao, S == [2, 3, 4, 7]) :-
    ordenacao([7, 2, 4, 3], S).

:- end_tests(ordenacao).

ordenacao(L, S) :-
    permutation(L, S),
    ordenado(S), !.


%% ordenado(+L) is semidet
%
%  Verdadeiro se L � uma lista de n�meros ordenados.

ordenado([]).
ordenado([_]).
ordenado([A,B|R]) :-
    A =< B,
    ordenado([B|R]).

