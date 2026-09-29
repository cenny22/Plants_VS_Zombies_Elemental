#region OBJ_ZUMBI_PARENT — DESTROY

// ============================================================
// 1. CONTADOR GLOBAL DE MORTES
// Não conta se for galinha OU se foi destruído pelo carrinho
// ============================================================
if (object_index != obj_zumbi_galinha && destruido_por_carrinho == false)
{
    if (!variable_global_exists("zumbis_mortos"))
    {
        global.zumbis_mortos = 0;
    }

    global.zumbis_mortos += 1;
}

// ============================================================
// 2. DROP DO ADUBO AO MORRER
// Funciona mesmo se for morto pelo carrinho!
// ============================================================
if (variable_instance_exists(id, "tem_adubo") && tem_adubo == true)
{
    instance_create_layer(x, y, "Instances", obj_adubo);
}

#endregion