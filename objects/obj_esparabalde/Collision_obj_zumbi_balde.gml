// Transforma o zumbi de cone em zumbi básico sem disparar o Destroy
with (other) {
    instance_change(obj_zumbi_basico, true); 
}

// A Esparabalde se destrói imediatamente após roubar o cone
instance_destroy();