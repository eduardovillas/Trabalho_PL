:- use_module(library(plunit)).

:- begin_tests(numeroPerfeito).

	test(numeroPerfeito1) :- numeroPerfeito(6).
	test(numeroPerfeito2) :- numeroPerfeito(28).
	test(numeroPerfeito3, fail) :- numeroPerfeito(9).

:- end_tests(numeroPerfeito).


numeroPerfeito(Numero) :- numeroPerfeito(Numero,1,0), !.


numeroPerfeito(Numero,Numero,Soma):- Numero = Soma.
numeroPerfeito(Numero,DivisorAtual,SomaAtual) :-  \+(DivisorAtual = Numero),
                                              NovoDivisor is DivisorAtual+1,
                                              0 is mod(Numero,DivisorAtual), 
                                              NovaSoma is SomaAtual+DivisorAtual,
                                              numeroPerfeito(Numero,NovoDivisor,NovaSoma).

numeroPerfeito(Numero,DivisorAtual,SomaAtual) :- \+(DivisorAtual = Numero),
                                             NovoDivisor is DivisorAtual+1,numeroPerfeito(Numero,NovoDivisor,SomaAtual).