:- use_module(library(plunit)).

:- begin_tests(soma_quadrado_maiores).

	test(soma_quadrado_maiores1, S == 8) :- soma_quadrado_maiores(1,2,2,S).
	test(soma_quadrado_maiores1) :- soma_quadrado_maiores(1,2,2,8).
	test(soma_quadrado_maiores2) :- soma_quadrado_maiores(1,1,1,2).
	test(soma_quadrado_maiores3) :- soma_quadrado_maiores(4,1,2,20).
	test(soma_quadrado_maiores4) :- \+soma_quadrado_maiores(3,2,4,24).	

:- end_tests(soma_quadrado_maiores).

