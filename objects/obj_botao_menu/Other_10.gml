// Esse código vai rodar sabendo exatamente o "tipo" que você configurou na Room
if (tipo == "jogar") {
    sprite_index = Sprite4;
} else if (tipo == "config") {
    sprite_index = Sprite4;
} else if (tipo == "mapa_planta") {
    sprite_index = mapa_planta; 
} else if (tipo == "fase_1") {
    sprite_index = planta_1; // Sprite da Fase 1
} else if (tipo == "fase_2") {
    sprite_index = planta_3; // Sprite da Fase 2 (Tenha certeza que o sprite se chama planta_2)
}
