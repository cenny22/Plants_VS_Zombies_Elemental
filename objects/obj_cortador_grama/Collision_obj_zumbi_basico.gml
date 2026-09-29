// 1. Ativa o cortador se ele ainda estiver parado
if (!ativado) {
    ativado = true;
}

// 2. Marca no zumbi que ele foi morto pelo carrinho (para NÃO somar no placar)
with (other) 
{
    destruido_por_carrinho = true;
	instance_destroy();
}