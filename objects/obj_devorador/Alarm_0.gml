// Verifica se a planta alvo ainda existe
if (variable_instance_exists(id, "planta_alvo") && instance_exists(planta_alvo)) {
    
    // Se a planta tem HP, aplica o dano massivo ou destrói direto
    if (variable_instance_exists(planta_alvo, "hp")) {
        planta_alvo.hp -= dano_ataque;
    } else {
        with (planta_alvo) {
            instance_destroy();
        }
    }
}

// Reseta para voltar a andar
atacando = false;
velocidade_atual = velocidade_base;