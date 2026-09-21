// Converte o type da barra (1, 2, 3...) para o índice da lista (0, 1, 2...)
var index = type - 1;

// Verifica se existe uma planta selecionada para esta posição
if (index < ds_list_size(global.plantas_escolhidas)) {
    var nome = ds_list_find_value(global.plantas_escolhidas, index);
    
    var obj_card = noone;
    var planta_obj_nome = "";

    // Mapeia o texto da lista para o card e o objeto real da planta
    if (nome == "disparervilha") { 
        obj_card = obj_card_disparervilha; 
        planta_obj_nome = "obj_disparervilha"; 
	}
    if (nome == "triplervilha") { 
        obj_card = obj_card_triplervilha; 
        planta_obj_nome = "obj_triplervilha";
    }
	   else if (nome == "espinhoguiado") { 
            obj_card = obj_card_espinhoguiado; 
            planta_obj_nome = "obj_espinhoguiado"; 
    }
    else if (nome == "girassol") { 
        obj_card = obj_card_girassol; 
        planta_obj_nome = "obj_girassol"; 
    }
    else if (nome == "noz") { 
        obj_card = obj_card_noz; 
        planta_obj_nome = "obj_noz_obstaculo"; 
    }
    else if (nome == "ervaespinho") { 
        obj_card = obj_card_ervaespinho; 
        planta_obj_nome = "obj_ervaespinho"; 
    }
    else if (nome == "batatamina") { 
        obj_card = obj_card_batatamina; 
        planta_obj_nome = "obj_batatamina"; 
    }
	    else if (nome == "enroscacovas") { 
        obj_card = obj_card_enroscacovas; 
        planta_obj_nome = "obj_enroscacovas"; 
    }
    else if (nome == "esparabalde") { 
        obj_card = obj_card_esparabalde; 
        planta_obj_nome = "obj_esparabalde"; 
    }
	    else if (nome == "trepaervilha") { 
        obj_card = obj_card_trepaervilha; 
        planta_obj_nome = "obj_trepaervilha"; 
    }
    else if (nome == "repelecao") { 
        obj_card = obj_card_repelecao; 
        planta_obj_nome = "obj_repepe_cao"; 
    }

    // Cria a instância do card exatamente sobre esta barra lateral
    if (obj_card != noone) {
        var card = instance_create_layer(x, y, layer, obj_card);
        card.type = type;
        card.depth = depth - 10; // Fica visível por cima da barra
        card.planta_associada = asset_get_index(planta_obj_nome); // Passa o objeto pronto
    }
}