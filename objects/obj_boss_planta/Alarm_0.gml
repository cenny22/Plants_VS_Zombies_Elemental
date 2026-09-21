if (derrotado) exit;

// Sorteia uma das 4 habilidades (0 a 3)
var mecnica = irandom(3);

switch (mecnica) {
    // ------------------------------------------------------
    // MECÂNICA 1: Gerar 5 obj_zumbi_girafa (uma em cada fileira)
    // ------------------------------------------------------
    case 0:
        if (asset_get_index("obj_zumbi_girafa") != -1) {
            for (var i = 0; i < 5; i++) {
                var girafa = instance_create_layer(posicao_spawn_x, fileiras_y[i], "Instances", obj_zumbi_girafa);
                
                // Trava o movimento da girafa
                girafa.parado = true;
                girafa.speed = 0;
                girafa.vel = 0;
                if (variable_instance_exists(girafa, "hspd")) girafa.hspd = 0;
            }
            // Agenda a destruição em 15 segundos no Alarm 2
            alarm[2] = game_get_speed(gamespeed_fps) * 15;
        }
        break;

    // ------------------------------------------------------
    // MECÂNICA 2: Gerar 5 obj_zumcare com +500 PD
    // ------------------------------------------------------
    case 1:
        if (asset_get_index("obj_zumcare") != -1) {
            for (var i = 0; i < 5; i++) {
                var zum = instance_create_layer(posicao_spawn_x, fileiras_y[i], "Instances", obj_zumcare);
                
                // Aplica a vida/PD extra
                if (variable_instance_exists(zum, "pd")) {
                    zum.pd += 500;
                } else if (variable_instance_exists(zum, "hp")) {
                    zum.hp += 500;
                }

                // Trava o movimento do zumcare
                zum.parado = true;
                zum.speed = 0;
                zum.vel = 0;
                if (variable_instance_exists(zum, "hspd")) zum.hspd = 0;
            }
            // Agenda a destruição em 15 segundos no Alarm 2
            alarm[2] = game_get_speed(gamespeed_fps) * 15;
        }
        break;

    // ------------------------------------------------------
    // MECÂNICA 3: Mudar de fileira Y
    // ------------------------------------------------------
    case 2:
        y = fileiras_y[irandom(4)];
        break;

    // ------------------------------------------------------
    // MECÂNICA 4: Gerar cova_sono em quadrado_grid aleatório
    // ------------------------------------------------------
    case 3:
        var qtd_quadrados = instance_number(obj_quadrado_grid);
        if (qtd_quadrados > 0 && asset_get_index("obj_cova_sono") != -1) {
            var q_sorteado = instance_find(obj_quadrado_grid, irandom(qtd_quadrados - 1));
            instance_create_layer(q_sorteado.x, q_sorteado.y, "Instances", obj_cova_sono);
        }
        break;
}

// Reinicia o temporizador de habilidades para 15 segundos
alarm[0] = game_get_speed(gamespeed_fps) * 15;