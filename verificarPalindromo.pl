% Programa para verificar se uma lista é um palíndromo em Prolog

% Função principal para verificar se uma lista é um palíndromo
palindromo(Lista) :-
    reverse(Lista, ListaInvertida),  % Inverte a lista usando reverse/2
    Lista = ListaInvertida.  % Verifica se a lista original é igual à lista invertida

% Exemplo de uso:
% ?- palindromo([r, a, d, a, r]).  % Deve retornar true
% ?- palindromo([a, b, c]).  % Deve retornar false