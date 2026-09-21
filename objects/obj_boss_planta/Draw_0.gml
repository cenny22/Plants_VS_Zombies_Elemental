draw_self();

// Interface / Barra de Vida
draw_set_color(c_yellow);
draw_text(30, 20, "Mata dos bichos - dia 30 - TORA COLOSSAL");

// Vida do Boss
draw_set_color(c_red);
draw_text(600, 20, "HP DO CHEFÃO: " + string(max(0, hp)) + " / " + string(hp_max));