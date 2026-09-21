if (global.fase_iniciada) {
    if (instance_exists(obj_quadrado_grid)) {
        
        var quadrado_sorteado = noone;
        var yy = 0;
        
        // CORREÇÃO: Define a altura limite onde o cenário termina e o jogo REALMENTE começa.
        // Exemplo: Se o seu cenário de cima vai até o pixel 150, mude o número abaixo para 150.
        var y_limite_cenario = 150; 
        
        // Faz um sorteio repetido até achar um quadrado que esteja ABAIXO do cenário
        var tentativas = 0;
        while (tentativas < 100) {
            quadrado_sorteado = instance_find(obj_quadrado_grid, irandom(instance_number(obj_quadrado_grid) - 1));
            yy = quadrado_sorteado.y;
            
            // Se o Y do quadrado for maior que o limite do cenário, ele é válido!
            if (yy >= y_limite_cenario) {
                break; // Sai do looping porque achou um quadrado bom
            }
            tentativas++;
        }
        
        // DEFINE O X FIXO NA DIREITA (Onde o mapa termina na direita)
        var x_nascimento = 1500; 
        
        // Cria o zumbi na linha perfeita e fora do cenário de cima
        instance_create_layer(x_nascimento, yy, "Instances", obj_zumbi_basico);
    }
}

// Ritmo original da Fase 1
alarm[1] = room_speed * irandom_range(8, 15);