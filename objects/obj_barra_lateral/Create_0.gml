#region
// ============================================================
// OBJ_BARRA_LATERAL — CREATE
// SISTEMA DE PEGAR PLANTA + COOLDOWN
// ============================================================


// ============================================================
// CONFIGURAÇÕES DA BARRA
// ============================================================

barra_x = 100;
barra_y = 100;

espacamento = 75;

escala_quadro_x = 1.12;
escala_quadro_y = 1.08;

escala_planta = 0.75;


// ============================================================
// PLANTA SELECIONADA
// ============================================================

planta_selecionada_local = "";

indice_selecionado = -1;


// ============================================================
// ARRAY DE COOLDOWNS
// ============================================================

cooldowns = [];


// ============================================================
// MÉTODO: GARANTIR COOLDOWNS
// ============================================================

garantir_cooldowns = function()
{
    if (!variable_global_exists("plantas_escolhidas"))
    {
        return;
    }

    if (!ds_exists(global.plantas_escolhidas, ds_type_list))
    {
        return;
    }

    var quantidade =
        ds_list_size(
            global.plantas_escolhidas
        );

    for (var i = 0; i < quantidade; i++)
    {
        if (array_length(cooldowns) <= i)
        {
            cooldowns[i] = 0;
        }
    }
};


// ============================================================
// MÉTODO: INICIAR COOLDOWN
// ============================================================

iniciar_cooldown = function(_indice, _tempo)
{
    if (_indice < 0)
    {
        return;
    }

    garantir_cooldowns();

    cooldowns[_indice] = _tempo;
};


// ============================================================
// MÉTODO: PEGAR PLANTA
// ============================================================

pegar_planta = function(_indice)
{
    if (!variable_global_exists("plantas_escolhidas"))
    {
        return;
    }

    if (!ds_exists(global.plantas_escolhidas, ds_type_list))
    {
        return;
    }

    if (_indice < 0)
    {
        return;
    }

    if (_indice >= ds_list_size(global.plantas_escolhidas))
    {
        return;
    }


    // ========================================================
    // GARANTE QUE O COOLDOWN EXISTE
    // ========================================================

    garantir_cooldowns();


    // ========================================================
    // VERIFICA COOLDOWN
    // ========================================================

    if (cooldowns[_indice] > 0)
    {
        return;
    }


    // ========================================================
    // PEGA O NOME DA PLANTA
    // ========================================================

    var nome =
        ds_list_find_value(
            global.plantas_escolhidas,
            _indice
        );


    // ========================================================
    // PEGA OS DADOS DO CATÁLOGO
    // ========================================================

    var dados =
        planta_obter(nome);


    if (is_undefined(dados))
    {
        return;
    }


    // ========================================================
    // VERIFICA SÓIS
    // ========================================================

    if (!variable_global_exists("sois"))
    {
        return;
    }

    if (global.sois < dados.custo)
    {
        return;
    }


    // ========================================================
    // SE CLICAR NOVAMENTE NA CARTA SELECIONADA,
    // CANCELA
    // ========================================================

    if (indice_selecionado == _indice)
    {
        cancelar_planta();
        return;
    }


    // ========================================================
    // SELECIONA A PLANTA
    // ========================================================

    planta_selecionada_local = nome;

    indice_selecionado = _indice;

    global.planta_selecionada =
        dados.objeto;

    global.barra_selecionada =
        _indice;
};


// ============================================================
// MÉTODO: CANCELAR PLANTA
// ============================================================

cancelar_planta = function()
{
    planta_selecionada_local = "";

    indice_selecionado = -1;

    global.planta_selecionada = noone;

    global.barra_selecionada = noone;
};


// ============================================================
// MÉTODO: VERIFICAR CLIQUE
// ============================================================

verificar_clique = function()
{
    var mouse_gui_x =
        device_mouse_x_to_gui(0);

    var mouse_gui_y =
        device_mouse_y_to_gui(0);


    if (variable_global_exists("fase_iniciada"))
    {
        if (!global.fase_iniciada)
        {
            return;
        }
    }


    if (!mouse_check_button_pressed(mb_left))
    {
        return;
    }


    if (!variable_global_exists("plantas_escolhidas"))
    {
        return;
    }

    if (!ds_exists(global.plantas_escolhidas, ds_type_list))
    {
        return;
    }


    var quadro_largura =
        sprite_get_width(spr_quadrado_plantas)
        * escala_quadro_x;

    var quadro_altura =
        sprite_get_height(spr_quadrado_plantas)
        * escala_quadro_y;


    var quantidade =
        ds_list_size(
            global.plantas_escolhidas
        );


    for (var i = 0; i < quantidade; i++)
    {
        var px = barra_x;

        var py =
            barra_y +
            (i * espacamento);


        var dentro =
            point_in_rectangle(
                mouse_gui_x,
                mouse_gui_y,

                px - quadro_largura / 2,
                py - quadro_altura / 2,

                px + quadro_largura / 2,
                py + quadro_altura / 2
            );


        if (dentro)
        {
            pegar_planta(i);

            return;
        }
    }
};


// ============================================================
// MÉTODO: ATUALIZAR COOLDOWNS
// ============================================================

atualizar_cooldowns = function()
{
    if (!variable_global_exists("plantas_escolhidas"))
    {
        return;
    }

    if (!ds_exists(global.plantas_escolhidas, ds_type_list))
    {
        return;
    }


    garantir_cooldowns();


    var quantidade =
        ds_list_size(
            global.plantas_escolhidas
        );


    for (var i = 0; i < quantidade; i++)
    {
        if (cooldowns[i] > 0)
        {
            cooldowns[i]--;

            if (cooldowns[i] < 0)
            {
                cooldowns[i] = 0;
            }
        }
    }
};


// ============================================================
// MÉTODO: ATUALIZAR
// ============================================================

atualizar = function()
{
    atualizar_cooldowns();

    verificar_clique();
};

#endregion