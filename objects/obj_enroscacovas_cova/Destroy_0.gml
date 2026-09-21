// Se a planta for destruída e o gás ainda existir, destrói o gás junto
if (variable_instance_exists(id, "meu_gas") && instance_exists(meu_gas)) {
    instance_destroy(meu_gas);
}