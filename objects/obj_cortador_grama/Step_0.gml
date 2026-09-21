if (ativado) {
    // Anda para a direita
    x += velocidade_cortador;
    
    // Se passar do limite da tela (ex: pixel 1050), ele se destrói
    if (x > 1500) {
        instance_destroy();
    }
}
var zumbi_colidido = instance_place(x, y, obj_zumbi_parent);

if (instance_exists(zumbi_colidido)) {
    // Corrigido para object_is_ancestor
    var eh_zumcare = (zumbi_colidido.object_index == obj_zumcare) || object_is_ancestor(zumbi_colidido.object_index, obj_zumcare);

    if (eh_zumcare) {
        if (variable_instance_exists(zumbi_colidido, "em_investida")) {
            zumbi_colidido.em_investida = false;
        }
        
        // Destrói o Zumcaré e NÃO ativa o cortador
        instance_destroy(zumbi_colidido);
    } else {
        // Ativa o cortador para os outros zumbis
        ativado = true;
    }
}