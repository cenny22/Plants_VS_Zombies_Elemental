// 1. Ativa o cortador se ele ainda estiver parado
if (!ativado) {
    ativado = true;
}

// 2. Marca no zumbi que ele foi morto pelo carrinho (para NÃO somar no placar)
other.morto_por_carrinho = true;

// 3. Destrói o zumbi na hora
with (other) {
    instance_destroy();
}