// 1. Atributos da Planta
vida = 100;
raio_efeito = 240; // Área de alcance (~3x3)

// 2. Aplica a paralisia nos zumbis no alcance
with (obj_zumbi_parent) {
    if (point_distance(x, y, other.x, other.y) <= other.raio_efeito) {
        
        paralisado = true;
        tempo_paralisado = room_speed * 20; // 10 segundos de paralisia
        speed = 0;                          // Interrompe o movimento imediatamente
    }
}

// 3. Agenda a destruição da planta em 3 segundos
alarm[0] = room_speed * 3;