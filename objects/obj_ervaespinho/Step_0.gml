// 1. Verifica se tem um zumbi colidindo com a erva-espinho
var zumbi_tocando = instance_place(x, y, obj_zumbi_parent);

// 2. Se o zumbi estiver em cima da erva
if (instance_exists(zumbi_tocando)) {
    
    // Troca para o sprite de ataque e deixa rodar em looping normal
    if (sprite_index != spr_erva_2) {
        sprite_index = spr_erva_2;
        image_index = 0;
        image_speed = 1; // Roda a animação em looping
    }

} else {
    // Se o zumbi morrer ou sair de cima, volta para o sprite padrão
    if (sprite_index != spr_ervaespinho) {
        sprite_index = spr_ervaespinho;
        image_index = 0;
        image_speed = 1;
    }
}