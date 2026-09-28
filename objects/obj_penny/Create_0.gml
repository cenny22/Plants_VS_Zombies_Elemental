depth = -9999;
#region CONFIGURAÇÕES E ESTADO INICIAL

estado = "entrando";
visible = true; // Garante que começa visível

#endregion

#region MÁQUINA DE ESTADOS

maquinaestados = function()
{
    switch (estado)
    {
        case "entrando":
            sprite_index = Spr_d_penny;
            
            // Move para a esquerda
            hspeed = -20;

            // Supondo que o ponto de parada desejado na tela seja x = 200 (ajuste como preferir)
            // Usamos <= porque o 'x' está DIMINUINDO conforme ela anda para a esquerda
            if (x <= 1000)
            {
                x = 1000; // Trava na posição exata
                estado = "conversando";
            }
        break;

        case "conversando":
            sprite_index = Spr_d_penny;
            hspeed = 0; // Para de mover
        break;
    }
};

visibilidade = function()
{
    // A Penny só fica visível ENQUANTO a fase NÃO começou
    if (variable_global_exists("fase_iniciada") && global.fase_iniciada)
    {
        visible = false;
    }
    else
    {
        visible = true;    
    }
};

#endregion