if (derrotado) exit;

// Destrói todos os Zumcare em campo
if (instance_exists(obj_zumcare)) {
    with (obj_zumcare) {
        if (variable_instance_exists(id, "hp")) hp = 0;
        if (variable_instance_exists(id, "pd")) pd = 0;
        
        instance_destroy(); // Força a remoção da instância
    }
}

// Destrói todas as Girafas em campo
if (instance_exists(obj_zumbi_girafa)) {
    with (obj_zumbi_girafa) {
        if (variable_instance_exists(id, "hp")) hp = 0;
        if (variable_instance_exists(id, "pd")) pd = 0;
        
        instance_destroy(); // Força a remoção da instância
    }
}