
%% lista_soma(+XS, +A, ?YS ) is semidet
%
% verdadeiro se a lista YS ´e a lista XS + A (cada elemento de XS somado com A).

:- begin_tests(lista_soma).

	test(lista_soma1, YS == [4,5]) :- lista_soma([1,2], 3, YS).

:- end_tests(lista_soma).

lista_soma([],A,YS).
lista_soma([X|Y], A, YS) :- 
N is X + A,
lista_soma(Y, A,[_|N]).

