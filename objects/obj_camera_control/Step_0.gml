// Move para a esquerda
if (keyboard_check(vk_left)) {
    x -= velocidade;
}

// Move para a direita
if (keyboard_check(vk_right)) {
    x += velocidade;
}

// Limita a posição X para a câmera não sair dos limites da Room
x = clamp(x, 0, room_width);