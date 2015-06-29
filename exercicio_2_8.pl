% Exercício 2.8

%% area(+F, ?A) is semidet
%
%  Verdadeiro se A é a área figura F.

:- begin_tests(area).

test(area_circulo, A =:= 12.5664) :-
    area(circulo(2), A).

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




