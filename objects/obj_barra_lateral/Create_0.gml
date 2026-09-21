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
        
        var obj_card = noone;
        var planta_obj_nome = "";

        // DEFINIÇÃO DO COOLDOWN INDIVIDUAL E DOS CARDS DE CADA PLANTA
        if (nome == "disparervilha" || nome == "disparaervilha") { 
            obj_card = obj_card_disparervilha; 
            planta_obj_nome = "obj_disparervilha";
            tempo_cooldown_max = 7.5;
        }
        else if (nome == "girassol") { 
            obj_card = obj_card_girassol; 
            planta_obj_nome = "obj_girassol"; 
            tempo_cooldown_max = 7.5;
        }
        else if (nome == "noz") { 
            obj_card = obj_card_noz; 
            planta_obj_nome = "obj_noz_obstaculo"; 
            tempo_cooldown_max = 15.0; // TEMPO DA NOZ
        }
        else if (nome == "ervaespinho") { 
            obj_card = obj_card_ervaespinho; 
            planta_obj_nome = "obj_ervaespinho"; 
            tempo_cooldown_max = 7.5;
        }
        else if (nome == "batatamina") { 
            obj_card = obj_card_batatamina; 
            planta_obj_nome = "obj_batatamina"; 
            tempo_cooldown_max = 20.0; // TEMPO DA BATATA MINA
        }
		else if (nome == "enroscacovas") { 
            obj_card = obj_card_enroscacovas; 
            planta_obj_nome = "obj_enroscacovas"; 
            tempo_cooldown_max = 20.0; // TEMPO DA BATATA MINA
        }
        else if (nome == "esparabalde") { 
            obj_card = obj_card_esparabalde; 
            planta_obj_nome = "obj_esparabalde"; 
            tempo_cooldown_max = 15.0;
        }
        else if (nome == "repelecao") { 
            obj_card = obj_card_repelecao; 
            planta_obj_nome = "obj_repepe_cao"; 
            tempo_cooldown_max = 15.0;
        }
        else if (nome == "duplervilha") { 
            obj_card = obj_card_duplervilha; 
            planta_obj_nome = "obj_duplervilha"; 
            tempo_cooldown_max = 10;
	    }
        else if (nome == "triplervilha") { 
            obj_card = obj_card_triplervilha; 
            planta_obj_nome = "obj_triplervilha"; 
            tempo_cooldown_max = 15.0;
        }
       else if (nome == "covaceps") { 
            obj_card = obj_card_covaceps; 
            planta_obj_nome = "obj_covaceps"; 
            tempo_cooldown_max = 90;
        }
       else if (nome == "trepaervilha") { 
            obj_card = obj_card_trepaervilha; 
            planta_obj_nome = "obj_trepaervilha"; 
            tempo_cooldown_max = 15;
        }
       else if (nome == "veudenoiva") { 
            obj_card = obj_card_veudenoiva; 
            planta_obj_nome = "obj_veudenoiva"; 
            tempo_cooldown_max = 7.5;
        }
	   else if (nome == "broto") { 
            obj_card = obj_card_brotoflorescedor; 
            planta_obj_nome = "obj_brotoflorescedor"; 
            tempo_cooldown_max = 5;
        }
	   else if (nome == "morcegarrador") { 
            obj_card = obj_card_morcegarrador; 
            planta_obj_nome = "obj_morcegarrador"; 
            tempo_cooldown_max = 40;
        }
	   else if (nome == "espinhoguiado") { 
            obj_card = obj_card_espinhoguiado; 
            planta_obj_nome = "obj_espinhoguiado"; 
            tempo_cooldown_max = 15;
        }
        else {
            tempo_cooldown_max = 7.5; // Cooldown reserva apenas se for um nome desconhecido
        }

        if (obj_card != noone) {
            var centro_x = x + (sprite_width / 2);
            var centro_y = y + (sprite_height / 2);

            var card_existente = instance_position(centro_x, centro_y, all);
            if (card_existente != noone && card_existente != id) {
                instance_destroy(card_existente);
            }

            var card = instance_create_layer(centro_x, centro_y, layer, obj_card);
            card.type = type;
            card.depth = depth - 10;
            card.planta_associada = asset_get_index(planta_obj_nome);
        }
    }
}
