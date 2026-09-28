#region
// ============================================================
// ESTADO INICIAL
// ============================================================

estado = "entrando";


// ============================================================
// MÁQUINA DE ESTADOS
// ============================================================

maquinaestados = function()
{
    switch (estado)
    {
        case "entrando":

            sprite_index = Spr_dave_1;

            hspeed = 1;


            if (x >= 500)
            {
                x = 500;
                hspeed = 0;

                estado = "conversando";
            }

        break;


        case "conversando":

            sprite_index = Spr_dave;

            hspeed = 0;

        break;
    }
};
#endregion