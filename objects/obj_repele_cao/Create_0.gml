// 1. Define a vida da planta
vida = 100;

// 2. Aplica o dano massivo em todos os animais
with (all) {
    if (variable_instance_exists(id, "eh_animal") && eh_animal == true) {
        
        // Reduz o HP/Vida da instância independente de qual variável ela use
        if (variable_instance_exists(id, "hp")) hp -= 100000;
        if (variable_instance_exists(id, "vida")) vida -= 100000;

        // Se o objeto não tiver sistema de vida programado, destrói diretamente
        if (!variable_instance_exists(id, "hp") && !variable_instance_exists(id, "vida")) {
            if (!variable_global_exists("zumbis_mortos")) global.zumbis_mortos = 0;
            global.zumbis_mortos += 1;
            instance_destroy();
        }
    }
}

// 3. Programa a destruição da planta em 3 segundos
alarm[0] = room_speed * 3;