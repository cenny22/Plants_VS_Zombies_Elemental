// 1. Garante a existência do type
if (!variable_instance_exists(id, "type")) {
    type = 1;
}

var index = type - 1;

if (variable_global_exists("plantas_escolhidas") && ds_exists(global.plantas_escolhidas, ds_type_list)) {
    if (index < ds_list_size(global.plantas_escolhidas)) {
        var nome_planta = ds_list_find_value(global.plantas_escolhidas, index);
        
        if (nome_planta == "disparervilha" || nome_planta == "disparaervilha") sprite_index = Sprite6_1;
        else if (nome_planta == "girassol")     sprite_index = Sprite12_2;
        else if (nome_planta == "noz")          sprite_index = Sprite23_3;
        else if (nome_planta == "ervaespinho")  sprite_index = spr_ervaespinho_1;
        else if (nome_planta == "batatamina")   sprite_index = spr_batata_mina_charged;
        else if (nome_planta == "esparabalde")  sprite_index = Sprite32;
        else if (nome_planta == "repelecao")    sprite_index = Sprite50;
        else if (nome_planta == "duplervilha")  sprite_index = Sprite6_2;
		else if (nome_planta == "triplervilha")  sprite_index = Sprite113;
		else if (nome_planta == "espinhoguiado")  sprite_index = Sprite122;
        else if (nome_planta == "covaceps")  sprite_index = Sprite75;
        else if (nome_planta == "enroscacovas")  sprite_index = Sprite105;
        else if (nome_planta == "veudenoiva")  sprite_index = Sprite85;
        else if (nome_planta == "broto")  sprite_index = Sprite92;
        else if (nome_planta == "morcegarrador")  sprite_index = Sprite101;
        else if (nome_planta == "trepaervilha")  sprite_index = Sprite130;
    } else {
        sprite_index = -1;
    }
} else {
    sprite_index = -1;
}

if (sprite_index != -1) {
    draw_self();
    
    // DESENHO DO COOLDOWN (Sombra e Segundos)
    if (global.fase_iniciada && em_cooldown) {
        var porcentagem = tempo_cooldown_atual / tempo_cooldown_max;
        
        draw_set_color(c_black);
        draw_set_alpha(0.6 * porcentagem);
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        
        draw_set_alpha(1.0);
        draw_set_color(c_white);
        draw_set_font(fnt_menu);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        draw_text((bbox_left + bbox_right) / 2, (bbox_top + bbox_bottom) / 2, string_format(tempo_cooldown_atual, 1, 1) + "s");
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}