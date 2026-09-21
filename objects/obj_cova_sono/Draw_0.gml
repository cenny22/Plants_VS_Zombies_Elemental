// 1. Desenha a sprite normal da cova
draw_self();

// 2. Desenha a aura roxa ao redor da cova
gpu_set_blendmode(bm_add); // Modo de mesclagem para dar efeito de brilho/aura

// Desenha círculos roxos suaves e semi-transparentes
draw_set_color(c_purple);
draw_set_alpha(alpha_aura);
draw_circle(x, y, raio_aura, false);

draw_set_color(c_fuchsia);
draw_set_alpha(alpha_aura * 0.5);
draw_circle(x, y, raio_aura * 0.6, false);

// Reseta as configurações de cor e blendmode padrão do GameMaker
draw_set_alpha(1.0);
draw_set_color(c_white);
gpu_set_blendmode(bm_normal);