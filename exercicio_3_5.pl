
%% palindromo(+L) is determinist
%
% ´e verdadeiro se L é um palindromo

:- begin_tests(palindromo).

	test(palindromo1, fail) :- palindromo([1,2,3,1,1]).
	test(palindromo2) :- palindromo([1,2,1]).	
	test(palindromo3) :- palindromo([]).	

:- end_tests(palindromo).

palindromo(L):-
  reverso(L, L).
  
:- begin_tests(reverso).

test(reverso) :-
    reverso([1, 2, 3], [3, 2, 1]).

test(reverso, R == [8, 3, 4]) :-
    reverso([4, 3, 8], R).

:- end_tests(reverso).

reverso([], []).

reverso([A|As], R) :-
    reverso(As, Rs),
    append(Rs, [A], R).