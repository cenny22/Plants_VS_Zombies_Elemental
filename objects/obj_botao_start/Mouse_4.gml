// Verifica se o controlador existe e se a partida já começou o plantio
if (instance_exists(obj_controlador_fase28)) {
    if (global.fase_iniciada) {
        obj_controlador_fase28.tempo_preparacao = 0;
        obj_controlador_fase28.fase_ativa = true;
        
        // Destrói o botão após ser clicado
        instance_destroy();
    }
}