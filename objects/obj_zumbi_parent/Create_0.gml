hp = 100;
vel = -0.3;
atacadoread = noone;

con = 0;
con_timer = 0;

danos_timer = 0;

// ============================================================
// PARALISIA
// ============================================================

paralisado = false;
tempo_paralisado = 0;
velocidade_salva = vel;

// ============================================================
// FOGO
// ============================================================

fogo = false;
fogo_timer = 0;

// ============================================================
// PARTÍCULAS DO FOGO
// ============================================================

fogo_particulas = [];

for (var i = 0; i < 8; i++)
{
    fogo_particulas[i] = {
        x: random_range(-sprite_width * 0.35, sprite_width * 0.35),
        y: random_range(-sprite_height * 0.5, -sprite_height * 0.25),
        velocidade: random_range(0.3, 0.7),
        tamanho: random_range(3, 6),
        vida: random_range(20, 45)
    };
}

pisk = 0;