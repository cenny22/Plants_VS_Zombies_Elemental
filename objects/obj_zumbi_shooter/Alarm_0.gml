// Verifica se há alguma planta na mesma linha reta à esquerda
var margem_altura = 16;
var tem_planta = collision_rectangle(0, y - margem_altura, x, y + margem_altura, obj_planta_parent, false, true);

// Se houver planta na linha, dispara a ervilha zumbi
if (tem_planta != noone) {
    instance_create_layer(x - 20, y, "Instances", obj_ervilha_zumbi);
}

// Reagenda o próximo tiro
alarm[0] = game_get_speed(gamespeed_fps) * cooldown_tiro;