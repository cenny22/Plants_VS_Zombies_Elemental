#region STEP

if (global.aviso_sois_timer > 0)
{
    global.aviso_sois_timer--;
}

if (aviso_horda_timer > 0)
{
    aviso_horda_timer--;
}

// ============================================================
// 1. INÍCIO DA FASE (Aguardando tempo_fase para o Zumbi Inicial)
// ============================================================
if (global.fase_iniciada == true && fase_etapa == 0) 
{
    fase_etapa = 1; 
    alarm[0] = room_speed * 3; // Primeiro sol
    
    // Aguarda o tempo_fase para gerar o zumbi inicial via ALARM 2
    alarm[2] = tempo_fase;
    
    // Inicia gerador de zumbis intermediários
    alarm[1] = room_speed * 10;
}

// ============================================================
// EVENTO ESPECIAL: 2 GALINHEIROS AOS 23 SEGUNDOS (2ª e 4ª fileiras)
// ============================================================
if (global.fase_iniciada && !galinheiros_23s_spawnados)
{
    if (alarm[3] <= 0) {
        alarm[3] = room_speed * 50
        galinheiros_23s_spawnados = true; // Garante que roda apenas uma vez
    }
}

// ============================================================
// 2. GATILHO DAS HORDAS 2 E 3 (Quando 50% dos mortos forem atingidos)
// ============================================================

// Gatilho Horda 2
if (fase_etapa == 3)
{
    var mortos_na_horda1 = global.zumbis_mortos - zumbis_mortos_horda_inicio;
    if (mortos_na_horda1 >= floor(qtd_horda1 * 0.5) && alarm[2] <= 0)
    {
        alarm[2] = tempo_fase;
    }
}

// Gatilho Horda 3
if (fase_etapa == 5)
{
    var mortos_na_horda2 = global.zumbis_mortos - zumbis_mortos_horda_inicio;
    if (mortos_na_horda2 >= floor(qtd_horda2 * 0.5) && alarm[2] <= 0)
    {
        alarm[2] = tempo_fase;
    }
}

// ============================================================
// 3. ANIMAÇÃO SUAVE DA BARRA DE PROGRESSO
// ============================================================
if (global.fase_iniciada)
{
    var alvo_progresso = 0;
    
    if (fase_etapa == 1) alvo_progresso = 0.1;
    else if (fase_etapa == 2 || fase_etapa == 3) alvo_progresso = 0.35; 
    else if (fase_etapa == 4 || fase_etapa == 5) alvo_progresso = 0.70; 
    else if (fase_etapa >= 6) alvo_progresso = 1.00;                     

    progresso_barra = lerp(progresso_barra, alvo_progresso, 0.02);
}

// ============================================================
// 4. CONDIÇÃO DE VITÓRIA
// ============================================================
if (fase_etapa == 7 && !fase_vencida)
{
    if (!instance_exists(obj_zumbi_parent))
    {
        fase_vencida = true;
        if (!variable_global_exists("vitorias")) global.vitorias = 0;
        
        global.vitorias += 1;
        
        alarm[0] = -1;
        alarm[1] = -1;
        alarm[2] = -1;
        alarm[3] = -1;
        global.fase_iniciada = false;
		
		if (variable_global_exists("plantas_liberadas"))
        {
            ds_map_replace(global.plantas_liberadas, "esparabalde", true);
        }
        
        // Se houver recompensa para essa fase, ajuste aqui com comentário correto
        room_goto(Room_fases_planta);
    }
}

#endregion