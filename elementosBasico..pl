% Fatos
gosta_de(joao, pizza).

% Regras
come(X, Y) :- gosta_de(X, Y), com_fome(X).

% Consultas
% Para verificar se João vai comer pizza:
% ?- come(joao, pizza).

% Outro fato adicional
com_fome(joao).  % João está com fome