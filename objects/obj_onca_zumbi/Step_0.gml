// -------------------------------------------------------------
// Movimentação da Onça
// -------------------------------------------------------------

// 1. Desativa a movimentação nativa (para o move_towards_point não travar o x)
speed = 0; 

// 2. Procura por uma planta na mesma linha horizontal (Y) e à esquerda
if (!instance_exists(alvo_ataque)) {
    var planta_proxima = instance_nearest(x, y, obj_planta_parent); // Substitua pelo objeto pai/classe das plantas
    
    if (planta_proxima != noone && abs(planta_proxima.y - y) < 20 && planta_proxima.x < x) {
        alvo_ataque = planta_proxima;
    }
}

// 3. Executa o movimento
if (instance_exists(alvo_ataque)) {
    // Se a planta existe e a onça está perto, para para atacar
    if (distance_to_object(alvo_ataque) <= 4) {
        // Fica parada atacando a planta
    } else {
        // Anda na direção da planta encontrada
        var dir = point_direction(x, y, alvo_ataque.x, alvo_ataque.y);
        x += lengthdir_x(velocidade_ataque, dir);
        y += lengthdir_y(velocidade_ataque, dir);
    }
} else {
    // SE NÃO TEM PLANTA NA LINHA: Anda lentamente para a esquerda SEM PARAR!
    x -= velocidade_normal; 
}
if (hp <= 0){
instance_destroy();
global.zumbis_mortos ++
}