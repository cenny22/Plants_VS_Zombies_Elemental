var camada_atual = layer;

// Encontra o bloco de grid onde o galinheiro está pisando agora
var meu_bloco = instance_nearest(x, y, obj_quadrado_grid);

// Configuração do espaçamento das fileiras (Y) e das galinhas (X)
var espacamento_y = 80; // Distância vertical entre as fileiras
var espacamento_x = 24; // Distância horizontal entre cada uma das 5 galinhas

if (meu_bloco != noone) {
    var y_meio = meu_bloco.y; 

    // Lista com as 3 fileiras (Cima, Meio, Baixo)
    var fileiras = [y_meio - espacamento_y, y_meio, y_meio + espacamento_y];

    // Loop pelas 3 fileiras
    for (var f = 0; f < 3; f++) {
        var pos_y = fileiras[f];
        
        // Cria 5 galinhas por fileira, lado a lado no eixo X
        for (var i = 0; i < 5; i++) {
            var pos_x = x + (i * espacamento_x);
            instance_create_layer(pos_x, pos_y, camada_atual, obj_zumbi_galinha);
        }
    }
} else {
    // Código de segurança caso esteja fora do grid
    var fileiras_seguranca = [y - 64, y, y + 64];
    
    for (var f = 0; f < 3; f++) {
        var pos_y = fileiras_seguranca[f];
        for (var i = 0; i < 5; i++) {
            var pos_x = x + (i * espacamento_x);
            instance_create_layer(pos_x, pos_y, camada_atual, obj_zumbi_galinha);
        }
    }
}