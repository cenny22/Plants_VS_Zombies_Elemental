// ============================================================
// GIRASSOL — DESENHO
// ============================================================

if (pisca_sol > 0)
{
    draw_sprite_ext(
        sprite_index,
        image_index,
        x,
        y,
        image_xscale,
        image_yscale,
        image_angle,
        c_yellow,
        image_alpha
    );
}
else
{
    draw_self();
}