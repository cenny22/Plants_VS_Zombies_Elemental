draw_self(); // Desenha o zumbi normal

// Desenha o valor real do HP em cima da cabeça dele
draw_set_color(c_red);
draw_text(x, y - 30, "HP: " + string(hp));
eh_animal = false;