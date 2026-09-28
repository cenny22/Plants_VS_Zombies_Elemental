#region
// ============================================================
// OBJ_CAMERA — STEP
// CÂMERA ARRASTADA PELO MOUSE
// ============================================================

var mouse_x_atual = device_mouse_x(0);
var mouse_y_atual = device_mouse_y(0);


// ============================================================
// COMEÇAR A ARRASTAR
// ============================================================

if (mouse_check_button_pressed(mb_left))
{
    arrastando = true;

    mouse_inicio_x = mouse_x_atual;
    mouse_inicio_y = mouse_y_atual;

    camera_inicio_x = camera_get_view_x(camera_id);
    camera_inicio_y = camera_get_view_y(camera_id);
}


// ============================================================
// ARRASTANDO
// ============================================================

if (arrastando)
{
    var deslocamento_x = mouse_inicio_x - mouse_x_atual;
    var deslocamento_y = mouse_inicio_y - mouse_y_atual;

    var nova_camera_x =
        camera_inicio_x + deslocamento_x;

    var nova_camera_y =
        camera_inicio_y + deslocamento_y;


    // ========================================================
    // TAMANHO REAL DA CÂMERA
    // ========================================================

    var largura_camera =
        camera_get_view_width(camera_id);

    var altura_camera =
        camera_get_view_height(camera_id);


    // ========================================================
    // LIMITES DA ROOM
    // ========================================================

    var limite_x =
        max(0, room_width - largura_camera);

    var limite_y =
        max(0, room_height - altura_camera);


    // ========================================================
    // IMPEDIR A CÂMERA DE SAIR DA ROOM
    // ========================================================

    nova_camera_x =
        clamp(nova_camera_x, 0, limite_x);

    nova_camera_y =
        clamp(nova_camera_y, 0, limite_y);


    // ========================================================
    // MOVER CÂMERA
    // ========================================================

    camera_set_view_pos(
        camera_id,
        nova_camera_x,
        nova_camera_y
    );


    // ========================================================
    // SOLTAR BOTÃO
    // ========================================================

    if (mouse_check_button_released(mb_left))
    {
        arrastando = false;
    }
}

#endregion