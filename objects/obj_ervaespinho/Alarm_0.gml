#region OBJ_ERVA_ESPINHO — ALARM 0

// Usa instance_place_list para causar dano em TODOS os zumbis acumulados no mesmo bloco
var lista_zumbis = ds_list_create();
var total_zumbis = instance_place_list(x, y, obj_zumbi_parent, lista_zumbis, false);

if (total_zumbis > 0)
{
    for (var i = 0; i < total_zumbis; i++)
    {
        var zumbi = lista_zumbis[| i];
        
        if (variable_instance_exists(zumbi, "hp"))
        {
            // Se o adubo estiver ativo, causa dano extra de área (ex: 50 de dano)
            var dano = (duracao_adubo > 0) ? 50 : 20;
            zumbi.hp -= dano;

            if (zumbi.hp <= 0)
            {
                with (zumbi)
                {
                    instance_destroy();
                }
            }
        }
    }
}

ds_list_destroy(lista_zumbis);

// Reseta o alarme para continuar o dano a cada segundo
alarm[0] = game_get_speed(gamespeed_fps);

#endregion