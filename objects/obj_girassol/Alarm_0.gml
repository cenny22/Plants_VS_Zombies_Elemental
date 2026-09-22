// ============================================================
// GIRASSOL — CRIAÇÃO DO SOL
// ============================================================

if (global.fase_iniciada)
{
	// ============================================================
// EFEITO VISUAL
// ============================================================

pisca_sol = 100;
    var sol = instance_create_layer(
        x + 15,
        y,
        "Instances",
        obj_sol
    );

    // ========================================================
    // CONFIGURA O SOL COMO SOL DO GIRASSOL
    // ========================================================

    sol.sol_do_girassol = true;

    sol.altura_subida = 25;
    sol.velocidade_sol = 1.2;

    sol.y_inicial = sol.y;
    sol.fase_movimento = 0;
}

// Próximo sol em 22 segundos
alarm[0] = room_speed * 22;