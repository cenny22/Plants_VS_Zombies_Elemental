#region OBJ_ADUBO_COLETAVEL — CREATE

// Garante que fique na frente das plantas e zumbis
depth = -10000;

// ============================================================
// MOVIMENTAÇÃO PELA TELA
// ============================================================

velocidade_h = choose(-2, 2); // Define se começa indo para esquerda ou direita
velocidade_v = choose(-1.5, 1.5); // Movimento vertical para andar na tela inteira

// Limites da tela onde ele pode andar (ajuste conforme o tamanho da sua room)
limite_esquerda = 50;
limite_direita = room_width - 50;
limite_topo = 100;
limite_baixo = room_height - 100;

#endregion