// ==========================================================
// 1. ESTADO DE QUEDA (Caindo do Céu)
// ==========================================================
if (estado == "caindo") {
    y += vsp;
    
    if (y >= y_destino) {
        y = y_destino;      
        estado = "andando"; 
        
        // Garante a direção para a esquerda assim que pousar
        hspeed = -vel; // Ou hspeed = -1;
    }
    
    exit; 
}

// ==========================================================
// 2. ESTADO NORMAL
// ==========================================================
event_inherited();
if (hp = 0){
instance_destroy();
global.zumbis_mortos ++
}