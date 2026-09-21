// Exibe a quantidade de Sóis
draw_set_color(c_yellow);
draw_text(50, 20, "________" + string(global.sois));

// Antes de iniciar a partida (fase de seleção de cards)
if (!global.fase_iniciada) {
    draw_set_color(c_white);
    draw_text(room_width / 2 - 100, 50, "Planeje suas defesas - Dia 28");
    
    if (ds_exists(global.plantas_escolhidas, ds_type_list)) {
        draw_text(30, 60, "Escolhidas: " + string(ds_list_size(global.plantas_escolhidas)) + "/7");
    }
} 

// Contador de progresso da horda
draw_set_color(c_red);
draw_text(600, 20, "ZUMBIS DERROTADOS: " + string(global.zumbis_mortos) + "/" + string(total_fase));