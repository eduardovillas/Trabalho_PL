
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
    append(A, A, L), !.

% versão eficiente
dobrada2(L) :-
    length(L, T),
    T rem 2 =:= 0,
    N is T div 2,
    divisao_em(N, L, A, A).





