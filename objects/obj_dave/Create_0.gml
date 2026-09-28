depth = -9999;
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

            sprite_index = Spr_dave;

            hspeed = 20;


            if (x >= -40)
            {
                estado = "conversando";
            }

        break;


        case "conversando":

            sprite_index = Spr_dave;
			
            hspeed = 0;

        break;
    }
};

visibilidade = function()
{
	if (global.fase_iniciada)
	{
		visible = false;
	}
	else
	{
		visible = true;	
	}
}
#endregion