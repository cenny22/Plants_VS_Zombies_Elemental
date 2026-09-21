event_inherited(); // Mantém a verificação de morte se HP <= 0

if (pode_atirar) {
    var alvo_valido = false;

    // 1. Checa se existe qualquer zumbi comum no mapa
    if (instance_exists(obj_zumbi_parent)) {
        alvo_valido = true;
    } 
    // 2. Se não achou zumbi comum, checa se existe o zumbi arbusto no estado "comendo"
    else if (instance_exists(obj_zumbi_arbusto)) {
        var arbusto = instance_find(obj_zumbi_arbusto, 0);
        if (instance_exists(arbusto) && variable_instance_exists(arbusto, "estado") && arbusto.estado == "comendo") {
            alvo_valido = true;
        }
    }

    // Se encontrou qualquer um dos dois alvos válidos, dispara
    if (alvo_valido) {
        instance_create_layer(x + 10, y - 10, "Instances", obj_guia);
        
        pode_atirar = false;
        alarm[0] = game_get_speed(gamespeed_fps) * 2.5;
    }
}