// Movimentação do pacote (mude para x += velocidade_esteira se a esteira for horizontal)
if (!selecionado) {
    y += velocidade_esteira;
}

// Se o pacote passar da esteira e sair da tela, é destruído
if (y > room_height + 50) {
    instance_destroy();
}