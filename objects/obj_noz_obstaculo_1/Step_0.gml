// Checa a vida para mudar as sprites de dano da noz
if (hp <= 2000) {
    // Caso a vida seja 1000 ou menos: Sprite com dano grave
    if (sprite_index != Sprite23_2) {
        sprite_index = Sprite23_2;
    }
} 
else if (hp <= 4000) {
    // Caso a vida seja 2000 ou menos (e maior que 1000): Sprite com dano leve
    if (sprite_index != Sprite23_1) {
        sprite_index = Sprite23_1;
    }
} 
else {
    // Caso a vida esteja cheia (acima de 2000): Sprite normal intacta
    // Substitua 'spr_noz_normal' pelo nome do seu sprite original da noz inteira
    if (sprite_index != Sprite23) { 
        sprite_index = Sprite23;
    }
}
if (hp <= 0) {
    instance_destroy();
}