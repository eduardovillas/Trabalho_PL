:- use_module(library(plunit)).

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
