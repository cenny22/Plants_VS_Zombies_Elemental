// 1. Garante que a variável type existe (slots de 1 a 7)
if (!variable_instance_exists(id, "type")) {
    type = 1; 
}

// VARIÁVEIS DE COOLDOWN DA BARRA (Iniciadas sem valor padrão fixo)
tempo_cooldown_max = 7.5; 
tempo_cooldown_atual = 0;
em_cooldown = false;

var index = type - 1;

// 2. Checagem segura da lista
if (variable_global_exists("plantas_escolhidas") && ds_exists(global.plantas_escolhidas, ds_type_list)) {
    if (index < ds_list_size(global.plantas_escolhidas)) {
        var nome = ds_list_find_value(global.plantas_escolhidas, index);
        
        var planta = planta_obter(nome);

        if (!is_undefined(planta)) {
            tempo_cooldown_max = planta.recarga;
            var centro_x = x + (sprite_width / 2);
            var centro_y = y + (sprite_height / 2);

            var card_existente = instance_position(centro_x, centro_y, all);
            if (card_existente != noone && card_existente != id) {
                instance_destroy(card_existente);
            }

            var card = instance_create_layer(centro_x, centro_y, layer, planta.card);
            card.type = type;
            card.depth = depth - 10;
            card.planta_associada = planta.objeto;
        }
    }
}
