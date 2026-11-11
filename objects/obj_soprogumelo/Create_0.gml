#region OBJ_SOPRINHO — CREATE

event_inherited(); // Puxa o Create do Parent
hp = 150;         
pode_atirar = true;

// ==========================================
// CONTROLE DE TEMPO DE VIDA (60 SEGUNDOS)
// ==========================================
tempo_vida_maximo = game_get_speed(gamespeed_fps) * 60; 
tempo_vida_atual = tempo_vida_maximo;
image_alpha = 1; // Garante que começa totalmente visível

// ==========================================
// CONTROLE DO ADUBO
// ==========================================
adubo_ativado = false;
ervilhas_rajada = 0; // Contador de projéteis restantes
tempo_entre_rajada = 3; // Intervalo em frames entre cada disparo (~0.05 segundos)

#endregion