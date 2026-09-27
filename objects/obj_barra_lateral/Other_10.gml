#region
// ============================================================
// USER EVENT — RECRIAR CARD
// ============================================================


// Converte type da barra para índice da lista

var index = type - 1;


// ============================================================
// VERIFICA A LISTA
// ============================================================

if (index < ds_list_size(global.plantas_escolhidas))
{
    var nome =
        ds_list_find_value(
            global.plantas_escolhidas,
            index
        );


    // ========================================================
    // VARIÁVEIS
    // ========================================================

    var obj_card = noone;
    var planta_obj_nome = "";


    // ========================================================
    // DISPARAERVILHA
    // ========================================================

    if (nome == "disparervilha")
    {
        obj_card = obj_card_disparervilha;
        planta_obj_nome = "obj_disparervilha";
    }


    // ========================================================
    // TRIPLAERVILHA
    // ========================================================

    else if (nome == "triplervilha")
    {
        obj_card = obj_card_triplervilha;
        planta_obj_nome = "obj_triplervilha";
    }


    // ========================================================
    // ESPINHO GUIADO
    // ========================================================

    else if (nome == "espinhoguiado")
    {
        obj_card = obj_card_espinhoguiado;
        planta_obj_nome = "obj_espinhoguiado";
    }


    // ========================================================
    // GIRASSOL
    // ========================================================

    else if (nome == "girassol")
    {
        obj_card = obj_card_girassol;
        planta_obj_nome = "obj_girassol";
    }


    // ========================================================
    // NOZ
    // ========================================================

    else if (nome == "noz")
    {
        obj_card = obj_card_noz;
        planta_obj_nome = "obj_noz_obstaculo";
    }


    // ========================================================
    // ERVA ESPINHO
    // ========================================================

    else if (nome == "ervaespinho")
    {
        obj_card = obj_card_ervaespinho;
        planta_obj_nome = "obj_ervaespinho";
    }


    // ========================================================
    // BATATA MINA
    // ========================================================

    else if (nome == "batatamina")
    {
        obj_card = obj_card_batatamina;
        planta_obj_nome = "obj_batatamina";
    }


    // ========================================================
    // ENROSCACOVAS
    // ========================================================

    else if (nome == "enroscacovas")
    {
        obj_card = obj_card_enroscacovas;
        planta_obj_nome = "obj_enroscacovas";
    }


    // ========================================================
    // ESPARABALDE
    // ========================================================

    else if (nome == "esparabalde")
    {
        obj_card = obj_card_esparabalde;
        planta_obj_nome = "obj_esparabalde";
    }


    // ========================================================
    // TREPAERVILHA
    // ========================================================

    else if (nome == "trepaervilha")
    {
        obj_card = obj_card_trepaervilha;
        planta_obj_nome = "obj_trepaervilha";
    }


    // ========================================================
    // REPELEÇÃO
    // ========================================================

    else if (nome == "repelecao")
    {
        obj_card = obj_card_repelecao;
        planta_obj_nome = "obj_repepe_cao";
    }


    // ========================================================
    // CRIA O CARD
    // ========================================================

    if (obj_card != noone)
    {
        var card =
            instance_create_layer(
                x,
                y,
                layer,
                obj_card
            );


        card.type = type;

        card.depth = depth - 10;

        card.planta_associada =
            asset_get_index(
                planta_obj_nome
            );
    }
}

#endregion