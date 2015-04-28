
:- use_module(library(plunit)).

pai(adao, abel).
pai(adao, caim).
pai(adao, sete).
pai(caim, enoque).
pai(adao, irad).
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


:- begin_tests(mulher).

   test(mulher1) :- mulher(eva).
   test(mulher2) :- mulher(ada).
   test(mulher3) :- mulher(zila).
   test(mulher4) :- \+mulher(adao).

:- end_tests(mulher).

mulher(Individuo) :- mae(Individuo, _), !.

%% mulher(+Individuo) is semidet

mulher(naama).

:- begin_tests(irmaos).
   
   test(irmaos1) :- irmaos(abel, caim).
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