// Código dentro do evento de colisão com obj_zumbi_parent:
if (esta_carregada == true) {
    
    // Aplica os 1800 de dano apenas nos zumbis que estão na mesma área/bloco que ela
    with (obj_zumbi_arbusto) {
        if (place_meeting(x, y, other)) {
            hp -= 1800; 
        }
    }
    
    // A batata cumpriu o papel dela e se deleta
    instance_destroy();
}