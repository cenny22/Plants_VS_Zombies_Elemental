#region ALARM 2

if (global.fase_iniciada)
{
    var tabela_zumbis = [];
    var quantidade = 0;

    if (fase_etapa == 1) 
    { 
        fase_etapa = 2; 
        tabela_zumbis = zumbi_inicial; 
        quantidade = array_length(zumbi_inicial); 
    }
    else if (fase_etapa == 3) 
    { 
        fase_etapa = 4; 
        tabela_zumbis = zumbis_horda2; 
        quantidade = qtd_horda2; 
    }
    else if (fase_etapa == 5) 
    { 
        fase_etapa = 6; 
        tabela_zumbis = zumbis_horda3; 
        quantidade = qtd_horda3; 
    }

    // SPAWN DOS ZUMBIS
    if (quantidade > 0)
    {
        zumbis_mortos_horda_inicio = global.zumbis_mortos;
        
        repeat (quantidade)
        {
            script_execute(scr_spawn_zumbi_tipo, tabela_zumbis);
        }

        // Ativa a mensagem na tela por 3 segundos (apenas a partir da Horda 1)
        if (fase_etapa > 2)
        {
            aviso_horda_timer = room_speed * 3;
        }
    }

    // Avança para o estado intermediário ou final
    if (fase_etapa == 2) fase_etapa = 3;
    else if (fase_etapa == 4) fase_etapa = 5;
    else if (fase_etapa == 6) { fase_etapa = 7; alarm[1] = -1; }
}

#endregion