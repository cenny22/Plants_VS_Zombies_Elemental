event_inherited();

// Procura por outro zumbi colidindo nesta posição
var zumbi_alvo = instance_place(x, y, obj_zumbi_parent);

if (instance_exists(zumbi_alvo)) {
    // Garante que não vai tentar transformar a si mesma nem outro já transformado
    if (zumbi_alvo.id != id && zumbi_alvo.object_index != obj_zumbi_sol) {
        // Guarda a posição e velocidade do zumbi atingido
        var pos_x = zumbi_alvo.x;
        var pos_y = zumbi_alvo.y;
        
        // Destrói o zumbi antigo
        instance_destroy(zumbi_alvo);
        
        // Cria o novo obj_zumbi_shooter no mesmo lugar
        instance_create_layer(pos_x, pos_y, "Instances", obj_zumbi_sol);
    }
}
// 1. SE ESTIVER PARALISADO
if (paralisado) {
    speed = 0;
    tempo_paralisado -= 1;
    
    if (tempo_paralisado <= 0) {
        paralisado = false;
        speed = vel;
    }
} 
// 2. SE NÃO ESTIVER PARALISADO (MOVIMENTO E ATAQUE)
else {
    // Limpa o alvo se for planta ignorada
    if (instance_exists(atacadoread)) {
        if (atacadoread.object_index == obj_ervaespinho || 
            atacadoread.object_index == obj_esparabalde || 
            atacadoread.object_index == obj_cova_sono) {
            
            atacadoread = noone; 
        }
    }

    // Ataca ou Anda
    if (instance_exists(atacadoread)) {
        speed = 0;
        danos_timer++;
        
        if (danos_timer >= room_speed) { 
            atacadoread.hp -= 100;
            danos_timer = 0;       
        }
    } else {
        speed = vel; // Define a velocidade de andar
        atacadoread = noone; 
    }
}

// 3. MORTE
if (hp <= 0) {
    if (!variable_global_exists("zumbis_mortos")) global.zumbis_mortos = 0;
    if (object_index != obj_zumbi_galinha) global.zumbis_mortos += 1;
    
    instance_destroy();
}
// Se não estiver em contato com o gás, restaura a velocidade normal
if (!place_meeting(x, y, obj_gas_enroscacovas)) {
    if (variable_instance_exists(id, "velocidade_base")) {
        velocidade = velocidade_base;
    }
}
if (!place_meeting(x, y, obj_gas_enroscacovas)) {
    if (variable_instance_exists(id, "vel_original")) {
        if (variable_instance_exists(id, "vel") && vel != 0) {
            vel = vel_original;
        }
        if (speed != 0) {
            speed = vel_original;
        }
    }
}