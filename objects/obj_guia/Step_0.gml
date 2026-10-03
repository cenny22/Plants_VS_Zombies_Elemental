#region
// ============================================================
// GUIA — PERSEGUIÇÃO / DIREÇÃO DO ADUBO
// ============================================================

var zumbi_comum =
    instance_nearest(
        x,
        y,
        obj_zumbi_parent
    );

var zumbi_arbusto =
    instance_nearest(
        x,
        y,
        obj_zumbi_arbusto
    );

alvo = noone;

// ============================================================
// MODO NORMAL
// ============================================================

if (!modo_direcionado)
{
    // ========================================================
    // CASO 1 — EXISTEM OS DOIS
    // ========================================================

    if (
        instance_exists(zumbi_comum)
        &&
        instance_exists(zumbi_arbusto)
    )
    {
        var dist_comum =
            distance_to_object(zumbi_comum);

        var dist_arbusto =
            distance_to_object(zumbi_arbusto);

        var arbusto_valido =
            (
                variable_instance_exists(
                    zumbi_arbusto,
                    "estado"
                )
                &&
                zumbi_arbusto.estado == "comendo"
            );

        if (
            arbusto_valido
            &&
            dist_arbusto < dist_comum
        )
        {
            alvo = zumbi_arbusto;
        }
        else
        {
            alvo = zumbi_comum;
        }
    }

    // ========================================================
    // CASO 2 — SÓ ZUMBI COMUM
    // ========================================================

    else if (instance_exists(zumbi_comum))
    {
        alvo = zumbi_comum;
    }

    // ========================================================
    // CASO 3 — SÓ ZUMBI ARBUSTO
    // ========================================================

    else if (instance_exists(zumbi_arbusto))
    {
        if (
            variable_instance_exists(
                zumbi_arbusto,
                "estado"
            )
            &&
            zumbi_arbusto.estado == "comendo"
        )
        {
            alvo = zumbi_arbusto;
        }
    }

    // ========================================================
    // PERSEGUE O ALVO
    // ========================================================

    if (instance_exists(alvo))
    {
        var dir =
            point_direction(
                x,
                y,
                alvo.x,
                alvo.y
            );

        direction = dir;

        image_angle = dir;

        speed = vel;
    }
    else
    {
        speed = vel;
    }
}

// ============================================================
// MODO ADUBO
// ============================================================

else
{
    // ========================================================
    // NÃO PROCURA ZUMBIS
    // ========================================================
    // A direção definida no momento do disparo permanece.

    speed = vel;

    image_angle = direction;
}

// ============================================================
// DESTRÓI FORA DA SALA
// ============================================================

if (
    x < -50
    ||
    x > room_width + 50
    ||
    y < -50
    ||
    y > room_height + 50
)
{
    instance_destroy();
}

#endregion