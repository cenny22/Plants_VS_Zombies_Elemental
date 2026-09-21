// 1. Caso especial: Plantas rasteiras/instantâneas que o Devorador esmaga sem parar
if (other.object_index == obj_ervaespinho || other.object_index == obj_esparabalde) {
    with (other) {
        instance_destroy(); // Destrói a ervaespinho / esparabalde instantaneamente
    }
    // Não alteramos a velocidade_atual, então ele continua andando normal
}
// 2. Para qualquer outra planta comum (que bloqueia o caminho)
else {
    if (!atacando) {
        atacando = true;
        velocidade_atual = 0; // Para de andar para esmagar
        
        planta_alvo = other; 
        
        // Mantém o alarm[0] para a animação/tempo de ataque
        alarm[0] = game_get_speed(gamespeed_fps) * 1; 
    }
}