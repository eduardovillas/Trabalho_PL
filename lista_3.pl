%% ultimo(+L, ?X ) is semidet
%
% verdadeiro se X é o ultimo elemento de L.

:- begin_tests(ultimo).

	test(ultimo1, X == 1) :- ultimo([1],X).
	test(ultimo2) :- ultimo([1,5,1],1).
	test(ultimo3) :- ultimo([1,[5,4],1],1).
	test(ultimo4, fail) :- ultimo([1,[5,4],1],3).
	test(ultimo5, X == [1]) :- ultimo([1,[5,4],[1]],X).

:- end_tests(ultimo).

ultimo([X],X) :- !.
ultimo([_|L], X) :- ultimo(L, X).

%% pares(+L, ?P ) is semidet
%
% verdadeiro se P são apenas os elementos pares de L. (na mesma ordem).

:- begin_tests(pares).

    test(pares1, fail) :- pares([1,2,3,4], [2,4,3]).
    test(pares2) :- pares([1,2,3,4], [2,4]).
    test(pares3, fail) :- pares([1,2,3,4], [2,4,4]).
    test(pares4) :- pares([1,2,3,4,4,8,10], [2,4,4,8,10]).
    test(pares4) :- pares([1,2,3,4,4,8,7,3,5,10], [2,4,4,8,10]).
    test(pares5) :- pares([1,2,3,4,3,3,2], [2,4,2]).
    test(pares6, fail) :- pares([2,4,2], [1,2,3,4,3,3,2]).
    test(pares7) :- pares([2,4,2], [2,4,2]).
    test(pares7, fail) :- pares([2,4,2], [2,4,2,2]).
	test(pares1, P == [2]) :- pares([1,2], P).
	test(pares2, P == []) :- pares([1,3], P).
	test(pares3, P == [4,8]) :- pares([1,3,4,5,8], P).
	test(pares4) :- pares([1,3,4,5,8], [4,8]).

:- end_tests(pares).

pares([],[]) :- !.

pares([Y|L], X) :- e_impar(Y), !, pares(L, X). 
pares([Y|L], [Y|L2]) :- e_par(Y), !, pares(L, L2).

:- begin_tests(e_par).
	test(e_par1, fail) :- e_par(1).
	test(e_par2) :- e_par(2).
	test(e_par3) :- e_par(0).
:- end_tests(e_par).

e_par(X) :- X mod 2 =:= 0.

:- begin_tests(e_impar).
	test(e_impar) :- e_impar(1).
	test(e_impar, fail) :- e_impar(2).
	test(e_impar, fail) :- e_impar(0).
:- end_tests(e_impar).

e_impar(X) :- X mod 2 =\= 0.

%% lista_soma(+XS, +A, ?YS ) is semidet
%
% verdadeiro se a lista YS ´e a lista XS + A (cada elemento de XS somado com A).

:- begin_tests(lista_soma).

	test(lista_soma1, YS == [4,5]) :- lista_soma([1,2], 3, YS).
	test(lista_soma2, YS == []) :- lista_soma([], 3, YS).
	test(lista_soma3, YS == [4]) :- lista_soma([1], 3, YS).

:- end_tests(lista_soma).

lista_soma([], A, []).
lista_soma([X|Y], A, [B|Z]) :- 
B is X + A,
lista_soma(Y, A, Z).

%% maximo(+XS, ?M) is semidet
%
% ´e verdadeiro se M ´e o valor m´aximo da lista XS.

:- begin_tests(maximo).

	test(maximo1, fail) :- maximo([1,2,3], 2).
	test(maximo2) :- maximo([1,3,3,5], 5).
	test(maximo3) :- maximo([1,3,3,5,4,7], 7).
	test(maximo4) :- maximo([1,3,3,9,5,4,7], 9).
	test(maximo5, Y == 75) :- maximo([1,3,3,9,75,4,7], Y).

:- end_tests(maximo).

maximo([X],X) :- !.
maximo([X|Y],M):-
maximo(Y,M0),
maior_entre(X,M0,M).


:- begin_tests(maior_entre).

	test(maior_entre1, fail) :- maior_entre(3,2,7).
	test(maior_entre2) :- maior_entre(8,2,2).	
	test(maior_entre3) :- maior_entre(2,2,2).	

:- end_tests(maior_entre).
	
maior_entre( X, Y, X):- X > Y, !.
maior_entre( _, Y, Y ).

%% palindromo(+L) is determinist
%
% ´e verdadeiro se L é um palindromo

:- begin_tests(palindromo).

	test(palindromo1, fail) :- palindromo([1,2,3,1,1]).
	test(palindromo2) :- palindromo([1,2,1]).	
	test(palindromo3) :- palindromo([]).	

:- end_tests(palindromo).

palindromo(L):-
  reverso(L, L).
  
:- begin_tests(reverso).

test(reverso) :-
    reverso([1, 2, 3], [3, 2, 1]).

test(reverso, R == [8, 3, 4]) :-
    reverso([4, 3, 8], R).

:- end_tests(reverso).

reverso([], []).

reverso([A|As], R) :-
    reverso(As, Rs),
    concatenacao(Rs, [A], R).

%% removido_em(+L, +X, +I, ?R) is semidet
%
% é verdadeiro se R é a lista L com o elemento X removido da posição I.

:- begin_tests(removido_em).

	test(removido_em1) :- removido_em([1,2,3], 2, 2, [1,3]).	
	test(removido_em2) :- removido_em([1], 1, 1, []).	
	test(removido_em3, fail) :- removido_em([1,2], 1, 2, [1]).	
	test(removido_em4) :- removido_em([1,2,3], 1, 1, [2,3]).	
	test(removido_em5) :- removido_em([1,2,4], 4, 3, [1,2]).
	test(removido_em6, fail) :- removido_em([1,4], 2, 2, [1]).
	test(removido_em7) :- removido_em([1,2,3,4,5], 2, 2, [1,3,4,5]).

:- end_tests(removido_em).
         
removido_em( [X|Y], X, 1, Y ) :- !.

removido_em( [U|Y], X, I, [U|H] ) :-
I > 0,
I0 is I - 1, 
removido_em( Y, X, I0, H ).

%% inserido_em(+L, +X, +I, ?R) is semidet
%
% é verdadeiro se R é a lista L com o elemento X inserido da posição I.

:- begin_tests(inserido_em).

	test(inserido_em1) :- inserido_em([1,3], 2, 2, [1,2,3]).	
	test(inserido_em2) :- inserido_em([], 1, 1, [1]).	
	test(inserido_em3, fail) :- inserido_em([1], 1, 2, [1,2]).	
	test(inserido_em4) :- inserido_em([2,3], 1, 1, [1,2,3]).	
	test(inserido_em5) :- inserido_em([1,2], 4, 3, [1,2,4]).
	test(inserido_em6, fail) :- inserido_em([1], 2, 2, [1,4]).

:- end_tests(inserido_em).
         
inserido_em( Y, X, 1, [X|Y] ) :- !.

inserido_em( [U|Y], X, I, [U|H] ) :-
I > 0,
I0 is I - 1, 
inserido_em( Y, X, I0, H ).

%% sublista(+L, +I, +J, ?R) is semidet
%
% é verdadeiro se R é uma sub lista de L com os elementos das posições de I a J (inclusive).

:- begin_tests(sublista).

	test(sublista1) :- sublista([1,2,3], 2, 2, [2]).			
	test(sublista2, fail) :- sublista([1], 1, 1, [2]).		
	test(sublista3) :- sublista([1,2,3,4,5,6], 2, 6, [2,3,4,5,6]).		
	test(sublista4, fail) :- sublista([1], 1, 1, [1,2]).		

:- end_tests(sublista).

sublista( [U|_], 1, 1, [U] ) :- !.
sublista( [U|Y], 1, J, [U|R] ) :-
J > 1,
J0 is J - 1,
sublista( Y, 1, J0, R ).

sublista( [U|Y], I, J, R ) :-
I > 1,
I0 is I - 1, 
J0 is J -1,
sublista( Y, I0, J0, R ).

%% duplicada(+L, ?D) is semidet
%
% e verdadeiro se D tem os elementos de L duplicados.

:- begin_tests(duplicada).

	test(duplicada1, D == [1, 1, 7, 7, 8, 8, 2, 2] ) :- duplicada([1,7,8,2], D).
	test(duplicada2) :- duplicada([1], [1,1]).		
	test(duplicada3, fail) :- duplicada([1], [1,2]).		

:- end_tests(duplicada).

duplicada( [], [] ).

duplicada( [U|Y], [U,U|R] ) :-
duplicada( Y, R ).

%% dobrada(?L) is semidet
%
%  Verdadeiro se L é uma lista com dois blocos consecutivos de elementos
%  iguais.

:- begin_tests(dobrada).

test(dobrada) :- dobrada([a, b, c, a, b, c]).
test(dobrada_fail, fail) :- dobrada([a, b, a]).

test(dobrada2) :- dobrada2([a, b, c, a, b, c]).
test(dobrada2_fail, fail) :- dobrada2([a, b, a]).

:- end_tests(dobrada).

% versão simples
dobrada(L) :-
    concatenacao(A, A, L), !.

% versão eficiente
dobrada2(L) :-
    tamanho(L, T),
    T rem 2 =:= 0,
    N is T div 2,
    divisao_em(N, L, A, A).

%Defina um predicado rotacionada(L, N, R) que  ´e verdadeiro se R cont ´em os elementos de
%L rotacionados N posi ¸c ~
%oes a esquerda. Exemplo
%?- rotacionada([a, b, c, d, e, f, g, h], 3, R).
%R = [d, e, f, g, h, a, b, c].

%% rotacionada(+L, +N, ?R) is semidet
%
% verdadeiro se R contém os elementos da lista l rotacionados N posicoes a esquerda.

:- use_module(library(plunit)).

:- begin_tests(rotacionada).

	test(rotacionada1, Result == [1,2,3,4]) :- rotacionada([3,4,1,2], 2, Result).
	test(rotacionada2) :- rotacionada([3,5,9,10], 3, [10,3,5,9]).
	test(rotacionada3) :- rotacionada([3,5,9,10], 2, [9,10,3,5]).
	test(rotacionada4) :- rotacionada([3,5,9,10], 4, [3,5,9,10]).

:- end_tests(rotacionada).

rotacionada(List, N, RotatedList) :-
length(Front, N),           
concatenacao(Front, Back, List), 
concatenacao(Back, Front, RotatedList).  

%% mergesort(+A, -S) is semidet
%
%  Verdadeiro se S é uma permutação de A ordenada. Ou seja, S é A ordenada.

:- begin_tests(mergesort).

test(mergesort, S == [3, 4, 8, 12, 17]) :-
    mergesort([12, 4, 8, 3, 17], S).

:- end_tests(mergesort).

mergesort([], []).
mergesort([A], [A]).
mergesort([A0,A1|T], S) :-
    divisao([A0,A1|T], L1, L2),
    mergesort(L1, S1),
    mergesort(L2, S2),
    merge(S1, S2, S), !.

%% divisao(+A, ?B, ?C) is semidet
%
%  Verdadeiro se B concatenado com C é A. Os tamanhos de B e C pode ser
%  diferentes no máximo em 1.

divisao(A, B, C) :-
    tamanho(A, T),
    N is T div 2,
    divisao_em(N, A, B, C).


%% divisao_em(+N, ?A, ?B, ?C) is nondet
%
%  Verdadeiro se A = [A_0, A_1, ..., A_N, A_(N+1), ..., A_K] e
%  B = [A_0, ..., A_N] e C = [A_(N+1), ..., A_K].

divisao_em(N, [A|As], [A|Bs], Cs) :-
    N > 0,
    N0 is N - 1,
    divisao_em(N0, As, Bs, Cs).

divisao_em(0, A, [], A).


%% merge(+A, +B, ?C) is semidet
%
%  Verdadeiro se C é a intercalação das listas A e B.

merge(A, [], A).
merge([], B, B).
merge([A|As], [B|Bs], [A|Cs]) :-
    A =< B,
    merge(As, [B|Bs], Cs).

merge([A|As], [B|Bs], [B|Cs]) :-
    A > B,
    merge([A|As], Bs, Cs).

% vim: set ft=prolog spell spelllang=pt_br:

%% aplainada(+L, ?F) is semidet
%
% e verdadeiro se F e uma vers?ao n?ao aninhada de L

:- begin_tests(aplainada).

	test(aplainada1, F == [1, 2, 3, 4] ) :- aplainada([1,[2],[3,4]], F).

:- end_tests(aplainada).

aplainada(X,[X]) :- \+ is_list(X).
aplainada([],[]).
aplainada([X|Xs],Zs) :- aplainada(X,Y), aplainada(Xs,Ys), concatenacao(Y,Ys,Zs).

%% arvore(?T) is semidet
%
% ´e verdadeiro se T ´e uma ´arvore bin´aria (de acordo com a defini¸c?aodas notas de aula).

:- begin_tests(arvore).

	test(arvore1, T == nill) :- arvore(T).
	test(arvore2) :- arvore(nodo(xj,nill,nill)).
	test(arvore3) :- arvore(nodo(x,nodo(c,nill,nill),nill)).
	test(arvore4, fail) :- arvore(nodo(x,nodo(c,nill,nill,nill),nill)).

:- end_tests(arvore).

arvore(nill).
arvore(nodo(_,Esq,Dir)) :- arvore(Esq), arvore(Dir).

%% num_folhas(?T, ?S) is semidet
%
% e verdadeiro se S ´e o n´umero de folhas da ´arvore bin´aria T.


:- begin_tests(num_folhas).

	test(num_folhas1, fail) :- num_folhas(nodo(x,nodo(x,nill,nill),nill), 3).
	test(num_folhas2) :- num_folhas(nodo(x,nodo(x,nill,nill),nill), 1).	
	test(num_folhas3) :- num_folhas(nodo(x,nodo(x,nill,nill),nodo(x,nill,nill)), 2).	
	test(num_folhas4) :- num_folhas(nodo(x,nodo(x,nill,nill),nodo(x,nodo(x,nill,nill),nill)), 2).	

:- end_tests(num_folhas).

num_folhas( nill, 0 ).
num_folhas( nodo(_,nill,nill), 1 ).
num_folhas( nodo(_,Y,Z), S ) :- num_folhas( Y, N ), num_folhas( Z, J ), N0 is N + J, S is N0.


:- begin_tests(nodoFolha).

	test(nodoFolha1, fail) :- nodoFolha(nodo(x,nodo(x,nill,nill),nill)).	
	test(nodoFolha2) :- nodoFolha(nodo(x,nill,nill)).	

:- end_tests(nodoFolha).

nodo(_,_,_).
nodoFolha( nodo(_,nill,nill) ).

%% concatenacao(?X, ?Y, ?Z) is nondet
%
%  Verdadeiro se Z é a concatenação de X com Y.
%
%  Veja o predicado pré-definido concatenacao/3.

:- begin_tests(concatenacao).

test(t0) :- concatenacao([1, 2], [3, 4, 5], [1, 2, 3, 4, 5]).
test(t1, [nondet, XS == [1, 2, 4]]) :- concatenacao(XS, [3], [1, 2, 4, 3]).
test(t2, YS == [4, 3]) :- concatenacao([1, 2], YS, [1, 2, 4, 3]).
test(t3, all(p(XS, YS) == [
         p([], [1, 2, 3]),
         p([1], [2, 3]),
         p([1, 2], [3]),
         p([1, 2, 3], [])])) :-
    concatenacao(XS, YS, [1, 2, 3]).


:- end_tests(concatenacao).

concatenacao([], YS, YS).

concatenacao([X | XS], YS, [X | XSYS]) :-
    concatenacao(XS, YS, XSYS).
	
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
