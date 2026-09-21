// Verifica o tipo e aplica o sprite correto se ele existir
if (tipo == "jogar") {
    // SE VOCÊ NÃO TIVER um sprite para o botão jogar, comente a linha abaixo colocando // no início
    // sprite_index = spr_botao_jogar; 
} 
else if (tipo == "config") {
    // SE VOCÊ NÃO TIVER um sprite de configuração, comente a linha abaixo
    // sprite_index = spr_botao_config; 
} 
else if (tipo == "mapa_planta") {
    sprite_index = mapa_planta; 
} 
else if (tipo == "fase_1") {
    sprite_index = planta_1; 
} 
else if (tipo == "fase_2") {
    sprite_index = planta_2; 
}