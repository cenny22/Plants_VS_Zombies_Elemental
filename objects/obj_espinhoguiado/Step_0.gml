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
    // NORDESTE
    // ========================================================

    var _guia_ne = instance_create_layer(
        x + 10,
        y - 10,
        "Instances",
        obj_guia
    );

    _guia_ne.direction = 45;

    // ========================================================
    // NORTE
    // ========================================================

    var _guia_n = instance_create_layer(
        x + 10,
        y - 10,
        "Instances",
        obj_guia
    );

    _guia_n.direction = 90;

    // ========================================================
    // LESTE
    // ========================================================

    var _guia_l = instance_create_layer(
        x + 10,
        y - 10,
        "Instances",
        obj_guia
    );

    _guia_l.direction = 0;

    // ========================================================
    // SUDESTE
    // ========================================================

    var _guia_se = instance_create_layer(
        x + 10,
        y - 10,
        "Instances",
        obj_guia
    );

    _guia_se.direction = 315;

    // ========================================================
    // SUL
    // ========================================================

    var _guia_s = instance_create_layer(
        x + 10,
        y - 10,
        "Instances",
        obj_guia
    );

    _guia_s.direction = 270;

    // ========================================================
    // SUDOESTE
    // ========================================================

    var _guia_so = instance_create_layer(
        x + 10,
        y - 10,
        "Instances",
        obj_guia
    );

    _guia_so.direction = 225;

    // ========================================================
    // OESTE
    // ========================================================

    var _guia_o = instance_create_layer(
        x + 10,
        y - 10,
        "Instances",
        obj_guia
    );

    _guia_o.direction = 180;

    // ========================================================
    // NOROESTE
    // ========================================================

    var _guia_no = instance_create_layer(
        x + 10,
        y - 10,
        "Instances",
        obj_guia
    );

    _guia_no.direction = 135;

    // ========================================================
    // DOIS GUIAS PARA FRENTE
    // ========================================================

    var _guia_frente_1 =
        instance_create_layer(
            x + 10,
            y - 10,
            "Instances",
            obj_guia
        );

    _guia_frente_1.direction = 90;

    var _guia_frente_2 =
        instance_create_layer(
            x - 10,
            y - 10,
            "Instances",
            obj_guia
        );

    _guia_frente_2.direction = 90;

    // ========================================================
    // ADUBO CONSUMIDO
    // ========================================================

    adubo_ativado = false;
}

#endregion