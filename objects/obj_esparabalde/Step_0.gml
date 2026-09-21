// 1. Distância de detecção em pixels
var raio_deteccao = 64; 

// 2. Procura pelo zumbi mais próximo
var zumbi_proximo = instance_nearest(x, y, obj_zumbi_parent);

// 3. Checa se o zumbi está perto
if (instance_exists(zumbi_proximo) && distance_to_object(zumbi_proximo) <= raio_deteccao) {
    
    // Se ainda não estava usando o Sprite32_1, muda para ele e inicia a animação do começo
    if (sprite_index != Sprite32_1) {
        sprite_index = Sprite32_1;
        image_index = 0;
        image_speed = 1; // Garante que a animação vai rodar
    }
    
    // Se já chegou no último frame da animação, trava no final
    if (image_index >= image_number - 1) {
        image_speed = 0;
        image_index = image_number - 1; // Congela no último frame
    }

} else {
    // Quando o zumbi morrer ou sair de perto:
    // Muda de volta para o Sprite32_2 e reativa a velocidade normal da animação
    if (sprite_index != Sprite32_2) {
        sprite_index = Sprite32_2;
        image_index = 0;
        image_speed = 1;
    }
}