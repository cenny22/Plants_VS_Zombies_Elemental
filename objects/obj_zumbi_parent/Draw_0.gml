// ============================================================
// ZUMBI
// ============================================================


// ============================================================
// FOGO
// ============================================================

if (fogo == true)
{
	image_blend = c_orange;
    for (var i = 0; i < array_length(fogo_particulas); i++)
    {
        var px = x + fogo_particulas[i].x;
        var py = y + fogo_particulas[i].y;
        var tamanho = fogo_particulas[i].tamanho;

        // Parte externa
        draw_set_color(c_orange);
        draw_circle(px, py, tamanho, false);

        // Núcleo da chama
        draw_set_color(c_yellow);
        draw_circle(px, py, tamanho * 0.5, false);
    }

    draw_set_color(c_white);
}
else
{
	image_blend = c_white
}

draw_self();