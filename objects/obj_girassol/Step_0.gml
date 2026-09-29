#region OBJ_GIRASSOL — STEP



event_inherited();



// ============================================================

// EFEITO — PISCA EM AMARELO

// ============================================================



if (pisca_sol > 0)

{

    pisca_sol--;

}



// ============================================================

// CHECAGEM DO ADUBO

// ============================================================



if (adubo_ativado)

{

    adubo_ativado = false; // Reseta a flag para evitar looping

    sols_para_gerar = 5;   // Define a quantidade da rajada

    alarm[1] = 1;          // Ativa o alarm da rajada no próximo frame

}



if (tempo_sprite_adubo > 0)

{

    tempo_sprite_adubo--;

    sprite_index = spr_girassol_ADUBO;

}

else

{

    sprite_index = spr_girassol;

}



#endregion