%% aplainada(+L, ?F) is semidet
%
% e verdadeiro se F e uma vers˜ao n˜ao aninhada de L

:- begin_tests(aplainada).

	test(aplainada1, D == [1, 2, 3, 4] ) :- aplainada([1,[2],[3,4]], F).

:- end_tests(duplicada).

aplainada(X,[X]) :- \+ is_list(X).
aplainada([],[]).
aplainada([X|Xs],Zs) :- aplainada(X,Y), aplainada(Xs,Ys), append(Y,Ys,Zs).
