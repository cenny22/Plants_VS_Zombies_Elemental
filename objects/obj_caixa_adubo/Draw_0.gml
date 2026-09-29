#region

// Desenha a caixa de adubo na posição original do objeto
draw_sprite_ext(
    sprite_index,
    0,
    x,
    y,
    escala_adubo,
    escala_adubo,
    0,
    c_white,
    1
);

// Se estiver selecionado, desenha o adubo seguindo o ponteiro do mouse
if (global.adubo_selecionado)
{
    var mouse_x_gui = device_mouse_x_to_gui(0);
    var mouse_y_gui = device_mouse_y_to_gui(0);

    draw_sprite_ext(
        Spr_Adubo_1,
        0,
        mouse_x_gui,
        mouse_y_gui,
        escala_adubo,
        escala_adubo,
        0,
        c_white,
        0.8
    );
}

#endregion
// Mudança de sprite para o número de adubos
if (global.adubos = 1)
{
	sprite_index = Spr_Adubo1
}

else if (global.adubos = 2)
{
	sprite_index = Spr_Adubo2
}
else
{
	sprite_index = Spr_Adubo3
}

