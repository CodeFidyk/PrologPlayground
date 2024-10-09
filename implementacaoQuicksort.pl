% Regra para dividir a lista em duas partes (menores ou iguais ao pivô e maiores)
particionar(_, [], [], []).  % Caso base: lista vazia
particionar(Pivo, [Cabeca|Cauda], [Cabeca|Menores], Maiores) :-
    Cabeca =< Pivo,  % Se o elemento for menor ou igual ao pivô
    particionar(Pivo, Cauda, Menores, Maiores).
particionar(Pivo, [Cabeca|Cauda], Menores, [Cabeca|Maiores]) :-
    Cabeca > Pivo,  % Se o elemento for maior que o pivô
    particionar(Pivo, Cauda, Menores, Maiores).

% Implementação do algoritmo de Quicksort
quicksort([], []).  % Caso base: lista vazia já está ordenada
quicksort([Pivo|Cauda], ListaOrdenada) :-
    particionar(Pivo, Cauda, Menores, Maiores),  % Divide a lista em menores e maiores
    quicksort(Menores, MenoresOrdenados),  % Ordena a parte dos menores
    quicksort(Maiores, MaioresOrdenados),  % Ordena a parte dos maiores
    append(MenoresOrdenados, [Pivo|MaioresOrdenados], ListaOrdenada).  % Junta as listas ordenadas

% Função para simular a avaliação preguiçosa (retorna a lista ordenada, mas só gera quando necessário)
quicksort_preguicoso(Lista, ListaOrdenada) :-
    freeze(ListaOrdenada, quicksort(Lista, ListaOrdenada)).

% Exemplo de uso
% Para chamar o quicksort preguiçoso, usamos:
% ?- quicksort_preguicoso([5, 3, 8, 4, 2], Ordenada), write(Ordenada), nl.
