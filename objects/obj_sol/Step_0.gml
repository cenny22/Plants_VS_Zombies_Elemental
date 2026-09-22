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