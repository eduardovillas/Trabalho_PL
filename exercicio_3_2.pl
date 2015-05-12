
%% pares(+L, ?P ) is semidet
%
% verdadeiro se P são apenas os elementos pares de L. (na mesma ordem).

:- begin_tests(pares).

:- end_tests(pares).

pares([],_) :- !.
pares([Y|L], X) :- e_impar(Y), pares(L, X). 
pares([Y|L], [_|Y]) :- e_par(Y), pares(L, [_|Y]).

e_par(X) :- X mod 2 =:= 0.
e_impar(X) :- X mod 2 =\= 0.