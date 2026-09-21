// 1. Sorteia uma planta da lista ponderada
var indice_sorteado = irandom(array_length(plantas_fase15) - 1);
var planta_sorteada = plantas_fase15[indice_sorteado];

// 2. Cria o pacote no topo da esteira
var novo_pacote = instance_create_layer(x, y, "Instances", obj_pacote_esteira);

// 3. Define qual planta esse pacote carrega
novo_pacote.planta_tipo = planta_sorteada;

// 4. Reagenda o próximo pacote usando a taxa de FPS correta
alarm[0] = game_get_speed(gamespeed_fps) * tempo_spawn;