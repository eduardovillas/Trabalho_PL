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
