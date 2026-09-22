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

if (pisk > 0)
{
	image_alpha = 0.6
	pisk --
}
else
{
	image_alpha = 1
}

// ============================================================
// FOGO — MOVIMENTO DAS PARTICULAS
// ============================================================

if (fogo == true)
{
    for (var i = 0; i < array_length(fogo_particulas); i++)
    {
        fogo_particulas[i].y -= fogo_particulas[i].velocidade;
        fogo_particulas[i].vida--;

        // Quando a partícula termina, nasce novamente no topo
        if (fogo_particulas[i].vida <= 0)
        {
            fogo_particulas[i].x = random_range(-sprite_width * 0.35, sprite_width * 0.35);
            fogo_particulas[i].y = random_range(-sprite_height * 0.5, -sprite_height * 0.35);
            fogo_particulas[i].velocidade = random_range(0.3, 0.7);
            fogo_particulas[i].tamanho = random_range(3, 6);
            fogo_particulas[i].vida = random_range(20, 45);
        }
    }
}