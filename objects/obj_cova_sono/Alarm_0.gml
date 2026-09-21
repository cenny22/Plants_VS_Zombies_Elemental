// ==========================================================
// 1. DESTRUIÇÃO DE PLANTAS NA AURA
// ==========================================================
var lista_plantas = ds_list_create();
var qtd_plantas = collision_circle_list(x, y, raio_aura, obj_planta_parent, false, true, lista_plantas, false);

if (qtd_plantas > 0) {
    for (var i = 0; i < qtd_plantas; i++) {
        var planta_atual = lista_plantas[| i];
        with (planta_atual) {
            instance_destroy();
        }
    }
}
ds_list_destroy(lista_plantas);


// ==========================================================
// 2. BUFF DE VELOCIDADE NOS ZUMBIS (+0.5 VELOCIDADE)
// ==========================================================
var lista_zumbis = ds_list_create();
var qtd_zumbis = collision_circle_list(x, y, raio_aura, obj_zumbi_parent, false, true, lista_zumbis, false);

if (qtd_zumbis > 0) {
    for (var j = 0; j < qtd_zumbis; j++) {
        var zumbi_atual = lista_zumbis[| j];
        
        // Aplica o aumento apenas uma vez ao entrar na aura
        if (!variable_instance_exists(zumbi_atual, "buff_cova")) {
            zumbi_atual.buff_cova = true;
            
            // Como a velocidade do zumbi é negativa (vai para a esquerda), 
            // subtraímos 0.5 para deixá-lo MAIS rápido para a esquerda!
            if (zumbi_atual.vel < 0) {
                zumbi_atual.vel -= 0.4; 
            } else {
                zumbi_atual.vel += 0.4;
            }
            
            // Aplica a nova velocidade no movimento
            zumbi_atual.speed = zumbi_atual.vel;
        }
    }
}
ds_list_destroy(lista_zumbis);

// Reagenda a checagem
alarm[0] = game_get_speed(gamespeed_fps) * 0.1;