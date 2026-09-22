// 1. Checa se a própria planta morreu
if (vida <= 0) {
    instance_destroy();
}

// 2. Destrói QUALQUER animal na tela no exato frame
with (all) {
    // Checa se tem a flag de animal OU se é explicitamente o objeto da onça
    if ((variable_instance_exists(id, "eh_animal") && eh_animal == true) || object_index == obj_onca_zumbi) {
        
        // Contabiliza a morte no jogo
        if (!variable_global_exists("zumbis_mortos")) global.zumbis_mortos = 0;
        global.zumbis_mortos += 1;
        
        // DESTRÓI DIRETO (sem passar por hp ou vida)
        instance_destroy();
    }
}