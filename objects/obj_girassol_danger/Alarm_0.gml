// Só gera sol se a fase já tiver começado
if (global.fase_iniciada) {
    // Cria o sol um pouco para o lado do girassol para não nascer exatamente em cima
    instance_create_layer(x + 15, y, "Instances", obj_sol);
}

// Próximo sol em 5 segundos fixos
alarm[0] = room_speed * 22;