// ============================================================
// QUADRADO GRID — LEFT PRESSED
// Sistema de plantio / esteira / cooldown
// ============================================================


#region 1. SEGURANÇA E INICIALIZAÇÃO

// ------------------------------------------------------------
// CHECAGEM DE SEGURANÇA — VARIÁVEIS GLOBAIS
// ------------------------------------------------------------

if (!variable_global_exists("planta_selecionada"))
{
    global.planta_selecionada = noone;
}

if (!variable_global_exists("fase_iniciada"))
{
    global.fase_iniciada = true;
}

// ============================================================
// AVISO — SÓIS INSUFICIENTES
// ============================================================

if (!variable_global_exists("global.aviso_sois_timer"))
{
    global.aviso_sois_timer = 0;
}

#endregion


#region 2. LIMPEZA AUTOMÁTICA DO QUADRADO

// Se o quadrado estava marcado como ocupado,
// mas nenhuma planta/cova correspondente existe mais,
// libera o quadrado automaticamente.

if (
    ocupado == true
    && !position_meeting(x, y, obj_planta_parent)
    && !position_meeting(x, y, obj_ervaespinho)
    && !position_meeting(x, y, obj_cova_infectada)
    && !position_meeting(x, y, obj_enroscacovas_cova)
)
{
    ocupado = false;
}

#endregion


#region 3. DETECÇÃO DE FASES ESPECIAIS

// Fase da esteira
var e_fase_esteira =
    (room_get_name(room) == "Room_fase15_planta")
    ||
    (
        variable_global_exists("modo_esteira")
        && global.modo_esteira == true
    );


// Fase 28
var e_fase_28 =
    (room_get_name(room) == "Room_fase28_planta");

#endregion


#region 4. TRAVA DE PARTIDA E SELEÇÃO

// Só permite plantar se:
// - a fase estiver iniciada OU for fase de esteira
// - existir uma planta selecionada

if (
    (global.fase_iniciada || e_fase_esteira)
    && global.planta_selecionada != noone
)
{
    
    var obj_para_criar = global.planta_selecionada;


    // --------------------------------------------------------
    // CONVERTE STRING PARA OBJETO
    // --------------------------------------------------------

    if (is_string(obj_para_criar))
    {
        obj_para_criar = asset_get_index(obj_para_criar);
    }


    // --------------------------------------------------------
    // PEGA O NOME DO OBJETO COM SEGURANÇA
    // --------------------------------------------------------

    var nome_obj = "";

    if (object_exists(obj_para_criar))
    {
        nome_obj = object_get_name(obj_para_criar);
    }

    var planta = planta_obter_por_objeto(obj_para_criar);
    if (is_undefined(planta)) {
        exit;
    }

#endregion


#region 5. COVACEPS

    if (nome_obj == "obj_covaceps")
    {
        
        var cova_alvo =
            instance_position(x, y, obj_cova_sono);

        var custo_covaceps =
            e_fase_esteira ? 0 : planta.custo;


        if (
            cova_alvo != noone
            && (e_fase_esteira || global.sois >= custo_covaceps)
        )
        {
            
            // ------------------------------------------------
            // CUSTO
            // ------------------------------------------------

            if (!e_fase_esteira)
            {
                global.sois -= custo_covaceps;
            }


            // ------------------------------------------------
            // REMOVE COVA DO SONO
            // ------------------------------------------------

            with (cova_alvo)
            {
                instance_destroy();
            }


            // ------------------------------------------------
            // CRIA COVA INFECTADA
            // ------------------------------------------------

            instance_create_layer(
                x,
                y,
                "Instances",
                obj_cova_infectada
            );

            ocupado = true;


            // ------------------------------------------------
            // REMOVE PACOTE DA ESTEIRA
            // ------------------------------------------------

            if (
                e_fase_esteira
                && variable_global_exists("pacote_atual_esteira")
                && instance_exists(global.pacote_atual_esteira)
            )
            {
                with (global.pacote_atual_esteira)
                {
                    instance_destroy();
                }

                global.pacote_atual_esteira = noone;
            }


            // ------------------------------------------------
            // COOLDOWN
            // ------------------------------------------------

            if (
                variable_global_exists("barra_selecionada")
                && instance_exists(global.barra_selecionada)
            )
            {
                if (e_fase_28)
                {
                    global.barra_selecionada.tempo_cooldown_max = 0;
                    global.barra_selecionada.tempo_cooldown_atual = 0;
                    global.barra_selecionada.em_cooldown = false;
                }
                else if (!e_fase_esteira)
                {
                    global.barra_selecionada.tempo_cooldown_max = planta.recarga;
                    global.barra_selecionada.tempo_cooldown_atual = planta.recarga;
                    global.barra_selecionada.em_cooldown = true;
                }
            }


            // ------------------------------------------------
            // LIMPA SELEÇÃO
            // ------------------------------------------------

            global.planta_selecionada = noone;
            global.barra_selecionada = noone;
        }
    }

#endregion


#region 6. ENROSCACOVAS

    else if (nome_obj == "obj_enroscacovas")
    {
        
        var cova_alvo =
            instance_position(x, y, obj_cova_sono);

        var custo_enroscacovas =
            e_fase_esteira ? 0 : planta.custo;


        if (
            cova_alvo != noone
            && (e_fase_esteira || global.sois >= custo_enroscacovas)
        )
        {
            
            // ------------------------------------------------
            // CUSTO
            // ------------------------------------------------

            if (!e_fase_esteira)
            {
                global.sois -= custo_enroscacovas;
            }


            // ------------------------------------------------
            // REMOVE COVA
            // ------------------------------------------------

            with (cova_alvo)
            {
                instance_destroy();
            }


            // ------------------------------------------------
            // CRIA ENROSCACOVAS
            // ------------------------------------------------

            instance_create_layer(
                x,
                y,
                "Instances",
                obj_enroscacovas_cova
            );

            ocupado = true;


            // ------------------------------------------------
            // REMOVE PACOTE DA ESTEIRA
            // ------------------------------------------------

            if (
                e_fase_esteira
                && variable_global_exists("pacote_atual_esteira")
                && instance_exists(global.pacote_atual_esteira)
            )
            {
                with (global.pacote_atual_esteira)
                {
                    instance_destroy();
                }

                global.pacote_atual_esteira = noone;
            }


            // ------------------------------------------------
            // COOLDOWN
            // ------------------------------------------------

            if (
                variable_global_exists("barra_selecionada")
                && instance_exists(global.barra_selecionada)
            )
            {
                if (e_fase_28)
                {
                    global.barra_selecionada.tempo_cooldown_max = 0;
                    global.barra_selecionada.tempo_cooldown_atual = 0;
                    global.barra_selecionada.em_cooldown = false;
                }
                else if (!e_fase_esteira)
                {
                    global.barra_selecionada.tempo_cooldown_max = planta.recarga;
                    global.barra_selecionada.tempo_cooldown_atual = planta.recarga;
                    global.barra_selecionada.em_cooldown = true;
                }
            }


            // ------------------------------------------------
            // LIMPA SELEÇÃO
            // ------------------------------------------------

            global.planta_selecionada = noone;
            global.barra_selecionada = noone;
        }
    }

#endregion


#region 7. PLANTAS NORMAIS

    else
    {
        
        // ----------------------------------------------------
        // VERIFICA SE O QUADRADO ESTÁ LIVRE
        // ----------------------------------------------------

        if (
            !position_meeting(x, y, obj_planta_parent)
            && !position_meeting(x, y, obj_ervaespinho)
            && ocupado == false
        )
        {
            
            var custo_planta = planta.custo;
            var tempo_recarga = planta.recarga;

            #endregion


            #region 7.2 CRIAÇÃO DA PLANTA

            // Planta sem custo na esteira
            // OU
            // jogador possui sóis suficientes

            if (
                (e_fase_esteira || global.sois >= custo_planta)
                && object_exists(obj_para_criar)
            )
            {
                
                // ------------------------------------------------
                // REMOVE SÓIS
                // ------------------------------------------------

                if (!e_fase_esteira)
                {
                    global.sois -= custo_planta;
                }


                // ------------------------------------------------
                // CRIA PLANTA
                // ------------------------------------------------

                instance_create_layer(
                    x,
                    y,
                    "Instances",
                    obj_para_criar
                );

                ocupado = true;


                // ------------------------------------------------
                // REMOVE PACOTE DA ESTEIRA
                // ------------------------------------------------

                if (
                    e_fase_esteira
                    && variable_global_exists("pacote_atual_esteira")
                    && instance_exists(global.pacote_atual_esteira)
                )
                {
                    with (global.pacote_atual_esteira)
                    {
                        instance_destroy();
                    }

                    global.pacote_atual_esteira = noone;
                }


                // ------------------------------------------------
                // COOLDOWN
                // ------------------------------------------------

                if (
                    variable_global_exists("barra_selecionada")
                    && instance_exists(global.barra_selecionada)
                )
                {
                    if (e_fase_28)
                    {
                        global.barra_selecionada.tempo_cooldown_max = 0;
                        global.barra_selecionada.tempo_cooldown_atual = 0;
                        global.barra_selecionada.em_cooldown = false;
                    }
                    else if (!e_fase_esteira)
                    {
                        global.barra_selecionada.tempo_cooldown_max = tempo_recarga;
                        global.barra_selecionada.tempo_cooldown_atual = tempo_recarga;
                        global.barra_selecionada.em_cooldown = true;
                    }
                }


                // ------------------------------------------------
                // LIMPA SELEÇÃO
                // ------------------------------------------------

                global.planta_selecionada = noone;
                global.barra_selecionada = noone;
            }
			else
{
    // ========================================================
    // AVISO — SÓIS INSUFICIENTES
    // ========================================================

    if (!e_fase_esteira && global.sois < custo_planta)
    {
        global.aviso_sois_timer = 222;
    }
}
            #endregion
        }
    }

#endregion
}
