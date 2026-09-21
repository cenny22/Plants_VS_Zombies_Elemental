// Movimentação do pacote
if (!selecionado) {
    y += velocidade_esteira;
}

// Se o pacote passar da esteira e sair da tela, é destruído
if (y > room_height + 50) {
    instance_destroy();
}