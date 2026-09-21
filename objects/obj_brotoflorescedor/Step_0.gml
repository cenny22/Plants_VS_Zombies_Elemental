event_inherited(); 

// ====================================================================
// 1. CONTAGEM DE PLANTAS AO REDOR (3x3 do Grid)
// ====================================================================
var margem = tamanho_bloco * 1.5;
var plantas_vizinhas = 0;

with (obj_planta_parent) {
    if (id != other.id) {
        if (point_in_rectangle(x, y, other.x - margem, other.y - margem, other.x + margem, other.y + margem)) {
            plantas_vizinhas++;
        }
    }
}

// ====================================================================
// 2. MUDANÇA DE SPRITE E TIPO DE PROJÉTIL
// ====================================================================
if (plantas_vizinhas >= 8) {
    projetil_atual = obj_forte;
    sprite_index = Sprite92;
} else if (plantas_vizinhas >= 4) {
    projetil_atual = obj_medio;
    sprite_index = Sprite90_1;
} else {
    projetil_atual = obj_fraco;
    sprite_index = Sprite90;
}

// ====================================================================
// 3. BUSCA DE ALVOS
// ====================================================================
var margem_altura = 16; 

var zumbi_normal = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_parent, false, true);
var zumbi_arbusto = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_arbusto, false, true);

zumbi_na_linha = false;

if (zumbi_normal != noone) {
    zumbi_na_linha = true;
}

if (zumbi_arbusto != noone && zumbi_arbusto.estado == "comendo") {
    zumbi_na_linha = true;
}

// ====================================================================
// 4. EXECUÇÃO DO TIRO
// ====================================================================
if (zumbi_na_linha && pode_atirar) {
    instance_create_layer(x + 20, y, "Instances", projetil_atual);
    pode_atirar = false;
    alarm[0] = game_get_speed(gamespeed_fps) * 1.5; 
}