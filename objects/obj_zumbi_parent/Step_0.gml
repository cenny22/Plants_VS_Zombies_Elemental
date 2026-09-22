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
        speed = vel + con; // Define a velocidade de andar
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

if (pisk > 0)
{
	image_alpha = 0.6
	pisk --
}
else
{
	image_alpha = 1
}
var azul_claro = make_color_rgb(135, 206, 250);

if(con > 0)
{
	image_blend = azul_claro
}
else
{
	image_blend = c_white
}