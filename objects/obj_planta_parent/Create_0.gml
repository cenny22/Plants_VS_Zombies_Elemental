hp = 100;
var x1 = 585;
var y1 = 81;
var x2 = 1088;
var y2 = 704;

// Checa se foi colocada na área da Onça
if (point_in_rectangle(x, y, x1, y1, x2, y2)) {
    var onca = instance_nearest(x, y, obj_onca_zumbi);
    
    if (instance_exists(onca)) {
        onca.alvo_ataque = id; // Define o alvo da Onça
    }
}

pisk = 0;