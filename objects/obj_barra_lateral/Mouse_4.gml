// Só responde aos cliques se a partida já tiver começado
if (global.fase_iniciada) {
    
    // TRAVA: Se estiver recarregando, ignora o clique
    if (em_cooldown) exit;

    var index = type - 1;

    if (index < ds_list_size(global.plantas_escolhidas)) {
        var nome_planta = ds_list_find_value(global.plantas_escolhidas, index);
        var objeto_real = asset_get_index("obj_" + nome_planta);

        if (nome_planta == "noz")         objeto_real = obj_noz_obstaculo;
        if (nome_planta == "repelecao")   objeto_real = obj_repepe_cao;
		if (nome_planta == "broto") objeto_real = obj_brotoflorescedor;		if (nome_planta == "covaceps") objeto_real = obj_covaceps;
		if (nome_planta == "enroscacovas") objeto_real = obj_enroscacovas;
		if (nome_planta == "espinhoguiado") objeto_real = obj_espinhoguiado;

        if (object_exists(objeto_real)) {
            // Se já for a mesma planta, cancela a seleção
            if (global.planta_selecionada == objeto_real) {
                global.planta_selecionada = noone;
                global.barra_selecionada = noone;
            } else {
                global.planta_selecionada = objeto_real;
                global.barra_selecionada = id; // SALVA A BARRA QUE FOI CLICADA
            }
        }
    }
}