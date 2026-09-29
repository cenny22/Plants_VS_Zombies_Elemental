#region OBJ_BATATA_MINA — CREATE

event_inherited();

// ==========================================
// CONFIGURAÇÕES INICIAIS DA BATATA-MINA
// ==========================================

hp = 100;
esta_carregada = false;

// Alarme 0: Espera para armar a mina
alarm[0] = game_get_speed(gamespeed_fps) * 6; 

// Define a sprite inicial (ela enterrada)
sprite_index = spr_batatamina_n_pronta;

// ==========================================
// CONTROLE DO ADUBO
// ==========================================

adubo_ativado = false;

#endregion