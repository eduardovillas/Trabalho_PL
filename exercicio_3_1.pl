
%% ultimo(+L, ?X ) is semidet
%
% verdadeiro se X é o ultimo elemento de L.

:- begin_tests(ultimo).

	test(ultimo1, X == 1) :- ultimo([1],X).
	test(ultimo2) :- ultimo([1,5,1],1).
	test(ultimo3) :- ultimo([1,[5,4],1],1).
	test(ultimo4, fail) :- ultimo([1,[5,4],1],3).
	test(ultimo5, X == [1]) :- ultimo([1,[5,4],[1]],X).

:- end_tests(ultimo).

ultimo([X],X) :- !.
ultimo([_|L], X) :- ultimo(L, X).