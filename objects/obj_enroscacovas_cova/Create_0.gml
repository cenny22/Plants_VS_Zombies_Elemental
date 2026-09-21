event_inherited();
hp = 2000;

var deslocamento_x = 96; 
var deslocamento_y = -16; 

// Cria a nuvem de gás e passa o ID desta planta para ela
meu_gas = instance_create_layer(x + deslocamento_x, y + deslocamento_y, "Instances", obj_gas_enroscacovas);

if (instance_exists(meu_gas)) {
    meu_gas.depth = depth - 100;
    meu_gas.dono = id; // Passa a referência do obj_enroscacovas_cova
}