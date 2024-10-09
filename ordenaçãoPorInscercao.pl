% Caso base: inserir em uma lista vazia retorna a lista com o único elemento
inserir_ordenado(X, [], [X]).

% Inserção em uma lista não vazia
inserir_ordenado(X, [Y|Rest], [X, Y|Rest]) :- X =< Y.
inserir_ordenado(X, [Y|Rest], [Y|RestOrdenado]) :-
    X > Y,
    inserir_ordenado(X, Rest, RestOrdenado).

% Caso base: ordenar uma lista vazia retorna uma lista vazia
ordenar([], []).

% Ordenar uma lista não vazia
ordenar([X|Rest], ListaOrdenada) :-
    ordenar(Rest, RestOrdenada),
    inserir_ordenado(X, RestOrdenada, ListaOrdenada).