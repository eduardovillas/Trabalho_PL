
%% terno_pitagorico(?A, ?B, ?C ) is semidet
%
% Gera ternos pitagoricos

:- begin_tests(terno_pitagorico).

	test(terno_pitagorico1) :- terno_pitagorico(0, 0, 0).	
	test(terno_pitagorico2, C == 5) :- terno_pitagorico(3, 4, C).	

:- end_tests(terno_pitagorico).

terno_pitagorico(A,B,C) :- 
intriple(A,B,C),
SomaQuadrada is A * A + B * B, SomaQuadrada is C * C.

intriple(A,B,C) :- 
inteiro(Soma),
diferenca( Soma, A, Soma1 ), diferenca( Soma1, B, C ).

%% diferenca(+A, ?B, ?C ) is semidet
%
% Calcula C que e diferenca entre A e B. 

:- begin_tests(diferenca).

	test(diferenca1, C == 0) :- diferenca(0, 0, C).	
	test(diferenca2, B == 0) :- diferenca(0, B, 0).	
	test(diferenca3, C == 26) :- diferenca(30, 4, C).		

:- end_tests(diferenca).


diferenca( Soma, Soma, 0 ).
diferenca( Soma, D1, D2 ) :- 
Soma > 0, 
Soma1 is Soma - 1,
diferenca( Soma1, D1, D3 ),
D2 is D3 + 1.

%% inteiro(N) is semidet
%
% Gerra e verifica se um numero e inteiro.

:- begin_tests(inteiro).

	test(inteiro1, N == 0) :- inteiro(N).	
	test(inteiro2) :- inteiro(7).		

:- end_tests(inteiro).

inteiro(0).
inteiro(N) :- inteiro(N1), N is N1 + 1.