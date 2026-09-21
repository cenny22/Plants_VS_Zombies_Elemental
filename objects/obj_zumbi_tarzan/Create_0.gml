// 1. Herda as variáveis do obj_zumbi_parent
event_inherited();

// 2. Atributos do Zumbi Tarzan
hp = 90; 

// Velocidade negativa para mover para a esquerda, ou ajustada no Step
vel = 2;

// 3. Sistema de Queda do Céu
estado = "caindo"; // Estados possíveis: "caindo", "andando"
y_destino = y;     // Guarda a linha Y exata
y = y - 30;       // Inicia acima do mapa
vsp = 8;           // Velocidade de queda