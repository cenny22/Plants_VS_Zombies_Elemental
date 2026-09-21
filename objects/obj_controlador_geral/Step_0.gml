if (keyboard_check_pressed(vk_shift)) {
    // Inverte o estado atual da tela cheia
    window_set_fullscreen(!window_get_fullscreen());
}