%% duplicada(+L, ?D) is semidet
%
% e verdadeiro se D tem os elementos de L duplicados.

:- begin_tests(duplicada).

	test(duplicada1, D == [1, 1, 7, 7, 8, 8, 2, 2] ) :- duplicada([1,7,8,2], D).
	test(duplicada2) :- duplicada([1], [1,1]).		
	test(duplicada3, fail) :- duplicada([1], [1,2]).		

:- end_tests(duplicada).

duplicada( [], [] ).

duplicada( [U|Y], [U,U|R] ) :-
duplicada( Y, R ).

