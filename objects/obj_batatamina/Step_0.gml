#region OBJ_BATATAMINA — STEP

event_inherited();

// ==========================================
// CHECAGEM DO ADUBO
// ==========================================

if (adubo_ativado)
{
    adubo_ativado = false; // Reseta a flag para evitar looping
    
    // A batata-mina atual arma imediatamente
    esta_carregada = true;
    sprite_index = spr_batata_mina_charged;

    // 1. Criar uma lista com todos os grids da sala
    var lista_grids = ds_list_create();
    var total_grids = instance_number(obj_quadrado_grid);

    for (var i = 0; i < total_grids; i++)
    {
        var inst_grid = instance_find(obj_quadrado_grid, i);
        
        // Verifica se NÃO há outra batata-mina no bloco usando o nome correto: obj_batatamina
        if (!position_meeting(inst_grid.x, inst_grid.y, obj_batatamina))
        {
            ds_list_add(lista_grids, inst_grid);
        }
    }

    // 2. Embaralhar a lista de grids livres
    ds_list_shuffle(lista_grids);

    // 3. Escolher até 6 grids da lista
    var quantidade_para_gerar = min(6, ds_list_size(lista_grids));

    for (var j = 0; j < quantidade_para_gerar; j++)
    {
        var grid_sorteado = lista_grids[| j];

        // Cria a nova batata-mina no centro do grid sorteado
        var nova_batata = instance_create_layer(
            grid_sorteado.x,
            grid_sorteado.y,
            "Instances",
            obj_batatamina
        );

        // A nova batata já nasce totalmente armada
        nova_batata.esta_carregada = true;
        nova_batata.sprite_index = spr_batata_mina_charged;
    }

    // 4. Limpar a lista da memória
    ds_list_destroy(lista_grids);
}

#endregion