%% arvore(?T) is semidet
%
% ´e verdadeiro se T ´e uma ´arvore bin´aria (de acordo com a defini¸c˜aodas notas de aula).

:- begin_tests(arvore).

	test(arvore1, T == nill) :- arvore(T).
	test(arvore2) :- arvore(nodo(xj,nill,nill).
	test(arvore3) :- arvore(nodo(x,nodo(c,nill,nill),nill)).
	test(arvore4, faill) :- arvore(nodo(x,nodo(c,nill,nill,nill),nill)).

:- end_tests(arvore).

arvore(nill).
arvore(nodo(_,Esq,Dir)) :- arvore(Esq), arvore(Dir).

nodo(_,_,_).