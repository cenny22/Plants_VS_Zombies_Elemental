// Executa lógica base do pai (dano, morte, paralisia)
event_inherited();

// Se o timer já zerou e a girafa parou, mantém a velocidade zerada
if (parado) {
    speed = 0;
    vel = 0;
}
if (hp <= 0) {
    if (!variable_global_exists("zumbis_mortos")) global.zumbis_mortos = 0;
    if (object_index != obj_zumbi_galinha) global.zumbis_mortos += 1;
    
    instance_destroy();
}