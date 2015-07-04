
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
	
maior_entre( X, Y, X):- X > Y, !.
maior_entre( _, Y, Y ).


