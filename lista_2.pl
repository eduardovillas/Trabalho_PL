
:- use_module(library(plunit)).

pai(adao, abel).
pai(adao, caim).
pai(adao, sete).
pai(caim, enoque).
pai(enoque, irad).
pai(irad, meujael).
pai(meujael, metusael).
pai(metusael, lameque).
pai(lameque, jabal).
pai(lameque, jubal).
pai(lameque, tubalcaim).
pai(lameque, naama).

mae(eva, abel).
mae(eva, caim).
mae(eva, sete).
mae(ada, jabal).
mae(ada, jubal).
mae(zila, tubalcaim).
mae(zila, naama).

%% homen(+Individuo) is semidet
:- begin_tests(homen).

   test(homen1) :- homen(adao).
   test(homen2) :- homen(caim).
   test(homen3) :- homen(irad).
   test(homen4) :- homen(meujael).
   test(homen5) :- homen(metusael).
   test(homen6) :- homen(lameque).
   test(homen7) :- \+homen(eva).

:- end_tests(homen).

homen(Individuo) :- pai(Individuo,_), !.

homen(sete).
homen(caim).
homen(jabal).
homen(jubal).
homen(tubalcaim).
homen(abel).

%% mulher(+Individuo) is semidet
:- begin_tests(mulher).

   test(mulher1) :- mulher(eva).
   test(mulher2) :- mulher(ada).
   test(mulher3) :- mulher(zila).
   test(mulher4) :- \+mulher(adao).

:- end_tests(mulher).

mulher(Individuo) :- mae(Individuo, _), !.
mulher(naama).

%% irmaos(+Individuo1, +Individuo2) is semidet
:- begin_tests(irmaos).
   
   test(irmaos1) :- irmaos(abel, caim).
   test(irmaos1_1) :- irmaos(caim, abel).
   test(irmaos2) :- irmaos(sete, caim).
   test(irmaos3) :- irmaos(sete, abel).
   test(irmaos4) :- irmaos(naama, tubalcaim).
   test(irmaos5) :- \+irmaos(naama, caim).
   test(irmaos6) :- irmaos(jabal, jubal).

:- end_tests(irmaos).

irmaos(Individuo1, Individuo2) :- 
pai(Pai, Individuo1), 
pai(Pai, Individuo2), !.

irmaos(Individuo1, Individuo2) :- 
mae(Mae, Individuo1),
mae(Mae, Individuo2), !.

%% casados(+Homen, +Mulher) is semidet
%% casados(+Mulher, +Homen) is semidet
:- begin_tests(casados).

	test(casados1) :- casados(adao, eva).
	test(casados2) :- \+casados(adao,zila).
	test(casados3) :- \+casados(caim, eva).
   test(casados4) :- casados(eva, adao).

:- end_tests(casados).

casados(Homen, Mulher) :- 
pai(Homen, Filho_ou_Filha), 
mae(Mulher, Filho_ou_Filha), !.

casados(Mulher, Homen) :- 
mae(Mulher, Filho_ou_Filha),
pai(Homen, Filho_ou_Filha), !.

%% avo(+Pai, +Neto) is semidet
:- begin_tests(avo).
	
   test(avo1) :- avo(adao, enoque).
	test(avo2) :- \+avo(adao, caim).

:- end_tests(avo).

avo(Avo,Neto) :- 
pai(Avo, Pai), 
pai(Pai, Neto), !.

%% irma(+Mulher,+Individuo) is semidet

:- begin_tests(irma).
   
   test(irma1) :- \+irma(eva,jabal).
   test(irma2) :- irma(naama, tubalcaim).
   test(irma3) :- irma(naama, jubal).
   test(irma4) :- irma(naama, jabal).
   test(irma5) :- \+irma(naama, irad).
   test(irma6) :- \+irma(naama, zila).
   test(irma7) :- \+irma(zila, naama).

:- end_tests(irma).

irma(Mulher, Individuo) :- 
mulher(Mulher), irmaos(Mulher, Individuo), !.

%% irmao(+Homen, +Individuo) is semidet
:- begin_tests(irmao).

   test(irmao1) :- \+irmao(adao, abel).
   test(irmao2) :- \+irmao(abel, enoque).
   test(irmao3) :- irmao(caim, abel).
   test(irmao4) :- irmao(abel, caim).
   test(irmao5) :- irmao(sete, caim).
   test(irmao6) :- \+irmao(ada, jabal). 
   test(irmao7) :- irmao(tubalcaim, naama).
   
:- end_tests(irmao).

irmao(Homen, Individuo) :-
homen(Homen), irmaos(Homen, Individuo), !.

%% e_pai(+Homem) is semidet
:- begin_tests(e_pai).

   test(e_pai1) :- e_pai(caim).
   test(e_pai2) :- \+e_pai(abel).
   test(e_pai3) :- e_pai(adao).
   test(e_pai4) :- \+e_pai(eva).
   test(e_pai5) :- e_pai(enoque).
   
:- end_tests(e_pai).

e_pai(Pai) :- 
pai(Pai, _), !.

%% e_mae(+Mulher) is semidet
:- begin_tests(e_mae).

   test(e_mae1) :- e_mae(eva).
   test(e_mae2) :- e_mae(ada).
   test(e_mae3) :- e_mae(zila).
   test(e_mae4) :- \+e_mae(naama).
   test(e_mae5) :- \+e_mae(caim).

:- end_tests(e_mae).

e_mae(Mulher) :- 
mae(Mulher, _), !.

%% e_filho(+Individuo) is semidet
:- begin_tests(e_filho).

   test(e_filho1) :- \+e_filho(adao).
   test(e_filho2) :- e_filho(abel).
   test(e_filho3) :- e_filho(caim).
   test(e_filho4) :- e_filho(sete).
   test(e_filho5) :- e_filho(naama).
   test(e_filho6) :- \+e_filho(zila).

:- end_tests(e_filho).

e_filho(Individuo) :-
mae(_, Individuo), !.

e_filho(Individuo) :- 
pai(_, Individuo), !.

%% ancestral(+Ancestral, +Descendente) is semidet
:- begin_tests(ancestral).

   test(ancestral1) :- ancestral(adao,enoque).
   test(ancestral2) :- ancestral(caim, enoque).
   test(ancestral3) :- \+ancestral(enoque, caim).
   test(ancestral4) :- ancestral(adao,meujael).
   test(ancestral5) :- ancestral(enoque, jabal).
   test(ancestral6) :- ancestral(eva, naama).
   test(ancestral7) :- ancestral(ada, jubal).
   test(ancestral8) :- ancestral(adao, jubal).

:- end_tests(ancestral).

e_ancestral(Individuo) :-
e_mae(Individuo), !.

e_ancestral(Individuo) :-
e_pai(Individuo), !.

ancestral(Ancestral, Descendente) :- 
pai(Ancestral, Descendente), !.

ancestral(Ancestral, Descendente) :- 
mae(Ancestral, Descendente), !.

ancestral(Ancestral, Descendente) :-
e_ancestral(Ancestral),
e_filho(Descendente),
pega_filho(Ancestral, Filho),
ancestral(Filho, Descendente), !.

pega_filho(Pai, Filho) :-
pai(Pai, Filho).

pega_filho(Mae, Filho) :- 
mae(Mae, Filho).

%% triangulo(+Lado1, +Lado2, +Lado3, ?TipoDeTriangulo) is semidet

:- begin_tests(triangulo).

   test(triangulo1, TipoDeTriangulo == escaleno) :- 
   triangulo(1, 2, 3, TipoDeTriangulo).
   test(triangulo1_1) :- triangulo(1, 2, 3, escaleno).
   test(triangulo1_2) :- \+triangulo(1, 2, 2, escaleno).
   test(triangulo1_3) :- \+triangulo(2, 2, 2, escaleno).

   test(triangulo2, TipoDeTriangulo == isoceles) :- 
   triangulo(1, 1, 2, TipoDeTriangulo).
   test(triangulo2_1) :- triangulo(1, 1, 2, isoceles).
   test(triangulo2_2) :- \+triangulo(1, 2, 3, isoceles).
   test(triangulo2_3) :- \+triangulo(1, 1, 1, isoceles).

   test(triangulo3, TipoDeTriangulo == equilatero) :- 
   triangulo(2, 2, 2, TipoDeTriangulo).
   test(triangulo3_1) :- triangulo(1, 1, 1, equilatero).
   test(triangulo3_2) :- \+triangulo(1, 1, 3, equilatero).
   test(triangulo3_3) :- \+triangulo(1, 2, 3, equilatero).


:- end_tests(triangulo).

triangulo(Lado1, Lado2, Lado3, TipoDeTriangulo) :- 
var(TipoDeTriangulo),
todosLadosIguais(Lado1, Lado2, Lado3),
TipoDeTriangulo = equilatero, !.

triangulo(Lado1, Lado2, Lado3, TipoDeTriangulo) :- 
nonvar(TipoDeTriangulo),
todosLadosIguais(Lado1, Lado2, Lado3),
TipoDeTriangulo == equilatero, !.

triangulo(Lado1, Lado2, Lado3, TipoDeTriangulo) :- 
var(TipoDeTriangulo),
todosLadosDiferentes(Lado1, Lado2, Lado3),
TipoDeTriangulo = escaleno, !.

triangulo(Lado1, Lado2, Lado3, TipoDeTriangulo) :- 
nonvar(TipoDeTriangulo),
todosLadosDiferentes(Lado1, Lado2, Lado3),
TipoDeTriangulo == escaleno, !.

triangulo(Lado1, Lado2, Lado3, TipoDeTriangulo) :- 
var(TipoDeTriangulo),
doisLadosIguais(Lado1, Lado2, Lado3),
TipoDeTriangulo = isoceles, !.

triangulo(Lado1, Lado2, Lado3, TipoDeTriangulo) :- 
nonvar(TipoDeTriangulo),
doisLadosIguais(Lado1, Lado2, Lado3),
TipoDeTriangulo == isoceles, !.

todosLadosIguais(Lado1, Lado2, Lado3) :- 
Lado1 == Lado2,
Lado2 == Lado3.

todosLadosDiferentes(Lado1, Lado2, Lado3) :- 
Lado1 =\= Lado2, 
Lado1 =\= Lado3,
Lado2 =\= Lado3.

doisLadosIguais(Lado1, Lado2, Lado3) :- 
\+todosLadosIguais(Lado1, Lado2, Lado3),
\+todosLadosDiferentes(Lado1, Lado2, Lado3).

% Exercício 2.8

%% area(+F, ?A) is semidet
%
%  Verdadeiro se A é a área figura F.

:- begin_tests(area).


test(area_quadrado, A =:= 16) :-
    area(quadrado(4), A).

test(area_retangulo, A =:= 12) :-
    area(retangulo(3, 4), A).

:- end_tests(area).


area(circulo(R), A) :-
    A is pi * R * R.

area(quadrado(L), A) :-
    A is L * L.

area(retangulo(H, L), A) :-
    A is H * L.

%% quadrado(+A, +B, +C, ?S) is semidet
%
%  Verdadeiro se S é a soma do maior dentre os três (A,B,C).

:- use_module(library(plunit)).

:- begin_tests(soma_quadrado_maiores).

	test(soma_quadrado_maiores1, S == 8) :- soma_quadrado_maiores(1,2,2,S).
	test(soma_quadrado_maiores1) :- soma_quadrado_maiores(1,2,2,8).
	test(soma_quadrado_maiores2, fail) :- soma_quadrado_maiores(1,1,1,2).
	test(soma_quadrado_maiores3) :- soma_quadrado_maiores(4,1,2,20).
	test(soma_quadrado_maiores4, fail) :- soma_quadrado_maiores(3,2,4,24).	

:- end_tests(soma_quadrado_maiores).

:- begin_tests(menorDosTres).

	test(menorDosTres1) :- menorDosTres(1,2,3).
	test(menorDosTres2, fail) :- menorDosTres(2,1,3).	
	
:- end_tests(menorDosTres).

soma_quadrado_maiores( A, B, C, S ) :-
menorDosTres(A,B,C),
S is B*B + C*C, !.

soma_quadrado_maiores( A, B, C, S ) :-
menorDosTres(B,A,C),
S is A*A + C*C, !.

soma_quadrado_maiores( A, B, C, S ) :-
menorDosTres(C,B,A),
S is B*B + A*A, !.

menorDosTres(MENOR, OUTRO1, OUTRO2) :-
MENOR < OUTRO1, MENOR < OUTRO2.

% Exercício 2.10

%% primo(+X)
%  
%  Verdadeiro se X é um número primo.

:- begin_tests(primo).

test(primo_1, fail) :- primo(1).
test(primo_2) :- primo(2).
test(primo_3) :- primo(3).
test(primo_5) :- primo(5).
test(primo_7) :- primo(7).
test(primo_19) :- primo(19).
test(primo_4, fail) :- primo(4).
test(primo_6, fail) :- primo(6).
test(primo_8, fail) :- primo(8).
test(primo_9, fail) :- primo(9).

:- end_tests(primo).


primo(X) :-
    menor_divisor(X, 2, Y),
    X =:= Y.


%% menor_divisor(+X, +D, ?Y) is semidet
%
%  Verdadeiro se Y é o menor divisor de X maior ou igual a D.

% X é o menor divisor de X començando com X
menor_divisor(X, X, X) :- !.

% D é o menor divisor de X començando com D se X é divisível por D.
menor_divisor(X, D, D) :-
    divisivel(X, D), !.

% D não é divisor de X
menor_divisor(X, D, Y) :-
    \+ divisivel(X, D),
    D1 is D + 1,
    D1 =< X,
    menor_divisor(X, D1, Y).


%% Divisivel(+X, +Y) is semidet
%
% Verdadeiro se X é divisível por Y.

divisivel(X, Y) :-
    X rem Y =:= 0.
	

%% quantidade_primos(+I,+F,?Q) 
%
% Verdadeiro se existem Q numeros primos entre I e F.

:- begin_tests(quantidade_primos).

	test(quantidade_primos1, Q == 1) :- quantidade_primos(2,2,Q).
	test(quantidade_primos2, Q == 2) :- quantidade_primos(2,3,Q).
	test(quantidade_primos3) :- quantidade_primos(2,3,2).
    test(quantidade_primos4, Q == 3) :- quantidade_primos(2, 5, Q).
    test(quantidade_primos5, Q == 3) :- quantidade_primos(2, 6, Q).
	
:- end_tests(quantidade_primos).

quantidade_primos(X,X,Q) :- \+primo(X), !,
Q is 0.

quantidade_primos(X,X,Q) :- primo(X), !,
Q is 1, !.

quantidade_primos(I,F,Q) :- 
N2 is I + 1,
quantidade_primos(N2,F,N),
primo(I), !, % o grande problema!!!!
Q is N + 1.

quantidade_primos(I,F,Q) :- 
N2 is I + 1,
quantidade_primos(N2,F,N),
\+primo(I), % o grande problema!!!!
Q is N.

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
