
  %%Dado um conjunto de n�umeros inteiros e um inteiro S, o problema da soma dos subconjuntos consiste
  %%em verificar se existe um subconjunto n�ao vazio cuja soma �e S. Defina um predicado soma subconjunto(A,
  %%S, P) que �e verdadeiro se P �e um subconjunto de A e a soma dos elementos de P �e S. Uma estrat�egia
  %%simples (e ing�enua) para implementar este predicado �e testar os subconjunto at�e encontrar um que
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
  
  
%% subconjunto(+L, ?S ) is semidet
%
% eh verdadeiro se a lista S eh subconjunto da lista L.

:- begin_tests(subconjunto).

	test(subconjunto1) :- subconjunto([1,3,3,4], [1,3]).	
	test(subconjunto2) :- subconjunto([1,3,3,4], [3,4]).	
	test(subconjunto3) :- subconjunto([1,3,3,4], []).	
	test(subconjunto4, fail) :- subconjunto([1,3,3,4], [7]).	

:- end_tests(subconjunto).

subconjunto( Y, S ) :- length(Y, N), entre(0, N, X), combinacao( X, Y, S ).

%% entre(+A, +B, -N) is nondet
%
%  Gerar inteiros N tal que A <= N <= B. Se B = infinito, ent�o gera inteiros N
%  tal que A <= N. N deve ser uma vari�vel.
%  Veja o predicado pr�-definido between/3.

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


%% membro( ?X, ?L ) is semidet
%
% eh verdadeiro se o elemento X pertence a lista L

:- begin_tests(membro).

	test(membro1, L == [3]) :- membro(3, L).	
	test(membro2) :- membro(1, [1,3,3,4]).	
	test(membro3, fail) :- membro(3, [1,2,4,7]).		
	test(membro4) :- membro(7, [1,2,3,7]).		

:- end_tests(membro).

membro(X,[X|_]).
membro(X,[_	|Y]) :- membro(X,Y).
