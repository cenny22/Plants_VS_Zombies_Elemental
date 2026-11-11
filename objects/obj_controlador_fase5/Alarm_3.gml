#region ALARM 3 — SPAWN DOS 2 GALINHEIROS AOS 23 SEGUNDOS

if (global.fase_iniciada)
{
    // Supondo que você tenha uma função de spawn por fileira ou coordenadas Y fixas das fileiras:
    // Exemplo usando posições Y diretas das fileiras 2 e 4 (ajuste os valores de Y para o seu grid):
    
    var pos_x = room_width + 50; // Nasce na borda direita da tela
    
    // Altura da 2ª Fileira (substitua pelo Y exato da sua fileira 2)
    var y_fileira2 = 300; 
    // Altura da 4ª Fileira (substitua pelo Y exato da sua fileira 4)
    var y_fileira4 = 558; 

    // Cria o primeiro galinheiro na 2ª fileira
    instance_create_layer(pos_x, y_fileira2, "Instances", obj_zumbi_galinheiro);
    
    // Cria o segundo galinheiro na 4ª fileira ao mesmo tempo
    instance_create_layer(pos_x, y_fileira4, "Instances", obj_zumbi_galinheiro);
}

#endregion