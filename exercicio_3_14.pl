%% aplainada(+L, ?F) is semidet
%
% e verdadeiro se F e uma vers˜ao n˜ao aninhada de L

:- begin_tests(aplainada).

	test(aplainada1, D == [1, 2, 3, 4] ) :- aplainada([1,[2],[3,4]], F).

:- end_tests(duplicada).

aplainada([], []).

aplainada([X | XS], [X | Y] ) :-
\+ is_list(X),
aplainada(XS, Y).

aplainada([X | XS], F) :-
aplainada(X, F),
aplainada(XS, F).
