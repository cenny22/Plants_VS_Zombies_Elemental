// 1. PRIMEIRO: Manda o botão desenhar o seu próprio sprite normal (a foto da fase)
draw_self();

// 2. SEGUNDO: Se for o botão da Fase 2 e ela estiver trancada, desenha o cadeado por cima
if (tipo == "fase_2") {
    // Garante que a variável existe antes de checar
    if (!variable_global_exists("fase2_desbloqueada")) {
        global.fase2_desbloqueada = false;
    }
    
    // Se estiver falsa (trancada), desenha o cadeado exatamente na mesma posição do botão
if (global.vitorias <= 0) {
        draw_sprite(Spr_cadeado, 0, x, y);
    }
}

// 3. TERCEIRO: Se for o botão da Fase 3 e ela estiver trancada, desenha o cadeado por cima
if (tipo == "fase_3") {
    // Garante que a variável da fase 3 existe antes de checar
    if (!variable_global_exists("fase3_desbloqueada")) {
        global.fase3_desbloqueada = false;
    }
    
    // Se estiver falsa (trancada), desenha o cadeado por cima do botão da fase 3
    if (global.fase3_desbloqueada == false) {
        draw_sprite(Spr_cadeado, 0, x, y);
    }
}