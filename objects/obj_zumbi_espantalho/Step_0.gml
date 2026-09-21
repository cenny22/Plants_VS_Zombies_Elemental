event_inherited(); // Mantém o comportamento de movimentação/ataque padrão do pai

// Procura por uma cova de sono que esteja colidindo com este zumbi
var cova = instance_place(x, y, obj_cova_sono);

if (cova != noone) {
    var total_quadrados = instance_number(obj_quadrado_grid);
    
    if (total_quadrados > 0) {
        // Sorteia um quadrado aleatório do grid
        var quadrado_sorteado = instance_find(obj_quadrado_grid, irandom(total_quadrados - 1));
        
        if (quadrado_sorteado != noone) {
            // Destrói a cova atual que o zumbi tocou
            instance_destroy(cova);
            
            // Cria uma nova cova na posição do quadrado sorteado
            instance_create_layer(quadrado_sorteado.x, quadrado_sorteado.y, "Instances", obj_cova_sono);
        }
    }
}