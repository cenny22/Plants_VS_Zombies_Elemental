if (parado) {
    var total_plantas = instance_number(obj_planta_parent);

    if (total_plantas > 0) {
        var indice = irandom(total_plantas - 1);
        var planta_alvo = instance_find(obj_planta_parent, indice);

        if (instance_exists(planta_alvo)) {
            var mira = instance_create_layer(planta_alvo.x, planta_alvo.y, "Instances", obj_mira_girafa);
            mira.planta_alvo = planta_alvo;
        }
    }

    // Reagenda o ataque para daqui a 20s
    alarm[0] = game_get_speed(gamespeed_fps) * cooldown_ataque;
}