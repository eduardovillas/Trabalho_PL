
%% quantidade_primos(+I,+F,?Q) 
%
% Verdadeiro se existem Q numeros primos entre I e F.

:- begin_tests(quantidade_primos).

	test(quantidade_primos1, Q == 1) :- quantidade_primos(2,2,Q).
	test(quantidade_primos1, Q == 2) :- quantidade_primos(2,3,Q).
	test(quantidade_primos1) :- quantidade_primos(2,3,2).
	
:- end_tests(quantidade_primos).

quantidade_primos(X,X,Q) :- !,
primo(X),
Q is 1.

quantidade_primos(I,F,Q) :-
N0 is I,
N2 is I + 1,
quantidade_primos(N2,F,N),
primo(N0), % o grande problema!!!!
Q is N + 1.


%% primo(+X)
%  
%  Verdadeiro se X é um número primo.

:- begin_tests(primo).

test(primo_1, fail) :- primo(1).
test(primo_2) :- primo(2).
test(primo_3) :- primo(3).
test(primo_5) :- primo(5).
test(primo_7) :- primo(7).
test(primo_19) :- primo(19).
test(primo_4, fail) :- primo(4).
test(primo_6, fail) :- primo(6).
test(primo_8, fail) :- primo(8).
test(primo_9, fail) :- primo(9).

:- end_tests(primo).


primo(X) :-
    menor_divisor(X, 2, Y),
    X =:= Y.


%% menor_divisor(+X, +D, ?Y) is semidet
%
%  Verdadeiro se Y é o menor divisor de X maior ou igual a D.

% X é o menor divisor de X començando com X
menor_divisor(X, X, X) :- !.

% D é o menor divisor de X començando com D se X é divisível por D.
menor_divisor(X, D, D) :-
    divisivel(X, D), !.

% D não é divisor de X
menor_divisor(X, D, Y) :-
    \+ divisivel(X, D),
    D1 is D + 1,
    D1 =< X,
    menor_divisor(X, D1, Y).


%% Divisivel(+X, +Y) is semidet
%
% Verdadeiro se X é divisível por Y.

divisivel(X, Y) :-
    X rem Y =:= 0.