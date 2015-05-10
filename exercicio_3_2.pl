
%% pares(+L, ?P ) is semidet
%
% verdadeiro se P são apenas os elementos pares de L. (na mesma ordem).

:- begin_tests(pares).

:- end_tests(pares).

pares([_|L], X) :- ultimo(L, X).

e_par(X) :- X mod 2 =:= 0.