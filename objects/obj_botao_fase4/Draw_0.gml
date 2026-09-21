// 1. Desenha o botão normal
draw_self();

if (global.vitorias < 3) {
    if (sprite_exists(Spr_cadeado)) {
        draw_sprite(Spr_cadeado, 0, x, y);
    }
}