// Executa o impacto apenas se ele ainda estiver na investida (-4 de velocidade)
if (em_investida) {
    // Destrói a planta atingida
    with (other) {
        instance_destroy();
    }
    
    // Altera a velocidade para a velocidade reduzida e encerra a investida
    velocidade_atual = -0.5;
    em_investida = false;
    
    // Opcional: Adicionar efeito sonoro ou animação de impacto aqui
    // show_debug_message("Gorila atingiu uma planta e desacelerou!");
}