// Aplica 40 de dano no zumbi atingido
if (instance_exists(other)) {
    other.hp -= dano;
}

// Destrói o espinho ao acertar o zumbi
other.pisk = 10;
other.con = +0.25
instance_destroy();