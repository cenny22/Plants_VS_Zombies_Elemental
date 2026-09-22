// 1. Verifica se existe uma planta selecionada para plantar
if (variable_global_exists("planta_selecionada") && global.planta_selecionada != noone) {

    // 2. Encontra o quadrado do grid mais próximo DO LUGAR ONDE FOI CLICADO (mouse_x, mouse_y)
    var grid_proximo = instance_nearest(mouse_x, mouse_y, obj_quadrado_grid);

    // 3. Executa todo o código de plantio original dentro desse quadrado do grid
    if (grid_proximo != noone) {
        with (grid_proximo) {
            event_perform(ev_mouse, ev_left_press);
        }
    }
}