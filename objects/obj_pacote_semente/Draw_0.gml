draw_self(); // Desenha o sprite do card

// Se a fase NÃO começou, desenha o nome e custo em cima do card para escolha
if (!global.fase_iniciada) {
    draw_set_color(c_black);
    draw_text(x + 5, y + 5, nome_planta);
    draw_text(x + 5, y + 25, string(custo) + " $");
    
    // Se já foi selecionado, escurece o card
    if (selecionado) {
        draw_set_alpha(0.5);
        draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
    }
}