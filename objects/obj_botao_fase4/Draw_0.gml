// 1. Desenha o botão normal
draw_self();

// 2. Se não tiver vitórias suficientes (para a Fase 4 precisa de 3 vitórias, por exemplo)
if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias < 3) {
    if (sprite_exists(Spr_cadeado)) {
        draw_sprite(Spr_cadeado, 0, x, y);
    }
}