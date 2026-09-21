// ============================================================
// VERIFICA SE PELO MENOS UMA PLANTA FOI ESCOLHIDA
// ============================================================

if (ds_list_size(global.plantas_escolhidas) > 0)
{
    // Inicia a fase
    global.fase_iniciada = true;

    // ========================================================
    // DESTRÓI TODOS OS CARDS DE SELEÇÃO
    // ========================================================

    if (instance_exists(obj_card_disparervilha))
    {
        with (obj_card_disparervilha)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_girassol))
    {
        with (obj_card_girassol)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_triplervilha))
    {
        with (obj_card_triplervilha)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_espinhoguiado))
    {
        with (obj_card_espinhoguiado)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_enroscacovas))
    {
        with (obj_card_enroscacovas)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_veudenoiva))
    {
        with (obj_card_veudenoiva)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_covaceps))
    {
        with (obj_card_covaceps)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_noz))
    {
        with (obj_card_noz)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_duplervilha))
    {
        with (obj_card_duplervilha)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_ervaespinho))
    {
        with (obj_card_ervaespinho)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_batatamina))
    {
        with (obj_card_batatamina)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_esparabalde))
    {
        with (obj_card_esparabalde)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_morcegarrador))
    {
        with (obj_card_morcegarrador)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_brotoflorescedor))
    {
        with (obj_card_brotoflorescedor)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_trepaervilha))
    {
        with (obj_card_trepaervilha)
        {
            instance_destroy();
        }
    }

    if (instance_exists(obj_card_repelecao))
    {
        with (obj_card_repelecao)
        {
            instance_destroy();
        }
    }

    // ========================================================
    // DESTRÓI O PRÓPRIO BOTÃO "JÁ"
    // ========================================================

    instance_destroy();
}
else
{
    // ========================================================
    // NENHUMA PLANTA ESCOLHIDA
    // NÃO DESTRÓI NADA
    // ========================================================

    image_alpha = 1;

    global.fase_iniciada = false;

    show_debug_message("Selecione pelo menos uma planta!");
} 