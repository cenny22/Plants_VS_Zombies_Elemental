if (pode_nome_em_cima)
{
    draw_set_font(fnt_grande);

    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    var cam = view_camera[0];

    var centro_x = camera_get_view_x(cam)
                 + camera_get_view_width(cam) / 2;

    var topo_y = camera_get_view_y(cam) + 20;

    draw_text(
        centro_x,
        topo_y,
        nome_mapa
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}