
%% removido_em(+L, +X, +I, ?R) is semidet
%
% é verdadeiro se R é a lista L com o elemento X inserido da posição I.

:- begin_tests(removido_em).

	test(removido_em1) :- removido_em([1,2,3], 2, 2, [1,3]).	
	test(removido_em2) :- removido_em([1], 1, 1, []).	
	test(removido_em3, fail) :- removido_em([1,2], 1, 2, [1]).	
	test(removido_em4) :- removido_em([1,2,3], 1, 1, [2,3]).	
	test(removido_em5) :- removido_em([1,2,4], 4, 3, [1,2]).
	test(removido_em6, fail) :- removido_em([1,4], 2, 2, [1]).

:- end_tests(removido_em).
         
removido_em( [X|Y], X, 1, Y ) :- !.

removido_em( [U|Y], X, I, [U|H] ) :-
I > 0,
I0 is I - 1, 
removido_em( Y, X, I0, H ).







 

  