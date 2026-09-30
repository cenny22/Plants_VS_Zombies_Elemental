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