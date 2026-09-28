#region
// ============================================================
// OBJ_PA — DRAW
// ============================================================

if (global.pa_selecionada)
{
    // ========================================================
    // VASO SEM A PÁ
    // ========================================================

    draw_sprite_ext(
        Sprite_nao_pa,
        0,
        x,
        y,
        escala_pa,
        escala_pa,
        0,
        c_white,
        1
    );


    // ========================================================
    // PÁ SEGUINDO O MOUSE
    // ========================================================

    var mouse_x_pa =
        device_mouse_x_to_gui(0);

    var mouse_y_pa =
        device_mouse_y_to_gui(0);


    draw_sprite_ext(
        Sprite_so_pa,
        0,
        mouse_x_pa,
        mouse_y_pa,
        escala_pa,
        escala_pa,
        0,
        c_white,
        0.5
    );
}
else
{
    // ========================================================
    // VASO + PÁ
    // ========================================================

    draw_sprite_ext(
        Sprite_pa,
        0,
        x,
        y,
        escala_pa,
        escala_pa,
        0,
        c_white,
        1
    );
}

#endregion