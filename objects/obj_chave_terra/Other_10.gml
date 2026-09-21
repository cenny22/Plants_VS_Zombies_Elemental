// O valor de 'dano_recebido_temp' deve ser definido antes de chamar este evento
hp -= dano_recebido_temp;
dano_recebido_acumulado += dano_recebido_temp;

if (dano_recebido_acumulado >= 6000) {
    dano_recebido_acumulado -= 6000;
    
    if (object_exists(obj_devorador)) {
        instance_create_layer(x - 64, y, "Instances", obj_devorador);
    }
}