
%% ultimo(+L, ?X ) is semidet
%
% verdadeiro se X é o ultimo elemento de L.

:- begin_tests(ultimo).

	test(ultimo1, X == 1) :- ultimo([1],X).
	test(ultimo2) :- ultimo([1,5,1],1).
	test(ultimo3) :- ultimo([1,[5,4],1],1).
	test(ultimo4, fail) :- ultimo([1,[5,4],1],3).
	test(ultimo5, X == [1]) :- ultimo([1,[5,4],[1]],X).

:- end_tests(ultimo).

ultimo([X],X) :- !.
ultimo([_|L], X) :- ultimo(L, X).

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
	test(pares1, P == [2]) :- pares([1,2], P).
	test(pares2, P == []) :- pares([1,3], P).
	test(pares3, P == [4,8]) :- pares([1,3,4,5,8], P).
	test(pares4) :- pares([1,3,4,5,8], [4,8]).

:- end_tests(pares).

pares([],[]) :- !.

pares([Y|L], X) :- e_impar(Y), !, pares(L, X). 
pares([Y|L], [Y|L2]) :- e_par(Y), !, pares(L, L2).

:- begin_tests(e_par).
	test(e_par1, fail) :- e_par(1).
	test(e_par2) :- e_par(2).
	test(e_par3) :- e_par(0).
:- end_tests(e_par).

e_par(X) :- X mod 2 =:= 0.

:- begin_tests(e_impar).
	test(e_impar) :- e_impar(1).
	test(e_impar, fail) :- e_impar(2).
	test(e_impar, fail) :- e_impar(0).
:- end_tests(e_impar).

e_impar(X) :- X mod 2 =\= 0.

%% lista_soma(+XS, +A, ?YS ) is semidet
%
% verdadeiro se a lista YS ´e a lista XS + A (cada elemento de XS somado com A).

:- begin_tests(lista_soma).

	test(lista_soma1, YS == [4,5]) :- lista_soma([1,2], 3, YS).
	test(lista_soma2, YS == []) :- lista_soma([], 3, YS).
	test(lista_soma3, YS == [4]) :- lista_soma([1], 3, YS).

:- end_tests(lista_soma).

lista_soma([], A, []).
lista_soma([X|Y], A, [B|Z]) :- 
B is X + A,
lista_soma(Y, A, Z).

%% maximo(+XS, ?M) is semidet
%
% ´e verdadeiro se M ´e o valor m´aximo da lista XS.

:- begin_tests(maximo).

	test(maximo1, fail) :- maximo([1,2,3], 2).
	test(maximo2) :- maximo([1,3,3,5], 5).
	test(maximo3) :- maximo([1,3,3,5,4,7], 7).
	test(maximo4) :- maximo([1,3,3,9,5,4,7], 9).
	test(maximo5, Y == 75) :- maximo([1,3,3,9,75,4,7], Y).

:- end_tests(maximo).

maximo([X],X) :- !.
maximo([X|Y],M):-
maximo(Y,M0),
maior_entre(X,M0,M).


:- begin_tests(maior_entre).

	test(maior_entre1, fail) :- maior_entre(3,2,7).
	test(maior_entre2) :- maior_entre(8,2,2).	
	test(maior_entre3) :- maior_entre(2,2,2).	

:- end_tests(maior_entre).
	
maior_entre( X, Y, X):- X > Y, !.
maior_entre( _, Y, Y ).
