
%% sublista(+L, +I, +J, ?R) is semidet
%
% � verdadeiro se R � uma sub lista de L com os elementos das posi��es de I a J (inclusive).

:- begin_tests(sublista).

	test(sublista1) :- sublista([1,2,3], 2, 2, [2]).			
	test(sublista2, fail) :- sublista([1], 1, 1, [2]).		
	test(sublista3) :- sublista([1,2,3,4,5,6], 2, 6, [2,3,4,5,6]).		
	test(sublista4, fail) :- sublista([1], 1, 1, [1,2]).		

:- end_tests(sublista).

sublista( [], 1, 1, [] ).

sublista( [U|Y], 1, J, [U|R] ) :-
J > 1,
J0 is J - 1,
sublista( Y, 1, J0, R ).

sublista( [U|Y], I, J, R ) :-
I > 1,
I0 is I - 1, 
sublista( Y, I0, J, R ).

sublista( [U|_], 1, J, [U] ).






