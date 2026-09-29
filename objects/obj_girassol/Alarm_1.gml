#region OBJ_GIRASSOL — ALARM 1



if (sols_para_gerar > 0)

{

    // Ativa o pisca amarelo a cada sol gerado

    pisca_sol = 30;



    // Criar o sol do girassol

    var sol = instance_create_layer(

        x + 15 + irandom_range(-10, 10),

        y + irandom_range(-5, 5),

        "Instances",

        obj_sol

    );



    // Configurações do Sol do Girassol

    sol.sol_do_girassol = true;

    sol.altura_subida = 25;

    sol.velocidade_sol = 1.2;

    sol.y_inicial = sol.y;

    sol.fase_movimento = 0;



    sols_para_gerar--;



    // Se ainda restarem sóis da rajada, reagenda este alarm

    if (sols_para_gerar > 0)

    {

        alarm[1] = tempo_entre_sols;

    }

}



#endregion 

