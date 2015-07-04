
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
