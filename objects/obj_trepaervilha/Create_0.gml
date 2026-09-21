event_inherited(); // Puxa o Create do Parent
hp = 300; 
pode_atirar = true;

// Define uma profundidade menor para desenhar sobre outras plantas
depth = -100;

// Libera o quadrado do grid para que outra planta possa ser colocada no mesmo lugar
var quadrado = instance_position(x, y, obj_quadrado_grid);
if (quadrado != noone) {
    quadrado.ocupado = false; // Se o seu sistema usar uma variável para controlar ocupação
    quadrado.planta_abrigada = noone;
}