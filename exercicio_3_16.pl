%% num_folhas(?T, ?S) is semidet
%
% e verdadeiro se S ´e o n´umero de folhas da ´arvore bin´aria T.


:- begin_tests(num_folhas).

	test(num_folhas1, fail) :- num_folhas(nodo(x,nodo(x,nill,nill),nill), 3).
	test(num_folhas2) :- num_folhas(nodo(x,nodo(x,nill,nill),nill), 1).	
	test(num_folhas3) :- num_folhas(nodo(x,nodo(x,nill,nill),nodo(x,nill,nill)), 2).	
	test(num_folhas4) :- num_folhas(nodo(x,nodo(x,nill,nill),nodo(x,nodo(x,nill,nill),nill)), 2).	

:- end_tests(num_folhas).

num_folhas( nill, 0 ).
num_folhas( nodo(_,nill,nill), 1 ).
num_folhas( nodo(_,Y,Z), S ) :- num_folhas( Y, N ), num_folhas( Z, J ), N0 is N + J, S is N0.


:- begin_tests(nodoFolha).

	test(nodoFolha1, fail) :- num_folhas(nodo(x,nodo(x,nill,nill),nill)).	
	test(nodoFolha2) :- num_folhas(nodo(x,nill,nill)).	

:- end_tests(nodoFolha).

nodo(_,_,_).
nodoFolha( nodo(_,nill,nill) ).


