// ============================================================
// SOL — MOVIMENTO
// ============================================================

if (sol_do_girassol)
{
    // ========================================================
    // SOL DO GIRASSOL
    // ========================================================

    if (fase_movimento == 0)
    {
        // SUBINDO
        y -= velocidade_sol;

        if (y <= y_inicial - altura_subida)
        {
            y = y_inicial - altura_subida;
            fase_movimento = 1;
        }
    }
    else if (fase_movimento == 1)
    {
        // DESCENDO
        y += velocidade_sol;

        if (y >= y_inicial)
        {
            y = y_inicial;
            fase_movimento = 2;
        }
    }
}
else
{
    // ========================================================
    // SOL NORMAL — CAINDO
    // ========================================================

    if (y >= alvo_y)
    {
        vspeed = 0;
    }
    else
    {
        vspeed = 2;
    }
}

#region
// ============================================================
// SOL INDO PARA O CONTADOR
// ============================================================

if (coletado)
{
    // ========================================================
    // DISTÂNCIA ATÉ O CONTADOR
    // ========================================================

    var _distancia = point_distance(
        x,
        y,
        destino_x,
        destino_y
    );

    // ========================================================
    // CHEGOU AO DESTINO
    // ========================================================

    if (_distancia <= velocidade_coleta)
    {
        x = destino_x;
        y = destino_y;

        global.sois += valor_sol;

        instance_destroy();
    }
    else
    {
        // ====================================================
        // MOVIMENTO ATÉ O CONTADOR
        // ====================================================

        var _direcao = point_direction(
            x,
            y,
            destino_x,
            destino_y
        );

        x += lengthdir_x(
            velocidade_coleta,
            _direcao
        );

        y += lengthdir_y(
            velocidade_coleta,
            _direcao
        );
    }
}

#endregion