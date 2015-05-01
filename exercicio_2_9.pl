:- use_module(library(plunit)).

:- begin_tests(soma quadrado maiores).

	test(soma quadrado maiores1) :- soma quadrado maiores(1,2,2,8).
	test(soma quadrado maiores2) :- soma quadrado maiores(1,1,1,2).
	test(soma quadrado maiores1) :- soma quadrado maiores(4,1,2,20).
	test(soma quadrado maiores1) :- \+soma quadrado maiores(3,2,4,24).	

:- end_tests(soma quadrado maiores).