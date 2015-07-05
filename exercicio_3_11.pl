%Defina um predicado rotacionada(L, N, R) que  ́e verdadeiro se R cont ́em os elementos de
%L rotacionados N posi ̧c ̃
%oes a esquerda. Exemplo
%?- rotacionada([a, b, c, d, e, f, g, h], 3, R).
%R = [d, e, f, g, h, a, b, c].

%% rotacionada(+L, +N, ?R) is semidet
%
% verdadeiro se R contém os elementos da lista l rotacionados N posicoes a esquerda.

:- use_module(library(plunit)).

:- begin_tests(rotacionada).

	test(rotacionada1, Result == [1,2,3,4]) :- rotacionada([3,4,1,2], 2, Result).
	test(rotacionada2) :- rotacionada([3,5,9,10], 3, [10,3,5,9]).
	test(rotacionada3) :- rotacionada([3,5,9,10], 2, [9,10,3,5]).
	test(rotacionada4) :- rotacionada([3,5,9,10], 4, [3,5,9,10]).

:- end_tests(rotacionada).

rotacionada(List, N, RotatedList) :-
length(Front, N),           
append(Front, Back, List), 
append(Back, Front, RotatedList).  
