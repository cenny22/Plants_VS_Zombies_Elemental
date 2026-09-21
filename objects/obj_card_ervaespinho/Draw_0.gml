// 1. Desenha a base do card
draw_self();

// Trava de segurança: verifica se a estrutura de plantas liberadas existe
var desbloqueada = false;
if (variable_global_exists("plantas_liberadas") && ds_exists(global.plantas_liberadas, ds_type_map)) {
    desbloqueada = ds_map_find_value(global.plantas_liberadas, planta_tipo);
}

// Configurações de texto padrão
draw_set_font(fnt_menu);

if (desbloqueada == true) {
    // Desenha o sprite da planta normalmente
    draw_sprite(sprite_planta, 0, x, y);
    
    // Trava de segurança para a lista de plantas escolhidas
    if (variable_global_exists("plantas_escolhidas") && ds_exists(global.plantas_escolhidas, ds_type_list)) {
        // Se já estiver selecionada na barra, desenha uma camada escura por cima
        if (ds_list_find_index(global.plantas_escolhidas, planta_tipo) != -1) {
            draw_set_alpha(0.4);
            draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, c_black, c_black, c_black, false);
            draw_set_alpha(1.0);
        }
    }
} else {
    // Desenha a planta escurecida caso esteja bloqueada
    draw_sprite_ext(sprite_planta, 0, x, y, 1, 1, 0, c_dkgray, 1);
    
    // Desenha o cadeado centralizado no card
    if (sprite_exists(Spr_cadeado)) {
        var centro_x = x + (sprite_width / 2) - (sprite_get_width(Spr_cadeado) / 2);
        var centro_y = y + (sprite_height / 2) - (sprite_get_height(Spr_cadeado) / 2);
        draw_sprite(Spr_cadeado, 0, centro_x, centro_y);
    }
}

// Desenha o custo em sóis
draw_set_color(c_yellow);
draw_text(x + 15, y + 55, string(custo));