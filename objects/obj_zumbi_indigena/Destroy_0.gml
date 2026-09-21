// Procura o quadrado do grid mais próximo do zumbi no momento da morte
var quadrado_perto = instance_nearest(x, y, obj_quadrado_grid);

// Se encontrar um quadrado no grid, cria a cova na posição exata dele
if (quadrado_perto != noone) {
    instance_create_layer(quadrado_perto.x, quadrado_perto.y, "Instances", obj_cova_sono);
}