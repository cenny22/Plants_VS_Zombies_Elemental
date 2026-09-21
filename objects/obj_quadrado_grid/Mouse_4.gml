// CHECAGEM DE SEGURANÇA
if (!variable_global_exists("planta_selecionada")) {
    global.planta_selecionada = noone;
}

if (!variable_global_exists("fase_iniciada")) {
    global.fase_iniciada = true;
}

// CORREÇÃO DO BUG (LIMPEZA AUTOMÁTICA SE A PLANTA JÁ MORREU)
if (ocupado == true && !position_meeting(x, y, obj_planta_parent) && !position_meeting(x, y, obj_ervaespinho) && !position_meeting(x, y, obj_cova_infectada) && !position_meeting(x, y, obj_enroscacovas_cova)) {
    ocupado = false;
}

// DETECÇÃO AUTOMÁTICA DE MODO ESTEIRA E FASE 28
var e_fase_esteira = (room_get_name(room) == "Room_fase15_planta") || (variable_global_exists("modo_esteira") && global.modo_esteira == true);
var e_fase_28 = (room_get_name(room) == "Room_fase28_planta"); // Zera o cooldown apenas se for esta room

// TRAVA DE PARTIDA E SELEÇÃO
if ((global.fase_iniciada || e_fase_esteira) && global.planta_selecionada != noone) {
    
    var obj_para_criar = global.planta_selecionada;
    
    // Converte string para índice de objeto se necessário
    if (is_string(obj_para_criar)) {
        obj_para_criar = asset_get_index(obj_para_criar);
    }

    // Pega o nome textual do objeto com segurança
    var nome_obj = object_exists(obj_para_criar) ? object_get_name(obj_para_criar) : "";

    // ==========================================
    // 1. CASO ESPECIAL: COVACEPS
    // ==========================================
    if (nome_obj == "obj_covaceps") {
        
        var cova_alvo = instance_position(x, y, obj_cova_sono);
        var custo_covaceps = e_fase_esteira ? 0 : 50; 
        
        if (cova_alvo != noone && (e_fase_esteira || global.sois >= custo_covaceps)) {
            
            if (!e_fase_esteira) {
                global.sois -= custo_covaceps;
            }
            
            with (cova_alvo) {
                instance_destroy();
            }
            
            instance_create_layer(x, y, "Instances", obj_cova_infectada);
            ocupado = true;
            
            // Destrói o pacote da esteira
            if (e_fase_esteira && variable_global_exists("pacote_atual_esteira") && instance_exists(global.pacote_atual_esteira)) {
                with (global.pacote_atual_esteira) {
                    instance_destroy();
                }
                global.pacote_atual_esteira = noone;
            }
            
            // Aplica Cooldown
            if (variable_global_exists("barra_selecionada") && instance_exists(global.barra_selecionada)) {
                if (e_fase_28) {
                    global.barra_selecionada.tempo_cooldown_max = 0;
                    global.barra_selecionada.tempo_cooldown_atual = 0;
                    global.barra_selecionada.em_cooldown = false;
                } else if (!e_fase_esteira) {
                    global.barra_selecionada.tempo_cooldown_max = 90.0;
                    global.barra_selecionada.tempo_cooldown_atual = 90.0;
                    global.barra_selecionada.em_cooldown = true;
                }
            }

            global.planta_selecionada = noone;
            global.barra_selecionada = noone;
        }
    }
    // ==========================================
    // 1.1. CASO ESPECIAL: ENROSCACOVAS
    // ==========================================
    else if (nome_obj == "obj_enroscacovas") {
        
        var cova_alvo = instance_position(x, y, obj_cova_sono);
        var custo_enroscacovas = e_fase_esteira ? 0 : 50;
        
        if (cova_alvo != noone && (e_fase_esteira || global.sois >= custo_enroscacovas)) {
            
            if (!e_fase_esteira) {
                global.sois -= custo_enroscacovas;
            }
            
            with (cova_alvo) {
                instance_destroy();
            }
            
            instance_create_layer(x, y, "Instances", obj_enroscacovas_cova);
            ocupado = true;
            
            // Destrói o pacote da esteira
            if (e_fase_esteira && variable_global_exists("pacote_atual_esteira") && instance_exists(global.pacote_atual_esteira)) {
                with (global.pacote_atual_esteira) {
                    instance_destroy();
                }
                global.pacote_atual_esteira = noone;
            }
            
            // Aplica Cooldown
            if (variable_global_exists("barra_selecionada") && instance_exists(global.barra_selecionada)) {
                if (e_fase_28) {
                    global.barra_selecionada.tempo_cooldown_max = 0;
                    global.barra_selecionada.tempo_cooldown_atual = 0;
                    global.barra_selecionada.em_cooldown = false;
                } else if (!e_fase_esteira) {
                    global.barra_selecionada.tempo_cooldown_max = 20.0;
                    global.barra_selecionada.tempo_cooldown_atual = 20.0;
                    global.barra_selecionada.em_cooldown = true;
                }
            }

            global.planta_selecionada = noone;
            global.barra_selecionada = noone;
        }
    }
    // ==========================================
    // 2. CASO GERAL: PLANTAS NORMAIS
    // ==========================================
    else {
        
        if (!position_meeting(x, y, obj_planta_parent) && !position_meeting(x, y, obj_ervaespinho) && ocupado == false) {
            
            var custo_planta = 0;
            var tempo_recarga = 7.5;

            // DEFINIÇÃO DE CUSTO E RECARGA
            if (!e_fase_esteira) {
                if (nome_obj == "obj_disparervilha" || nome_obj == "obj_disparaervilha") { custo_planta = 100; tempo_recarga = 7.5; }
                else if (nome_obj == "obj_girassol")     { custo_planta = 50;  tempo_recarga = 7.5; }
                else if (nome_obj == "obj_noz_obstaculo"){ custo_planta = 50;  tempo_recarga = 15.0; }
                else if (nome_obj == "obj_ervaespinho")  { custo_planta = 100; tempo_recarga = 7.5; }
                else if (nome_obj == "obj_batatamina")   { custo_planta = 25;  tempo_recarga = 20.0; }
                else if (nome_obj == "obj_esparabalde")  { custo_planta = 75;  tempo_recarga = 15.0; }
                else if (nome_obj == "obj_repepe_cao")   { custo_planta = 75;  tempo_recarga = 15.0; }
                else if (nome_obj == "obj_duplervilha")  { custo_planta = 175; tempo_recarga = 10.0; }
                else if (nome_obj == "obj_brotoflorescedor") { custo_planta = 75; tempo_recarga = 5.0; }
                else if (nome_obj == "obj_veudenoiva")  { custo_planta = 150; tempo_recarga = 7.5; }
                else if (nome_obj == "obj_morcegarrador") { custo_planta = 100; tempo_recarga = 40.0; }
                else if (nome_obj == "obj_triplervilha")  { custo_planta = 275; tempo_recarga = 15.0; }
                else if (nome_obj == "obj_espinhoguiado") { custo_planta = 250; tempo_recarga = 15.0; }
                else if (nome_obj == "obj_trepaervilha") { custo_planta = 125; tempo_recarga = 15.0; }
            }
            
            // Planta sem custo na esteira OU com sóis suficientes nas fases normais
            if ((e_fase_esteira || global.sois >= custo_planta) && object_exists(obj_para_criar)) {
                
                if (!e_fase_esteira) {
                    global.sois -= custo_planta;
                }

                instance_create_layer(x, y, "Instances", obj_para_criar);
                ocupado = true; 
                
                // Destrói o card vindo da esteira
                if (e_fase_esteira && variable_global_exists("pacote_atual_esteira") && instance_exists(global.pacote_atual_esteira)) {
                    with (global.pacote_atual_esteira) {
                        instance_destroy();
                    }
                    global.pacote_atual_esteira = noone;
                }
                
                // Aplica Cooldown
                if (variable_global_exists("barra_selecionada") && instance_exists(global.barra_selecionada)) {
                    if (e_fase_28) {
                        global.barra_selecionada.tempo_cooldown_max = 0;
                        global.barra_selecionada.tempo_cooldown_atual = 0;
                        global.barra_selecionada.em_cooldown = false;
                    } else if (!e_fase_esteira) {
                        global.barra_selecionada.tempo_cooldown_max = tempo_recarga;
                        global.barra_selecionada.tempo_cooldown_atual = tempo_recarga;
                        global.barra_selecionada.em_cooldown = true;
                    }
                }

                global.planta_selecionada = noone; 
                global.barra_selecionada = noone;
            }
        }
    }
}