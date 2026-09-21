// Se o HP zerar e ele ainda não estiver investindo, ativa a mecânica em vez de morrer
if (hp <= 0 && !em_investida) {
    em_investida = true;
    parado = false;
    hp = 99999; // Evita que morra repetidamente no mesmo frame
}

// LÓGICA DE INVESTIDA (Morte Especial)
if (em_investida) {
    // Força velocidade rápida para a esquerda
    speed = vel_investida;
    vel = vel_investida;
    
    // Mata qualquer planta que tocar
    var planta = instance_place(x, y, obj_planta_parent);
    if (instance_exists(planta)) {
        instance_destroy(planta);
    }
    
    // Mata qualquer outro zumbi que tocar (exceto ele mesmo)
    var zumbi = instance_place(x, y, obj_zumbi_parent);
    if (instance_exists(zumbi) && zumbi != id) {
        instance_destroy(zumbi);
    }
    
    // Quando sair totalmente da tela pela esquerda, é finalmente removido
    if (x < -100) {
        instance_destroy();
    }
} 
// LÓGICA DE MOVIMENTO PADRÃO (Enquanto vivo)
else {
    event_inherited(); // Mantém lógica do pai

    if (parado) {
        speed = 0;
        vel = 0;
    }
}
