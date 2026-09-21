// Garantia de segurança: se o boss for destruído sem passar pelo Step
if (hp <= 0) {
    global.mundo_terra_desbloqueado = true;
    
    // 1. Instancia a chave no centro da sala
    var chave_ind = asset_get_index("obj_chave_terra");
    if (chave_ind != -1) {
        instance_create_layer(room_width / 2, room_height / 2, "Instances", chave_ind);
    }
    
    // 2. Destrói TODOS os zumbis em campo através do objeto pai
    with (obj_zumbi_parent) {
        instance_destroy();
    }
}