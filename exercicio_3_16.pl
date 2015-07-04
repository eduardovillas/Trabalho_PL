
num_folhas( nill, 0 ).
num_folhas( nodo(_,nill,nill), 1 ).
num_folhas( nodo(_,Y,Z), S ) :- num_folhas( Y, N ), num_folhas( Z, J ), N0 is N + J, S is N0.


arv_bin(nill).
arv_bin(nodo(_,Esq,Dir)) :- arv_bin(Esq), arv_bin(Dir).

na_arv(X,nodo(X,_,_)).
na_arv(X,nodo(_,Esq,_)) :- na_arv(X,Esq).
na_arv(X,nodo(_,_,Dir)) :- na_arv(X,Dir).

nodo(_,_,_).
nodoFolha( nodo(_,nill,nill) ).


