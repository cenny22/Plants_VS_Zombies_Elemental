var zumbi_comum = instance_nearest(x, y, obj_zumbi_parent);
var zumbi_arbusto = instance_nearest(x, y, obj_zumbi_arbusto);

alvo = noone;

// Caso 1: Existem ambos no mapa -> escolhe o mais próximo
if (instance_exists(zumbi_comum) && instance_exists(zumbi_arbusto)) {
    var dist_comum = distance_to_object(zumbi_comum);
    var dist_arbusto = distance_to_object(zumbi_arbusto);
    
    // Só considera o arbusto se ele estiver no estado "comendo"
    var arbusto_valido = (variable_instance_exists(zumbi_arbusto, "estado") && zumbi_arbusto.estado == "comendo");

    if (arbusto_valido && dist_arbusto < dist_comum) {
        alvo = zumbi_arbusto;
    } else {
        alvo = zumbi_comum;
    }
} 
// Caso 2: Só existe zumbi comum
else if (instance_exists(zumbi_comum)) {
    alvo = zumbi_comum;
} 
// Caso 3: Só existe zumbi arbusto
else if (instance_exists(zumbi_arbusto)) {
    if (variable_instance_exists(zumbi_arbusto, "estado") && zumbi_arbusto.estado == "comendo") {
        alvo = zumbi_arbusto;
    }
}

// Movimentação em direção ao alvo definido
if (instance_exists(alvo)) {
    var dir = point_direction(x, y, alvo.x, alvo.y);
    direction = dir;
    image_angle = dir;
    speed = vel;
} else {
    // Se o alvo morrer no caminho, continua na última direção mantendo o ângulo
    speed = vel;
}

// Destrói o projétil se sair dos limites da sala
if (x < -50 || x > room_width + 50 || y < -50 || y > room_height + 50) {
    instance_destroy();
}