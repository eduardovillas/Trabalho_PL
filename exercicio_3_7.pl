
%% inserido_em(+L, +X, +I, ?R) is semidet
%
% é verdadeiro se R é a lista L com o elemento X inserido da posição I.

:- begin_tests(inserido_em).

	test(inserido_em1) :- inserido_em([1,3], 2, 2, [1,2,3]).	
	test(inserido_em2) :- inserido_em([], 1, 1, [1]).	
	test(inserido_em3, fail) :- inserido_em([1], 1, 2, [1,2]).	
	test(inserido_em4) :- inserido_em([2,3], 1, 1, [1,2,3]).	
	test(inserido_em5) :- inserido_em([1,2], 4, 3, [1,2,4]).
	test(inserido_em6, fail) :- inserido_em([1], 2, 2, [1,4]).

:- end_tests(inserido_em).
         
inserido_em( Y, X, 1, [X|Y] ) :- !.

inserido_em( [U|Y], X, I, [U|H] ) :-
I > 0,
I0 is I - 1, 
inserido_em( Y, X, I0, H ).







 

  