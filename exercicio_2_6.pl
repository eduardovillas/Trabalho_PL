
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
