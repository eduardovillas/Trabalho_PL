%% terno_pitagorico(?A, ?B, ?C ) is semidet
%
% Gera ternos pitagoricos

:- begin_tests(terno_pitagorico).

	test(terno_pitagorico1) :- terno_pitagorico(0, 0, 0).	
	test(terno_pitagorico2, C == 5) :- terno_pitagorico(3, 4, C).	

:- end_tests(terno_pitagorico).

terno_pitagorico(A,B,C) :- 
geraTermos(A,B,C),
SomaQuadrada is A * A + B * B, SomaQuadrada is C * C.

geraTermos(A,B,C) :- 
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
% Gera e verifica se um numero e inteiro.

:- begin_tests(inteiro).

	test(inteiro1, N == 0) :- inteiro(N).	
	test(inteiro2) :- inteiro(7).		

:- end_tests(inteiro).

inteiro(0).
inteiro(N) :- inteiro(N1), N is N1 + 1.

%% combinacao(+K, +B, ?C ) is semidet
%
% eh verdadeiro se a lista C contem todas as possiveis combinacoes de K elementos da lista L

:- begin_tests(combinacao).

	test(combinacao1, C == [1,3]) :- combinacao(2, [1,3,3,4], C).	
	test(combinacao2) :- combinacao(2, [1,3,3,4], [3,3]).	
	test(combinacao3, fail) :- combinacao(3, [1,2,3,7], [1,8,7]).	
	test(combinacao4) :- combinacao(3, [1,2,3,7], [1,2,7]).	
	

:- end_tests(combinacao).

combinacao(0,_,[]).
combinacao( K, L, [ H | Calda ] ) :- K > 0,
   restanteLista( H, L, Resto ), K1 is K-1, combinacao( K1, Resto, Calda).

%% restanteLista(?X, +L, ?R ) is semidet
%
% eh verdadeiro se apos retirado o elemento X e seus anteriores da lista L restam apenas os elementos da lista R.

:- begin_tests(restanteLista).

	test(restanteLista1, R == [3,4]) :- restanteLista(3, [1,3,3,4], R).	
	test(restanteLista2) :- restanteLista(1, [1,3,3,4], [3,3,4]).	
	test(restanteLista3, fail) :- restanteLista(3, [1,2,3,7], [1,7]).		
	test(restanteLista4) :- restanteLista(7, [1,2,3,7], []).		

:- end_tests(restanteLista).
   

restanteLista(X,[X|L],L).
restanteLista(X,[_|L],R) :- restanteLista(X,L,R).

%% subconjunto(+L, ?S ) is semidet
%
% eh verdadeiro se a lista S eh subconjunto da lista L.

:- begin_tests(subconjunto).

	test(subconjunto1) :- subconjunto([1,3,3,4], [1,3]).	
	test(subconjunto2) :- subconjunto([1,3,3,4], [3,4]).	
	test(subconjunto3) :- subconjunto([1,3,3,4], []).	
	test(subconjunto4, fail) :- subconjunto([1,3,3,4], [7]).	

:- end_tests(subconjunto).

subconjunto( Y, S ) :- tamanho(Y, N), entre(0, N, X), combinacao( X, Y, S ).

%% entre(+A, +B, -N) is nondet%
%  Gerar inteiros N tal que A <= N <= B. Se B = infinito, então gera inteiros N
%  tal que A <= N. N deve ser uma variável.
%  Veja o predicado pré-definido between/3.

:- begin_tests(entre).

test(entre, all(N == [3, 4, 5, 6, 7])) :-
    entre(3, 7, N).

:- end_tests(entre).

entre(_, _, N) :-
    nonvar(N), !, fail.

entre(A, infinito, A).
entre(A, infinito, N) :-
    A1 is A + 1,
    entre(A1, infinito, N).

entre(A, B, A) :-
    A =< B.
entre(A, B, N) :-
    A < B,
    A1 is A + 1,
    entre(A1, B, N).
	
	% Exemplo 3.1

%% tamanho(+XS, ?T) is nondet
%
%  Verdadeiro se a quantidade de elementos na lista XS é T.
%
%  Veja o predicado pré-definido length/2.

:- begin_tests(tamanho).

test(t0) :- tamanho([], 0).
test(t1) :- tamanho([1], 1).
test(t2) :- tamanho([7, 2], 2).

:- end_tests(tamanho).


tamanho([_ | XS], T) :-
	tamanho(XS, T0),
	T is T0 + 1.

tamanho([], 0).

%%Dado um conjunto de n´umeros inteiros e um inteiro S, o problema da soma dos subconjuntos consiste
  %%em verificar se existe um subconjunto n˜ao vazio cuja soma ´e S. Defina um predicado soma subconjunto(A,
  %%S, P) que ´e verdadeiro se P ´e um subconjunto de A e a soma dos elementos de P ´e S. Uma estrat´egia
  %%simples (e ingˆenua) para implementar este predicado ´e testar os subconjunto at´e encontrar um que
  %%tenha a soma esperada
  
  
  soma_subconjunto([], 0, []).
  soma_subconjunto(A, S, P) :- subconjunto(A,P), super_soma( P, S ).  
  
  
% Exemplo 3.6

%% super_soma(+XS, ?S) is semidet
%
%  Verdadeiro se S e a soma de todos elementos da lista aninhada XS.

:- begin_tests(super_soma).

test(t0) :- super_soma([[], [], [[], []]], 0).
test(t1) :- super_soma([[1], [2, 3], [4, [5, 6], 7]], 28).
test(t2, S == 36) :- super_soma([[1, 2], 3, [4, [5, 6, [7]], 8]], S).

:- end_tests(super_soma).

super_soma([], 0).

super_soma([X | XS], S) :-
    \+ is_list(X), !,
    super_soma(XS, S1),
    S is X + S1.

super_soma([X | XS], S) :-
    super_soma(X, S1),
    super_soma(XS, S2),
    S is S1 + S2.
	
%% is_list(?X) is semidet
%
% Verdadeiro se X eh uma lista.
	
is_list(X) :-
        var(X), !,
        fail.
is_list([]).
is_list([_|T]) :-
        is_list(T).
		
%% ordenacao(+L, -S) is semidet
%
%  Verdadeiro se S é a lista L com os elementos ordenados.

:- begin_tests(ordenacao).

test(ordenacao, S == [2, 3, 4, 7]) :-
    ordenacao([7, 2, 4, 3], S).

:- end_tests(ordenacao).

ordenacao(L, S) :-
    permute(L, S),
    ordenado(S), !.
	
	
permute([], []).
permute([X|Rest], L) :-
    permute(Rest, L1),
    select(X, L, L1).
	
%%%% select(+X, +L1, ?L2) is semidet
%%%
%%%  Verdadeiro se L2 é uma lista com o elemento L1 removido.
%%
%%:- begin_tests(select).
%%
%%test(select1) :- select(1,[3,1,2], [3,2]).
%%test(select2, L2 == []) :- select(1,[1], L2).
%%
%%:- end_tests(select).
%%
%%select(X, [], []).	
%%select( X, [X|Calda], L2 ) :- select(X, Calda, L2).
%%select( X, [J|Calda], L2 ) :- select(X, Calda, L3), append( [J], L3, L2).


%% ordenado(+L) is semidet
%
%  Verdadeiro se L é uma lista de números ordenados.

ordenado([]).
ordenado([_]).
ordenado([A,B|R]) :-
    A =< B,
    ordenado([B|R]).
	
%% divisivel(+N, +D) is semidet
%
%  Verdadeiro se N é divisível por D.

divisivel(N, D) :-
    N mod D =:= 0.

%% primo(?N) is nondet
%
%  Verdadeiro se N é um número primo. Quando N é uma variável, este predicado
%  gerar números primos.

:- begin_tests(primo).

test(primo7) :- primo(7).

test(primo8, fail) :- primo(8).

test(primo, all(N == [2, 3, 5, 7, 11, 13, 17, 19])) :-
    primo(N),
    ( N > 20, !, fail ; true).

:- end_tests(primo).


% N é primo se N é inteiro e não existe divisor de N entre 2 e N-1.
primo(N) :-
    integer(N), !,
    N0 is N - 1,
    \+((divisor(2, N0, _, N))).

% Gera todos os número primos começando com 2.
primo(N) :-
    entre(2, infinito, N),
    primo(N).


%% divisor(+A, +B, -D, +N) is nondet
%
%  Gera divisores D de N tal que A <= D <= B. D deve ser uma variável.

divisor(A, B, D, N) :-
    var(D),
    entre(A, B, D),
    divisivel(N, D).
	
zebra(N) :-
    % existe uma rua com três casa vizinhas
    Casa1 = casa(_, _, _), % cor, nacionalidade, animal
    Casa2 = casa(_, _, _),
    Casa3 = casa(_, _, _),
    Rua = [Casa1, Casa2, Casa3],
    % com cores diferentes
    %% member(casa(vermelho, _, _), Rua),
    %% member(casa(azul, _, _), Rua),
    %% member(casa(verde, _, _), Rua),
    % o inglês vive na casa vermelha
    member(casa(vermelho, ingles, _), Rua),
    % o espanhol tem como animal de estimação um jaguar
    member(casa(_, espanhol, jaguar), Rua),
    % o japonês vive ao lado de quem tem uma cobra
    ao_lado(Rua, casa(_, japones, _), casa(_, _, cobra)),
    % quem tem um cobra vive a esquerda da casa azul
    a_esquerda(Rua, casa(azul, _, _), casa(_, _, cobra)),
    % quem tem uma zebra
    member(casa(_, N, zebra), Rua),!,
    writeln(Rua). % descomente a linha para ver a resposta completa

%% ao_lado(?L, ?A, ?B) is nondet
%
%  Verdadeiro se A aparece ao lado de B em L.
%  Exemplos
%  ?- ao_lado([1, 7, 4], 7, B).
%  B = 1 ;
%  B = 4 ;
%  false.

:- begin_tests(ao_lado).

test(ao_lado, all(T == [1, 4])) :-
    ao_lado([1, 7, 4], 7, T).

:- end_tests(ao_lado).

ao_lado([A,B|_], A, B).
ao_lado([A,B|_], B, A).
ao_lado([_|R], A, B) :-
    ao_lado(R, A, B).

%% a_esquerda(L, A, E) is nondet
%
%  Verdadeiro se E aparece a esquerda de A na lista L.
%  Exemplos
%  ?- a_esquerda([6, 4, 3, 8], 4, E).
%  E = 3 ;
%  E = 8 ;
%  false.

:- begin_tests(a_esquerda).

test(a_esquerda, all(E == [3, 8])) :-
    a_esquerda([6, 4, 3, 8], 4, E).

:- end_tests(a_esquerda).

a_esquerda([A|As], A, E) :-
    member(E, As).
a_esquerda([_|As], A, E) :-
    a_esquerda(As, A, E).
