#region OBJ_DISPARERVILHA — CREATE

event_inherited(); // Puxa o Create do Parent
hp = 300;          // Vida específica da disparervilha
pode_atirar = true;

// ==========================================
// CONTROLE DO ADUBO
// ==========================================

adubo_ativado = false;
ervilhas_rajada = 0; // Contador de projéteis restantes
tempo_entre_rajada = 3; // Intervalo em frames entre cada ervilha (~0.05 segundos)

#endregion