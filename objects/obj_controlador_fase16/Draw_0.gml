// Desenha la quantidade de Sóis no topo da tela
function draw_text_outline(x, y, texto, cor_texto, cor_borda, espessura) {
    draw_set_color(cor_borda);
    
    // Desenha nas 8 posições ao redor para criar o contorno
    draw_text(x - espessura, y, texto);
    draw_text(x + espessura, y, texto);
    draw_text(x, y - espessura, texto);
    draw_text(x, y + espessura, texto);
    draw_text(x - espessura, y - espessura, texto);
    draw_text(x + espessura, y - espessura, texto);
    draw_text(x - espessura, y + espessura, texto);
    draw_text(x + espessura, y + espessura, texto);
    
    // Desenha o texto principal no centro
    draw_set_color(cor_texto);
    draw_text(x, y, texto);
}
draw_text(50, 20, "________" + string(global.sois));

// Se a fase NÃO começou, exibe um texto de instrução
if (!global.fase_iniciada) {
    draw_set_color(c_orange);
    draw_text(room_width / 2 - 100, 50, "Mata dos bichos - dia 16");
    
    // Mostra quantas plantas já foram escolhidas
    if (ds_exists(global.plantas_escolhidas, ds_type_list)) {
        draw_text(30, 60, "Escolhidas: " + string(ds_list_size(global.plantas_escolhidas)) + "/7");
    }
}

// Desenha o contador de zumbis mortos no canto direito da tela
draw_set_color(c_red);
draw_text(600, 20, "ZUMBIS DERROTADOS: " + string(global.zumbis_mortos) + "/" + string(total_fase));