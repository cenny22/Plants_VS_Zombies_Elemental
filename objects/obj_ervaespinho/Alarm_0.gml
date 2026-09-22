// Procura por qualquer zumbi encostando nela
var zumbi_na_armadilha = instance_place(x, y, obj_zumbi_parent);

// Se tiver um zumbi pisando nela, reduz a vida diretamente
if (zumbi_na_armadilha != noone) {
    if (variable_instance_exists(zumbi_na_armadilha, "hp")) {
        // Reduz a vida do zumbi
        zumbi_na_armadilha.hp -= 20;
        
        // Se a vida zerar ou ficar negativa, destrói o zumbi
        if (zumbi_na_armadilha.hp <= 0) {
            with (zumbi_na_armadilha) {
                instance_destroy();
            }
        }
    }
}

// Reseta o alarme para continuar dando dano a cada segundo
alarm[0] = game_get_speed(gamespeed_fps);