function scr_spawn_zumbi_tipo(array_zumbis)
{
    if (instance_exists(obj_quadrado_grid)) 
    {
        var quadrado_sorteado = noone;
        var yy = 0;
        var y_limite_cenario = 150; 
        
        var tentativas = 0;
        while (tentativas < 100) {
            quadrado_sorteado = instance_find(obj_quadrado_grid, irandom(instance_number(obj_quadrado_grid) - 1));
            yy = quadrado_sorteado.y;
            if (yy >= y_limite_cenario) break;
            tentativas++;
        }
        
        var x_nascimento = 1500; 
        var tipo_sorteado = array_zumbis[irandom(array_length(array_zumbis) - 1)];
        
        instance_create_layer(x_nascimento, yy, "Instances", tipo_sorteado);
    }
}