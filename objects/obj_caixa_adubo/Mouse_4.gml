#region OBJ_ADUBO — LEFT PRESSED

// Se global.adubos for 0, nada acontece
if (global.adubos <= 0)
{
    exit;
}

// Se já estiver selecionado, desseleciona
if (global.adubo_selecionado)
{
    global.adubo_selecionado = false;
}
// Se tiver 1 ou mais adubos e não estiver selecionado, seleciona
else
{
    global.adubo_selecionado = true;
}

#endregion