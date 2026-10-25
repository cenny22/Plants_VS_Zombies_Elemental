#region CREATE

global.sois = 100;
global.fase_iniciada = false;
global.planta_selecionada = noone; 

global.plantas_escolhidas = ds_list_create();
global.zumbis_mortos = 0;

// ============================================================
// CONFIGURAÇÕES DO SISTEMA DE HORDAS
// ============================================================

tempo_fase = room_speed * 60; // Tempo de espera entre cada fase/horda (ex: 15s)

// Tabelas de zumbis
zumbi_inicial = [obj_zumbi_basico];
zumbis_horda1 = [obj_zumbi_basico, obj_zumbi_cone];
zumbis_horda2 = [obj_zumbi_arbusto, obj_zumbi_balde];
zumbis_horda3 = [obj_zumbi_cone, obj_zumbi_balde, obj_zumbi_arbusto];
zumbis_intermediarios = [obj_zumbi_arbusto];

// Quantidade de zumbis em cada horda
qtd_horda1 = 10;
qtd_horda2 = 12;
qtd_horda3 = 15;

// Fluxo da Fase:
// 0: Espera inicio | 1: Zumbi inicial | 2: Horda 1 (Spawn em bloco)
// 3: Intermediários 1 | 4: Horda 2 (Spawn em bloco) | 5: Intermediários 2
// 6: Horda 3 (Spawn em bloco) | 7: Aguardando vitória
fase_etapa = 0;
zumbis_mortos_horda_inicio = 0;
fase_vencida = false;

// Controle suave do progresso visual da barra (0 a 1)
progresso_barra = 0;

// Timer para a mensagem da horda
aviso_horda_timer = 0;

#endregion