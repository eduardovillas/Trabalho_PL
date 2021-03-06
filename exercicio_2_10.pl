% Exerc�cio 2.10

%% primo(+X)
%  
%  Verdadeiro se X � um n�mero primo.

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
%  Verdadeiro se Y � o menor divisor de X maior ou igual a D.

% X � o menor divisor de X comen�ando com X
menor_divisor(X, X, X) :- !.

% D � o menor divisor de X comen�ando com D se X � divis�vel por D.
menor_divisor(X, D, D) :-
    divisivel(X, D), !.

% D n�o � divisor de X
menor_divisor(X, D, Y) :-
    \+ divisivel(X, D),
    D1 is D + 1,
    D1 =< X,
    menor_divisor(X, D1, Y).


%% Divisivel(+X, +Y) is semidet
%
% Verdadeiro se X � divis�vel por Y.

divisivel(X, Y) :-
    X rem Y =:= 0.