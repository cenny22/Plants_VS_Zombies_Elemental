// Se o zumbi atingido for o Boss, ignora completamente
if (other.object_index == obj_boss_planta || object_is_ancestor(other.object_index, obj_boss_planta)) {
    exit;
}

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