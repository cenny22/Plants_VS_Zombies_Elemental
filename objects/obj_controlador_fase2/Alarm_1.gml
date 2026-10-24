#region ALARM 1

if (global.fase_iniciada && fase_etapa < 7) 
{
    // Gera apenas zumbis intermediários individuais entre as hordas
    if (fase_etapa == 1 || fase_etapa == 3 || fase_etapa == 5)
    {
        script_execute(scr_spawn_zumbi_tipo, zumbis_intermediarios);
    }
    
    alarm[1] = room_speed * irandom_range(13, 14);
}

#endregion