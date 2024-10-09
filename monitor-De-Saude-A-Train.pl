% Definições iniciais do A-Train
% a_train(Saude, Batimentos, CompostoV, Velocidade).
a_train(100, 70, false, 1000).

% Regra para correr
correr(Distancia, SaudeInicial, BatimentosIniciais, CompostoV, VelocidadeInicial, SaudeFinal, BatimentosFinais) :-
    Tempo is Distancia / VelocidadeInicial,
    AumentoBatimentos is Distancia // 10 + 30,                       % Aumento dos batimentos com base na distância
    BatimentosFinais is BatimentosIniciais + AumentoBatimentos,
    verificar_saude(SaudeInicial, BatimentosFinais, SaudeFinal),
    format('A-Train correu ~w km em ~2f segundos. Batimentos cardíacos: ~w bpm. Saúde: ~w%.~n', [Distancia, Tempo, BatimentosFinais, SaudeFinal]).

% Usar o Composto V aumenta a velocidade e os batimentos
usar_composto_v(VelocidadeInicial, BatimentosIniciais, NovaVelocidade, NovosBatimentos) :-
    NovaVelocidade is VelocidadeInicial + 500,
    NovosBatimentos is BatimentosIniciais + 40,
    format('A-Train está usando o Composto V! Velocidade: ~w km/h. Batimentos cardíacos: ~w bpm.~n', [NovaVelocidade, NovosBatimentos]).

% Parar de usar o Composto V retorna à velocidade normal
parar_composto_v(VelocidadeCompostoV, NovaVelocidade) :-
    NovaVelocidade is VelocidadeCompostoV - 500,
    format('A-Train parou de usar o Composto V. Velocidade: ~w km/h.~n', [NovaVelocidade]).

% Verifica a saúde com base nos batimentos cardíacos
verificar_saude(SaudeInicial, Batimentos, SaudeFinal) :-
    (Batimentos > 150 ->
        SaudeFinal is SaudeInicial - 20,
        format('Alerta! Batimentos muito altos. Saúde reduzida para ~w%.~n', [SaudeFinal])
    ; Batimentos > 120 ->
        SaudeFinal is SaudeInicial - 10,
        format('Cuidado! A-Train deve descansar. Saúde agora é ~w%.~n', [SaudeFinal])
    ; SaudeFinal is SaudeInicial,
        format('A-Train está bem, saúde estável: ~w%.~n', [SaudeFinal])
    ).

% Regra para descansar
descansar(BatimentosIniciais, BatimentosFinais) :-
    (BatimentosIniciais > 70 ->
        BatimentosFinais is BatimentosIniciais - 5,
        format('A-Train está descansando... Batimentos agora são ~w bpm.~n', [BatimentosFinais]),
        descansar(BatimentosFinais, _)
    ; BatimentosFinais = 70,
        format('A-Train descansou completamente. Batimentos normais: 70 bpm.~n')
    ).

% Exemplo de uso
:- a_train(Saude, Batimentos, false, Velocidade),
   correr(100, Saude, Batimentos, false, Velocidade, NovaSaude, NovosBatimentos),
   usar_composto_v(Velocidade, NovosBatimentos, NovaVelocidade, BatimentosCompostoV),
   correr(200, NovaSaude, BatimentosCompostoV, true, NovaVelocidade, SaudeFinal, BatimentosFinais),
   parar_composto_v(NovaVelocidade, VelocidadeFinal),
   descansar(BatimentosFinais, _).
