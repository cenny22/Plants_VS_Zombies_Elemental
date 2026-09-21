// Causa 60 de dano na planta atingida
with (other) {
    hp -= 60;
}

// Destrói a ervilha ao colidir
other.pisk = 10;
instance_destroy();