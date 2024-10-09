% Fatos
pai(jose, ana).
pai(jose, carlos).
pai(joao, jose).
pai(joao, maria).
mae(maria, ana).
mae(maria, carlos).
mae(julia, jose).
mae(julia, maria).

% Regras
avo(X, Y) :- pai(X, Z), pai(Z, Y).
avo(X, Y) :- pai(X, Z), mae(Z, Y).
avo(X, Y) :- mae(X, Z), pai(Z, Y).
avo(X, Y) :- mae(X, Z), mae(Z, Y).

irmao(X, Y) :- pai(P, X), pai(P, Y), mae(M, X), mae(M, Y), X \= Y.

% Exemplos de consultas
% ?- avo(X, ana).
% ?- irmao(carlos, X).