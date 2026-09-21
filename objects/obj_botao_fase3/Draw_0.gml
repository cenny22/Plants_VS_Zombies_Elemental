// 1. Desenha sempre o botão no fundo
draw_self();

// 2. Se as vitórias forem menores que 4, a fase está bloqueada e desenha o cadeado
if (global.vitorias < 2) {
    
    // Desenha o cadeado exatamente no centro do botão
    if (sprite_exists(Spr_cadeado)) {
        draw_sprite(Spr_cadeado, 0, x, y);
    }
}