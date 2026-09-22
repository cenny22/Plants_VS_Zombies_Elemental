event_inherited();
// ==========================================
// CONFIGURAÇÕES INICIAIS DA BATATA-MINA
// ==========================================

hp = 100
esta_carregada = false;

// Alarme 0: Espera os 5 segundos para armar a mina
alarm[0] = room_speed * 6; 

// Define a sprite inicial (ela enterrada)
sprite_index = spr_batatamina_n_pronta;