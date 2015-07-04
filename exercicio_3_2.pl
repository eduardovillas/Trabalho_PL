
%% pares(+L, ?P ) is semidet
%
% verdadeiro se P são apenas os elementos pares de L. (na mesma ordem).

:- begin_tests(pares).

    test(pares1, fail) :- pares([1,2,3,4], [2,4,3]).
    test(pares2) :- pares([1,2,3,4], [2,4]).
    test(pares3, fail) :- pares([1,2,3,4], [2,4,4]).
    test(pares4) :- pares([1,2,3,4,4,8,10], [2,4,4,8,10]).
    test(pares4) :- pares([1,2,3,4,4,8,7,3,5,10], [2,4,4,8,10]).
    test(pares5) :- pares([1,2,3,4,3,3,2], [2,4,2]).
    test(pares6, fail) :- pares([2,4,2], [1,2,3,4,3,3,2]).
    test(pares7) :- pares([2,4,2], [2,4,2]).
    test(pares7, fail) :- pares([2,4,2], [2,4,2,2]).

:- end_tests(pares).

pares([],[]) :- !.

pares([Y|L], X) :- e_impar(Y), !, pares(L, X). 
pares([Y|L], [Y|L2]) :- e_par(Y), !, pares(L, L2).

e_par(X) :- X mod 2 =:= 0.
e_impar(X) :- X mod 2 =\= 0.