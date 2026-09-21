/// @description Catálogo único das plantas jogáveis.
/// Para adicionar uma planta comum, crie aqui uma ficha com os mesmos campos.

function plantas_criar_catalogo()
{
    return {
        disparervilha:      { objeto: obj_disparervilha,      card: obj_card_disparervilha,      custo: 100, recarga: 7.5,  desbloqueada_inicial: true  },
        girassol:           { objeto: obj_girassol,           card: obj_card_girassol,           custo: 50,  recarga: 7.5,  desbloqueada_inicial: false },
        noz:                { objeto: obj_noz_obstaculo,      card: obj_card_noz,                custo: 50,  recarga: 15.0, desbloqueada_inicial: false },
        ervaespinho:        { objeto: obj_ervaespinho,        card: obj_card_ervaespinho,        custo: 100, recarga: 7.5,  desbloqueada_inicial: false },
        batatamina:         { objeto: obj_batatamina,         card: obj_card_batatamina,         custo: 25,  recarga: 20.0, desbloqueada_inicial: false },
        esparabalde:        { objeto: obj_esparabalde,        card: obj_card_esparabalde,        custo: 75,  recarga: 15.0, desbloqueada_inicial: false },
        repelecao:          { objeto: obj_repepe_cao,         card: obj_card_repelecao,          custo: 75,  recarga: 15.0, desbloqueada_inicial: false },
        duplervilha:        { objeto: obj_duplervilha,        card: obj_card_duplervilha,        custo: 175, recarga: 10.0, desbloqueada_inicial: false },
        covaceps:           { objeto: obj_covaceps,           card: obj_card_covaceps,           custo: 50,  recarga: 90.0, desbloqueada_inicial: false },
        veudenoiva:         { objeto: obj_veudenoiva,         card: obj_card_veudenoiva,         custo: 150, recarga: 7.5,  desbloqueada_inicial: false },
        broto:              { objeto: obj_brotoflorescedor,   card: obj_card_brotoflorescedor,   custo: 75,  recarga: 5.0,  desbloqueada_inicial: false },
        morcegarrador:      { objeto: obj_morcegarrador,      card: obj_card_morcegarrador,      custo: 100, recarga: 40.0, desbloqueada_inicial: false },
        enroscacovas:       { objeto: obj_enroscacovas,       card: obj_card_enroscacovas,       custo: 50,  recarga: 20.0, desbloqueada_inicial: false },
        triplervilha:       { objeto: obj_triplervilha,       card: obj_card_triplervilha,       custo: 275, recarga: 15.0, desbloqueada_inicial: false },
        espinhoguiado:      { objeto: obj_espinhoguiado,      card: obj_card_espinhoguiado,      custo: 250, recarga: 15.0, desbloqueada_inicial: false },
        trepaervilha:       { objeto: obj_trepaervilha,       card: obj_card_trepaervilha,       custo: 125, recarga: 15.0, desbloqueada_inicial: false }
    };
}

function planta_obter(_id)
{
    if (!variable_global_exists("plantas") || !variable_struct_exists(global.plantas, _id)) {
        return undefined;
    }

    return variable_struct_get(global.plantas, _id);
}

function planta_obter_por_objeto(_objeto)
{
    if (!variable_global_exists("plantas")) {
        return undefined;
    }

    var ids = variable_struct_get_names(global.plantas);
    for (var i = 0; i < array_length(ids); i++) {
        var planta = variable_struct_get(global.plantas, ids[i]);
        if (planta.objeto == _objeto) {
            return planta;
        }
    }

    return undefined;
}

function plantas_inicializar_desbloqueios()
{
    if (!variable_global_exists("plantas_liberadas")) {
        global.plantas_liberadas = ds_map_create();
    }

    var ids = variable_struct_get_names(global.plantas);
    for (var i = 0; i < array_length(ids); i++) {
        var id_planta = ids[i];
        if (!ds_map_exists(global.plantas_liberadas, id_planta)) {
            var planta = variable_struct_get(global.plantas, id_planta);
            ds_map_add(global.plantas_liberadas, id_planta, planta.desbloqueada_inicial);
        }
    }
}
