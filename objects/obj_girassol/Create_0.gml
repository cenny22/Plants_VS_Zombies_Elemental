#region OBJ_GIRASSOL — CREATE



event_inherited(); // Puxa a vida padrão do Pai

hp = 300;          // Girassol tem um pouco menos de vida que a disparervilha

alarm[0] = room_speed * 5; // Ativa o primeiro sol em 5 segundos



// ============================================================

// EFEITO — GIRASSOL CRIANDO SOL

// ============================================================



pisca_sol = 0;



// ============================================================

// CONTROLE DO ADUBO

// ============================================================



adubo_ativado = false;

sols_para_gerar = 0;

tempo_entre_sols = 10; // Intervalo de 10 frames entre cada sol da rajada



#endregion



tempo_sprite_adubo = 0;