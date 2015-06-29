
%% palindromo(+L) is determinist
%
% ´e verdadeiro se L é um palindromo

:- begin_tests(palindromo).

	test(palindromo1, fail) :- palindromo([1,2,3,1,1]).
	test(palindromo2) :- palindromo([1,2,1]).	
	test(palindromo3) :- palindromo([]).	

:- end_tests(palindromo).

palindromo(L):-
  reverse(L, L).