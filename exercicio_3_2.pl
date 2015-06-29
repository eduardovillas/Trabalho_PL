
%% pares(+L, ?P ) is semidet
%
% verdadeiro se P são apenas os elementos pares de L. (na mesma ordem).


pares([],[]) :- !.
pares([Y|L], X) :- e_impar(Y), pares(L, X). 
pares([Y|L], [Y|Z]) :- e_par(Y), pares(L,Z).

e_par(X) :- X mod 2 =:= 0.
e_impar(X) :- X mod 2 =\= 0.
