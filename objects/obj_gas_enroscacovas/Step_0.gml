var lista_zumbis = ds_list_create();
var qtd = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_zumbi_parent, false, true, lista_zumbis, false);

for (var i = 0; i < qtd; i++) {
    var z = lista_zumbis[| i];
    if (instance_exists(z)) {
        
        // Salva a velocidade base original na primeira vez que toca no gás
        if (!variable_instance_exists(z, "vel_original")) {
            if (variable_instance_exists(z, "vel")) {
                z.vel_original = z.vel;
            } else if (variable_instance_exists(z, "velocidade")) {
                z.vel_original = z.velocidade;
            } else {
                z.vel_original = z.speed;
            }
        }
        
        // Aplica os 70% de lentidão (mantém apenas 30% da velocidade original)
        if (variable_instance_exists(z, "vel")) {
            z.vel = z.vel_original * 0.3;
        }
        if (variable_instance_exists(z, "velocidade")) {
            z.velocidade = z.vel_original * 0.3;
        }
        if (z.speed != 0) {
            z.speed = z.vel_original * 0.3;
        }
        
        // Sinaliza que o zumbi está tocando o gás nesta etapa
        z.no_gas = true;
    }
}

ds_list_destroy(lista_zumbis);