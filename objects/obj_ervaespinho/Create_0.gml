#region OBJ_ERVA_ESPINHO — CREATE

event_inherited();
hp = 1000000000000000; // Vida alta para segurança
custo = 100;

// Ativa o alarme de dano continuo
alarm[0] = game_get_speed(gamespeed_fps);

// ==========================================
// CONTROLE DO ADUBO
// ==========================================

adubo_ativado = false;
duracao_adubo = 0; // Tempo restante da paralisia coletiva

#endregion