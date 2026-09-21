show_debug_message("=== GAS ENROSCACOVAS: Verificando alvos ===");

var lista_zumbis = ds_list_create();
var qtd = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_zumbi_parent, false, true, lista_zumbis, false);

if (qtd > 0) {
    var sorteio = irandom_range(1, 100);
    show_debug_message("Zumbis encontrados (" + string(qtd) + ")! Sorteio de dano (precisa ser <= 25): " + string(sorteio));

    if (sorteio <= 25) {
        show_debug_message("SUCESSO! Causando 400 de dano em TODOS os zumbis no gás.");
        
        // Muta o sprite da planta para a animação de ataque
        if (variable_instance_exists(id, "dono") && instance_exists(dono)) {
            dono.sprite_index = Sprite105_1;
            dono.image_index = 0;
        }
        
        // Aplica dano em cada zumbi capturado na lista
        for (var i = 0; i < qtd; i++) {
            var z = lista_zumbis[| i];
            
            if (instance_exists(z) && variable_instance_exists(z, "hp")) {
                z.hp -= 400;
                show_debug_message("Dano aplicado em " + object_get_name(z.object_index) + " | HP restante: " + string(z.hp));
                
                if (z.hp <= 0) {
                    show_debug_message("Zumbi ELIMINADO pelo gás!");
                    instance_destroy(z);
                }
            }
        }
    } else {
        show_debug_message("FALHA no sorteio dos 25% nesta rodada.");
    }
} else {
    show_debug_message("Nenhum zumbi dentro da área do gás.");
}

ds_list_destroy(lista_zumbis);

alarm[1] = game_get_speed(gamespeed_fps) * 5.0;