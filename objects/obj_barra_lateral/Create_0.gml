#region
// ============================================================
// OBJ_BARRA_LATERAL — CREATE
// SISTEMA DE PEGAR PLANTA
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


// ============================================================
// ÍNDICE DA PLANTA SELECIONADA
// ============================================================

indice_selecionado = -1;


// ============================================================
// MÉTODO: PEGAR PLANTA
// ============================================================

pegar_planta = function(_indice)
{
    // --------------------------------------------------------
    // Verifica a lista
    // --------------------------------------------------------

    if (!variable_global_exists("plantas_escolhidas"))
    {
        return;
    }

    if (!ds_exists(global.plantas_escolhidas, ds_type_list))
    {
        return;
    }


    // --------------------------------------------------------
    // Verifica índice
    // --------------------------------------------------------

    if (_indice < 0)
    {
        return;
    }

    if (_indice >= ds_list_size(global.plantas_escolhidas))
    {
        return;
    }


    // --------------------------------------------------------
    // Pega o nome da planta
    // --------------------------------------------------------

    var nome =
        ds_list_find_value(
            global.plantas_escolhidas,
            _indice
        );


    // --------------------------------------------------------
    // Pega os dados do catálogo
    // --------------------------------------------------------

    var dados =
        planta_obter(nome);


    if (is_undefined(dados))
    {
        return;
    }


    // ========================================================
    // VERIFICA SE O JOGADOR TEM SÓIS SUFICIENTES
    // ========================================================

    if (variable_global_exists("sois"))
    {
        if (global.sois < dados.custo)
        {
            // Não pega a planta.
            return;
        }
    }
    else
    {
        // Se o sistema de Sóis ainda não existir,
        // não permite selecionar a planta.
        return;
    }


    // ========================================================
    // SE CLICOU NA MESMA PLANTA, CANCELA
    // ========================================================

    if (indice_selecionado == _indice)
    {
        cancelar_planta();
        return;
    }


    // ========================================================
    // PEGA A PLANTA
    // ========================================================

    planta_selecionada_local = nome;

    indice_selecionado = _indice;


    // Guarda o objeto real da planta.

    global.planta_selecionada =
        dados.objeto;


    // Guarda a posição da carta.

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
    // --------------------------------------------------------
    // Coordenadas da GUI
    // --------------------------------------------------------

    var mouse_gui_x =
        device_mouse_x_to_gui(0);

    var mouse_gui_y =
        device_mouse_y_to_gui(0);


    // --------------------------------------------------------
    // Verifica se a fase começou
    // --------------------------------------------------------

    if (variable_global_exists("fase_iniciada"))
    {
        if (!global.fase_iniciada)
        {
            return;
        }
    }


    // --------------------------------------------------------
    // Verifica clique esquerdo
    // --------------------------------------------------------

    if (!mouse_check_button_pressed(mb_left))
    {
        return;
    }


    // --------------------------------------------------------
    // Verifica lista
    // --------------------------------------------------------

    if (!variable_global_exists("plantas_escolhidas"))
    {
        return;
    }

    if (!ds_exists(global.plantas_escolhidas, ds_type_list))
    {
        return;
    }


    // --------------------------------------------------------
    // Tamanho do quadro
    // --------------------------------------------------------

    var quadro_largura =
        sprite_get_width(spr_quadrado_plantas)
        * escala_quadro_x;

    var quadro_altura =
        sprite_get_height(spr_quadrado_plantas)
        * escala_quadro_y;


    // --------------------------------------------------------
    // Quantidade de plantas
    // --------------------------------------------------------

    var quantidade =
        ds_list_size(
            global.plantas_escolhidas
        );


    // ========================================================
    // PROCURA QUAL CARTA FOI CLICADA
    // ========================================================

    for (var i = 0; i < quantidade; i++)
    {
        var px = barra_x;

        var py =
            barra_y +
            (i * espacamento);


        // ----------------------------------------------------
        // O clique é no QUADRO inteiro
        // ----------------------------------------------------

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
// MÉTODO: ATUALIZAR
// ============================================================

atualizar = function()
{
    verificar_clique();
};

#endregion