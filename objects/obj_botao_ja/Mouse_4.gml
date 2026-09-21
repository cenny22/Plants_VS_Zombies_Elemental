// Garante que o jogador escolheu pelo menos 1 planta antes de iniciar
if (ds_list_size(global.plantas_escolhidas) > 0) {
global.fase_iniciada = true;
} else {
    show_debug_message("Selecione pelo menos uma planta!");
}
// 2. Destrói todos os textos/cards de seleção da tela
with (obj_card_disparervilha) {
    instance_destroy();
}

// Destrói o card do Girassol (se ele existir na tela)
if (instance_exists(obj_card_girassol)) {
    with (obj_card_girassol) {
        instance_destroy();
    }
}
if (instance_exists(obj_card_triplervilha)) {
    with (obj_card_triplervilha) {
        instance_destroy();
    }
}
if (instance_exists(obj_card_espinhoguiado)) {
    with (obj_card_espinhoguiado) {
        instance_destroy();
    }
}
if (instance_exists(obj_card_enroscacovas)) {
    with (obj_card_enroscacovas) {
        instance_destroy();
    }
}
// Destrói o card do Girassol (se ele existir na tela)
if (instance_exists(obj_card_veudenoiva)) {
    with (obj_card_veudenoiva) {
        instance_destroy();
    }
}
if (instance_exists(obj_card_covaceps)) {
    with (obj_card_covaceps) {
        instance_destroy();
    }
}

// Destrói o card da Noz (se ele existir na tela)
if (instance_exists(obj_card_noz)) {
    with (obj_card_noz) {
        instance_destroy();
    }
}
// Destrói o card da Noz (se ele existir na tela)
if (instance_exists(obj_card_duplervilha)) {
    with (obj_card_duplervilha) {
        instance_destroy();
    }
}


// Destrói o card da Erva-Espinho (se ele existir na tela)
if (instance_exists(obj_card_ervaespinho)) {
    with (obj_card_ervaespinho) {
        instance_destroy();
    }
}

// NOVO: Destrói o card da Batata-mina (se ele existir na tela)
if (instance_exists(obj_card_batatamina)) {
    with (obj_card_batatamina) {
        instance_destroy();
    }
}
// Destrói o card do Girassol (se ele existir na tela)
if (instance_exists(obj_card_esparabalde)) {
    with (obj_card_esparabalde) {
        instance_destroy();
    }
}
if (instance_exists(obj_card_morcegarrador)) {
    with (obj_card_morcegarrador) {
        instance_destroy();
    }
}
if (instance_exists(obj_card_brotoflorescedor)) {
    with (obj_card_brotoflorescedor) {
        instance_destroy();
    }
}
if (instance_exists(obj_card_trepaervilha)) {
    with (obj_card_trepaervilha) {
        instance_destroy();
    }
}
// Destrói o card do Girassol (se ele existir na tela)
if (instance_exists(obj_card_repelecao)) {
    with (obj_card_repelecao) {
        instance_destroy();
    }
}

// 3. Destrói o próprio botão "JÁ", limpando a interface
instance_destroy();