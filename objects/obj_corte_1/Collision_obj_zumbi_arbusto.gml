// Só causa dano e se destrói se o zumbi estiver comendo (fora da moita)
if (other.estado == "comendo") {
    other.hp -= dano; // Causa os 60 de dano
	other.con = +0.25
	other.pisk = 10;
}
// Se estiver "andando", a lâmina passa direto e continua até atingir os 2 blocos ou outro alvo