// Raio da área ao redor da cova onde NENHUMA planta pode sobreviver (em pixels)
raio_aura = 120; // Ajuste para cobrir os quadrados do grid ao redor

// Transparência da aura roxa para o efeito visual de iluminação
alpha_aura = 0.35;

// Executa a checagem a cada 0.1 segundo (evita checar a cada frame sem necessidade)
alarm[0] = game_get_speed(gamespeed_fps) * 0.1;