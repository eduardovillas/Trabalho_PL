arv_bin(nill).
arv_bin(nodo(_,Esq,Dir)) :- arv_bin(Esq), arv_bin(Dir).

na_arv(X,nodo(X,_,_)).
na_arv(X,nodo(_,Esq,_)) :- na_arv(X,Esq).
na_arv(X,nodo(_,_,Dir)) :- na_arv(X,Dir).

nodo(_,_,_).