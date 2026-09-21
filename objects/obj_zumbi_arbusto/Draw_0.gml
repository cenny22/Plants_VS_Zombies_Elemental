// 1. Desenha o próprio zumbi (seja a moita andando ou ele comendo)
draw_self();

// ====================================================================
// 2. SISTEMA DE REVELAÇÃO E VULNERABILIDADE
// ====================================================================
if (estado == "comendo") {
    // Desenha uma barra de vida vermelha simples sobre ele enquanto come
    draw_set_color(c_red);
    var barr_width = 40;
    var barr_height = 5;
    var health_percent = (hp / hp_maximo);
    
    draw_rectangle(x - barr_width/2, y - sprite_height/2 - 10, x - barr_width/2 + (barr_width * health_percent), y - sprite_height/2 - 10 + barr_height, false);
    
    // Verifica se ele morreu enquanto comia fora da moita
    if (hp <= 0) {
        instance_destroy();
        
        // Avisa o controlador da Fase 4
        if (instance_exists(obj_controlador_fase4)) {
            obj_controlador_fase4.zumbis_mortos += 1;
        }
    }
} else {
    // Se ele voltou a andar (voltou para a moita), recupera a vida para ficar imune
    hp = hp_maximo;
}