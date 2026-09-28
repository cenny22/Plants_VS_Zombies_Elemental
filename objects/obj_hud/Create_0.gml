pode_nome_em_cima = false;

nome_mapa = "Mata dos Bixos";

aplicar_hud = function()
{
	if (room == Room_fases_planta)
	{
		pode_nome_em_cima = true
	}
	else
	{
		pode_nome_em_cima = false;	
	}
}