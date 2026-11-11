// Destrói o projétil se ele andar mais do que 2 blocos a partir de onde nasceu
if (point_distance(x_inicio, y, x, y) >= alcance_maximo) {
    instance_destroy();
}