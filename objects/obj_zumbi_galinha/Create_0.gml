event_inherited(); // Puxa o pai

hp = 1;            
vel = -4;           
speed = vel;
visible = true;
image_alpha = 1;
image_speed = 1;

// ==========================================================
// TELEPORTE SEGURO PARA O GRID
// ==========================================================
// Mudamos para 'instance_nearest' direto aqui para ela se virar ao nascer
if (instance_exists(obj_quadrado_grid)) {
    var bloco_perto = instance_nearest(x, y, obj_quadrado_grid);
    if (bloco_perto != noone) {
        y = bloco_perto.y; // Força o Y dela a ser igualzinho ao do quadrado do grid
    }
}

depth = -y; // Garante que ela não fique atrás do cenário
eh_animal = true;