// Procura por qualquer zumbi encostando nela
var zumbi_na_armadilha = instance_place(x, y, obj_zumbi_parent);

// Se tiver um zumbi pisando nela, causa 20 de dano
if (zumbi_na_armadilha != noone) {
    if (variable_instance_exists(zumbi_na_armadilha, "hp")) {
        zumbi_na_armadilha.hp -= 20;
    }
}

// Reseta o alarme para continuar dando dano a cada segundo
alarm[0] = room_speed;