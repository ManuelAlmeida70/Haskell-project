% meu_programa.pl
minha_regra(X) :- 
    member(X, [1,2,3]),
    X > 1.

% Predicado para ser chamado do Haskell
haskell_query(Input, Output) :-
    % lógica aqui
    Output is Input * 2.