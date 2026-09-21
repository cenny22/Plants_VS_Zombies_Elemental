// Causa 60 de dano na planta atingida
with (other) {
    other.levar_dano(60);
}

// Destrói a ervilha ao colidir
other.pisk = 10;
instance_destroy();