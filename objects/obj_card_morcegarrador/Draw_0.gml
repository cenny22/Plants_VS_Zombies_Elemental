// 1. Desenha a base do card
draw_self();

var desbloqueada = false;
if (variable_global_exists("plantas_liberadas") && ds_exists(global.plantas_liberadas, ds_type_map)) {
    desbloqueada = ds_map_find_value(global.plantas_liberadas, planta_tipo);
}

draw_set_font(fnt_menu);

if (desbloqueada == true) {
    draw_sprite(sprite_planta, 0, x, y);
    
    if (variable_global_exists("plantas_escolhidas") && ds_exists(global.plantas_escolhidas, ds_type_list)) {
        if (ds_list_find_index(global.plantas_escolhidas, planta_tipo) != -1) {
            draw_set_alpha(0.4);
            draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, c_black, c_black, c_black, false);
            draw_set_alpha(1.0);
        }
    }
} else {
    draw_sprite_ext(sprite_planta, 0, x, y, 1, 1, 0, c_dkgray, 1);
    
    if (sprite_exists(Spr_cadeado)) {
        var centro_x = x + (sprite_width / 2) - (sprite_get_width(Spr_cadeado) / 2);
        var centro_y = y + (sprite_height / 2) - (sprite_get_height(Spr_cadeado) / 2);
        draw_sprite(Spr_cadeado, 0, centro_x, centro_y);
    }
}

// Desenha o custo em sóis
draw_set_color(c_yellow);
draw_text(x + 15, y + 55, string(custo));

// ==========================================================
// DESENHA O EFEITO DE COOLDOWN DURANTE A PARTIDA
// ==========================================================
if (global.fase_iniciada && em_cooldown) {
    var porcentagem = tempo_cooldown_atual / tempo_cooldown_max;
    
    // Desenha sombra escura cobrindo a carta proporcionalmente
    draw_set_color(c_black);
    draw_set_alpha(0.6 * porcentagem);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
    
    // Desenha o texto do tempo restante
    draw_set_alpha(1.0);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_text((bbox_left + bbox_right) / 2, (bbox_top + bbox_bottom) / 2, string_format(tempo_cooldown_atual, 1, 1) + "s");
    
    // Reseta formatação
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}