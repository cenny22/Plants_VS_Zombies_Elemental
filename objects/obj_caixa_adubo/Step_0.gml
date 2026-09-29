#region OBJ_ADUBO — STEP

// ============================================================
// ATUALIZAÇÃO DO SPRITE DA CAIXA DE ADUBO
// ============================================================

if (!global.adubo_selecionado)
{
    // Quando NÃO está selecionado
    switch (global.adubos)
    {
        case 1:  sprite_index = Spr_Adubo1; break;
        case 2:  sprite_index = Spr_Adubo2; break;
        case 3:  sprite_index = Spr_Adubo3; break;
        default: sprite_index = Spr_Adubo0; break; // Sprite padrão (0 adubos)
    }
}
else
{
    // Quando ESTÁ selecionado
    switch (global.adubos)
    {
        case 1:  sprite_index = Spr_Adubo0; break;
        case 2:  sprite_index = Spr_Adubo1; break;
        case 3:  sprite_index = Spr_Adubo2; break; // Para 3 selecionado, usa a de 2 adubos
        default: sprite_index = Spr_Adubo0; break;
    }
}

#endregion

// Medida de limite de adubos
if (global.adubos >=4)
{
	global.adubos = 3
}