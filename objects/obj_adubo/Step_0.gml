#region OBJ_ADUBO_COLETAVEL — STEP

// ============================================================
// MOVER PELA TELA
// ============================================================

x += velocidade_h;
y += velocidade_v;

// Rebate nas bordas horizontais
if (x <= limite_esquerda || x >= limite_direita)
{
    velocidade_h *= -1; // Inverte a direção horizontal
}

// Rebate nas bordas verticais
if (y <= limite_topo || y >= limite_baixo)
{
    velocidade_v *= -1; // Inverte a direção vertical
}

#endregion