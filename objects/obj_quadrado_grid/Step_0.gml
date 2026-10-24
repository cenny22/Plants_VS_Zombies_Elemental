// ============================================================
// OBJ_QUADRADO_GRID — STEP
// ============================================================

// Se a variável não existe neste quadrado, inicializa ela e sai do evento
if (!variable_instance_exists(self, "timer_cooldown_pendente")) 
{
    timer_cooldown_pendente = -1;
    planta_recente_id = noone;
    planta_recente_dados = undefined;
    planta_recente_barra = noone;
    exit; 
}

// Se o monitoramento de 0.2 segundos está ativo
if (timer_cooldown_pendente > 0) 
{
    // CHECAGEM DE SEGURANÇA: A planta morreu antes dos 0.2 segundos acabar?
    if (!instance_exists(planta_recente_id)) 
    {
        // REEMBOLSO: Devolve os sóis gastos para o jogador
        if (variable_global_exists("sois") && !is_undefined(planta_recente_dados))
        {
            global.sois += planta_recente_dados.custo;
        }
        
        // Cancela tudo para NÃO ativar o cooldown da carta
        timer_cooldown_pendente = -1;
        planta_recente_id = noone;
        planta_recente_dados = undefined;
        planta_recente_barra = noone;
        exit;
    }

    // Se a planta ainda está viva, continua contando o tempo
    timer_cooldown_pendente--;
    
    // O tempo acabou! A planta sobreviveu mais de 0.2 segundos (Cooldown definitivo)
    if (timer_cooldown_pendente == 0) 
    {
        if (room != Room_fase28_planta)
        {
            if (instance_exists(obj_barra_lateral))
            {
                with (obj_barra_lateral)
                {
                    iniciar_cooldown(
                        other.planta_recente_barra,
                        other.planta_recente_dados.recarga * room_speed
                    );
                }
            }
        }
        
        // Limpa o monitoramento já que a planta se consolidou viva
        timer_cooldown_pendente = -1;
        planta_recente_id = noone;
        planta_recente_dados = undefined;
        planta_recente_barra = noone;
    }
}
