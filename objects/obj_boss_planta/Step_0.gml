// Mantém o Boss fixo na posição X definida no Room Editor
x = posicao_spawn_x;
hspd = 0;
speed = 0;
vel = 0;

if (!variable_global_exists("fase_iniciada")) global.fase_iniciada = true;
if (!variable_global_exists("zumbis_mortos")) global.zumbis_mortos = 0;

global.modo_esteira = true;

// Reagenda spawn de zumbis padrão se o alarme parar e o boss estiver vivo
if (alarm[1] == -1 && !derrotado) {
    alarm[1] = game_get_speed(gamespeed_fps) * 3;
}

// ==========================================================
// MECÂNICA 6: VITÓRIA / HP CHEGA A ZERO
// ==========================================================
if (hp <= 0 && !derrotado) {
    derrotado = true;
    
    // Cancela os alarmes de ação, spawn e limpeza
    alarm[0] = -1;
    alarm[1] = -1;
    alarm[2] = -1;
    
    // Desbloqueia o progresso global do Mundo Terra
    global.mundo_terra_desbloqueado = true;
    
    // Destrói TODOS os zumbis em campo (exceto o próprio boss)
    with (obj_zumbi_parent) {
        if (id != other.id) {
            instance_destroy();
        }
    }
    
    // Busca e instancia o objeto da chave no centro da sala
    var chave_ind = asset_get_index("obj_chave_terra");
    if (chave_ind != -1) {
        instance_create_layer(room_width / 2, room_height / 2, "Instances", chave_ind);
    } else if (object_exists(obj_chave_terra)) {
        instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_chave_terra);
    }
    
    // Destrói o boss
    instance_destroy();
}