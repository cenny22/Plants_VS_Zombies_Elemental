// 1. Movimentação horizontal
x += velocidade_atual;

// 2. Lógica de invocar o Zumbinho ao chegar na metade da vida (1500 HP)
// Lógica de invocar o Zumbinho ao chegar na metade da vida (1500 HP)
if (hp <= 1500 && !zumbinho_criado) {
    zumbinho_criado = true;
    
    // Procura o quadrado do grid mais próximo da posição do Devorador
    var grid_proximo = instance_nearest(x, y, obj_quadrado_grid);
    
    if (grid_proximo != noone) {
        // Cria o Zumbinho na coordenada X e Y exata do quadrado encontrado
        instance_create_layer(grid_proximo.x, grid_proximo.y, "Instances", obj_zumbinho);
    } else {
        // Caso de segurança (se não houver grid na sala), cria na frente dele
        instance_create_layer(x - 32, y, "Instances", obj_zumbinho);
    }
}

// 3. Morte do Zumbi
if (hp <= 0) {
    // Se o seu jogo tem pontuação de zumbis mortos:
    if (variable_global_exists("zumbis_mortos")) {
        global.zumbis_mortos += 1;
    }
    instance_destroy();
}