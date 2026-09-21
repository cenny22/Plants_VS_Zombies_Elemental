if (!variable_global_exists("fase_iniciada")) global.fase_iniciada = true;
if (!variable_global_exists("zumbis_mortos")) global.zumbis_mortos = 0;

global.modo_esteira = true;

// Reinicia o alarme apenas se o Devorador ainda NÃO tiver aparecido e a meta não foi batida
if (alarm[1] == -1 && !devorador_gerado && global.zumbis_mortos < total_fase) {
    alarm[1] = game_get_speed(gamespeed_fps) * 2;
}

// ==========================================================
// SPAWN ESPECIAL: DEVORADOR NA 38ª MORTE
// ==========================================================
if (global.zumbis_mortos >= 38 && !devorador_gerado) {
    
    var pos_x_grid = posicao_spawn_x;
    var pos_y_grid = fileiras_y[irandom(4)];
    
    var qtd_quadrados = instance_number(obj_quadrado_grid);
    
    if (qtd_quadrados > 0) {
        // Encontra um quadrado inicial para referência
        var quadrado_sorteado = instance_find(obj_quadrado_grid, irandom(qtd_quadrados - 1));
        var maior_x = quadrado_sorteado.x;
        
        // Loop para encontrar a coluna mais à direita do gramado
        for (var i = 0; i < qtd_quadrados; i++) {
            var q = instance_find(obj_quadrado_grid, i);
            if (q.x > maior_x) {
                maior_x = q.x;
            }
        }
        
        // Filtra os quadrados que pertencem a essa última coluna da direita
        var quadrados_da_direita = [];
        for (var i = 0; i < qtd_quadrados; i++) {
            var q = instance_find(obj_quadrado_grid, i);
            if (q.x == maior_x) {
                array_push(quadrados_da_direita, q);
            }
        }
        
        // Sorteia um quadrado da última coluna para alinhar X e Y no grid com offset maior pra cima
        if (array_length(quadrados_da_direita) > 0) {
            var quadrado_alvo = quadrados_da_direita[irandom(array_length(quadrados_da_direita) - 1)];
            
            pos_x_grid = quadrado_alvo.x;
            
            // AJUSTE PARA CIMA: Aumentado para -40 pixels para subir mais o spawn
            var offset_y = -40; 
            pos_y_grid = quadrado_alvo.y + offset_y;
        }
    }

    if (object_exists(obj_devorador)) {
        instance_create_layer(pos_x_grid, pos_y_grid, "Instances", obj_devorador);
        show_debug_message("DEVORADOR GERADO ALINHADO NO GRID!");
    }
    
    devorador_gerado = true; // Impede a criação repetida
    alarm[1] = -1; // TRAVA E PARA O NASCIMENTO DE OUTROS ZUMBIS
}

// ==========================================================
// CONDIÇÃO DE VITÓRIA (40 KILLS)
// ==========================================================
if (global.zumbis_mortos >= total_fase) {
    alarm[1] = -1; // Garante que o spawn continue parado
    global.fase_iniciada = false;
    global.modo_esteira = false;
	global.vitorias ++
    global.zumbis_mortos = 0;
    ds_map_replace(global.plantas_liberadas, "veudenoiva", true); 
    room_goto(Room_fases_planta);
}