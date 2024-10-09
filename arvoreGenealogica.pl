% Definindo fatos (base de conhecimento)
pai(jose, maria).
pai(jose, joao).
mae(ana, maria).
mae(ana, joao).

% Definindo uma regra (relação)
irmao(X, Y) :-
    pai(P, X),
    pai(P, Y),
    mae(M, X),
    mae(M, Y),
    X \= Y.  % X e Y devem ser diferentes (não pode ser a mesma pessoa)

% Consulta exemplo
% Quem é irmão de Maria?
% A resposta esperada é'João'.