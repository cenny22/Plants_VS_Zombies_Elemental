event_inherited(); 

// ====================================================================
// 1. CHECA SE UM ZUMBI ENCOSTOU (MUDANÇA DE ESTADO)
// ====================================================================
if (place_meeting(x, y, obj_zumbi_parent) || place_meeting(x, y, obj_zumbi_arbusto)) {
    estado = "defesa";
} else {
    estado = "ataque";
}

// ====================================================================
// 2. COMPORTAMENTO DOS ESTADOS
// ====================================================================
if (estado == "defesa") {
    
    // Mudar para sprite de defesa e trava tudo (só serve de tanque de vida)
    sprite_index = Sprite85_1;

} 
else if (estado == "ataque") {
    
    // Sprite normal de ataque
    sprite_index = Sprite85;
    
    var margem_altura = 16;
    var limite_x = x + alcance_visao;
    
    // Procura por zumbis na linha
    var zumbi_normal = collision_rectangle(x, y - margem_altura, limite_x, y + margem_altura, obj_zumbi_parent, false, true);
    var zumbi_arbusto = collision_rectangle(x, y - margem_altura, limite_x, y + margem_altura, obj_zumbi_arbusto, false, true);

    var zumbi_na_linha = false;

    if (zumbi_normal != noone) {
        zumbi_na_linha = true;
    }

    if (zumbi_arbusto != noone && zumbi_arbusto.estado == "comendo") {
        zumbi_na_linha = true;
    }

    // Atira se houver alvo na linha e o alarme permitir
    if (zumbi_na_linha && pode_atirar) {
        instance_create_layer(x + 20, y, "Instances", obj_corte);
        pode_atirar = false;
        alarm[0] = game_get_speed(gamespeed_fps) * 2.5;
    }
}