#region
// ============================================================
// PLANTA — ATAQUE / ADUBO
// ============================================================

event_inherited();

// ============================================================
// ADUBO NÃO ATIVADO
// ============================================================

if (!adubo_ativado)
{
    if (pode_atirar)
    {
        var alvo_valido = false;

        // ====================================================
        // 1. CHECA ZUMBI COMUM
        // ====================================================

        if (instance_exists(obj_zumbi_parent))
        {
            alvo_valido = true;
        }

        // ====================================================
        // 2. CHECA ZUMBI ARBUSTO
        // ====================================================

        else if (instance_exists(obj_zumbi_arbusto))
        {
            var arbusto =
                instance_find(obj_zumbi_arbusto, 0);

            if (
                instance_exists(arbusto)
                &&
                variable_instance_exists(
                    arbusto,
                    "estado"
                )
                &&
                arbusto.estado == "comendo"
            )
            {
                alvo_valido = true;
            }
        }

        // ====================================================
        // DISPARO NORMAL
        // ====================================================

        if (alvo_valido)
        {
            instance_create_layer(
                x + 10,
                y - 10,
                "Instances",
                obj_guia
            );

            pode_atirar = false;

            alarm[0] =
                game_get_speed(gamespeed_fps) * 2.5;
        }
    }
}

// ============================================================
// ADUBO ATIVADO
// ============================================================

else
{
    // ========================================================
    // CONFIGURAÇÕES
    // ========================================================

    var _quantidade_por_direcao = 5;

    // ========================================================
    // TODAS AS 8 DIREÇÕES
    // ========================================================

    var _direcoes = [
        0,
        45,
        90,
        135,
        180,
        225,
        270,
        315
    ];

    // ========================================================
    // DISPARA PARA TODOS OS LADOS
    // ========================================================

    for (
        var _d = 0;
        _d < array_length(_direcoes);
        _d++
    )
    {
        var _direcao =
            _direcoes[_d];

        // ----------------------------------------------------
        // VÁRIOS TIROS NA MESMA DIREÇÃO
        // ----------------------------------------------------

        for (
            var _i = 0;
            _i < _quantidade_por_direcao;
            _i++
        )
        {
            var _deslocamento =
                (_i - 2) * 6;

            var _guia =
                instance_create_layer(
                    x + lengthdir_x(
                        _deslocamento,
                        _direcao + 90
                    ),
                    y - 10 + lengthdir_y(
                        _deslocamento,
                        _direcao + 90
                    ),
                    "Instances",
                    obj_guia
                );

            // ------------------------------------------------
            // DIREÇÃO DO TIRO
            // ------------------------------------------------

            _guia.direction =
                _direcao;

            // ------------------------------------------------
            // NÃO PERSEGUE ZUMBI
            // ------------------------------------------------

            _guia.modo_direcionado = true;
        }
    }

    // ========================================================
    // MUITO MAIS TIROS PARA FRENTE
    // ========================================================

    var _frente = 0;

    while (_frente < 15)
    {
        var _guia_frente =
            instance_create_layer(
                x + ((_frente - 7) * 5),
                y - 10,
                "Instances",
                obj_guia
            );

        _guia_frente.direction = 90;

        // NÃO PERSEGUE ZUMBI
        _guia_frente.modo_direcionado = true;

        _frente++;
    }

    // ========================================================
    // TIROS EXTRAS EM 360°
    // ========================================================

    var _extra = 0;

    while (_extra < 16)
    {
        var _angulo =
            _extra * 22.5;

        var _guia_extra =
            instance_create_layer(
                x,
                y - 10,
                "Instances",
                obj_guia
            );

        _guia_extra.direction =
            _angulo;

        // NÃO PERSEGUE ZUMBI
        _guia_extra.modo_direcionado = true;

        _extra++;
    }

    // ========================================================
    // SPRITE DO ADUBO
    // ========================================================

    sprite_index =
        spr_espinhoguiado_adubo;

    // ========================================================
    // TEMPO DA SPRITE
    // ========================================================

    alarm[1] =
        game_get_speed(gamespeed_fps) * 1.2;

    // ========================================================
    // ADUBO CONSUMIDO
    // ========================================================

    adubo_ativado = false;
}

#endregion