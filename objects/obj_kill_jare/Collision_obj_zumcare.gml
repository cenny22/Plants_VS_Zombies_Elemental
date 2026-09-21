// Cancela o estado de investida do Zumcaré (se existir) para evitar travamentos
if (variable_instance_exists(other, "em_investida")) {
    other.em_investida = false;
}

// Marca como morto para controle de placar/sistema do seu jogo
if (variable_instance_exists(other, "morto_por_carrinho")) {
    other.morto_por_carrinho = true;
}

// Destrói a instância do Zumcaré imediatamente
with (other) {
    instance_destroy();
}
