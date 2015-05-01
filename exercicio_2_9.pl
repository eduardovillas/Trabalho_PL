:- use_module(library(plunit)).

:- begin_tests(soma_quadrado_maiores).

	test(soma_quadrado_maiores1, S == 8) :- soma_quadrado_maiores(1,2,2,S).
	test(soma_quadrado_maiores1) :- soma_quadrado_maiores(1,2,2,8).
	test(soma_quadrado_maiores2) :- soma_quadrado_maiores(1,1,1,2).
	test(soma_quadrado_maiores3) :- soma_quadrado_maiores(4,1,2,20).
	test(soma_quadrado_maiores4) :- \+soma_quadrado_maiores(3,2,4,24).	

:- end_tests(soma_quadrado_maiores).

:- begin_tests(menorDosTres).

	test(menorDosTres1) :- menorDosTres(1,2,3).
	test(menorDosTres1) :- menorDosTres(2,1,3).	
	
:- end_tests(menorDosTres).

soma_quadrado_maiores( A, B, C, S ) :-
var(S),
menorDosTres(A,B,C),
S is B*B + C*C.

soma_quadrado_maiores( A, B, C, S ) :-
nonvar(S),
menorDosTres(A,B,C),
S1 is B*B + C*C,
S == S1.

soma_quadrado_maiores( A, B, C, S ) :-
var(S),
menorDosTres(B,A,C),
S is A*A + C*C.

soma_quadrado_maiores( A, B, C, S ) :-
nonvar(S),
menorDosTres(B,A,C),
S1 is A*A + C*C,
S == S1.

soma_quadrado_maiores( A, B, C, S ) :-
var(S),
menorDosTres(C,B,A),
S is B*B + A*A.

soma_quadrado_maiores( A, B, C, S ) :-
nonvar(S),
menorDosTres(C,B,A),
S1 is B*B + A*A,
S == S1.

menorDosTres(MENOR, OUTRO1, OUTRO2) :-
MENOR < OUTRO1, MENOR < OUTRO2.