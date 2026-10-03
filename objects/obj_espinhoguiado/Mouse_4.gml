#region
// ============================================================
// PÁ
// ============================================================

if (global.pa_selecionada == true)
{
    global.pa_selecionada = false;

    instance_destroy();
}

// ============================================================
// ADUBO
// ============================================================

if (global.adubo_selecionado == true)
{
    global.adubo_selecionado = false;

    global.adubos--;

    // Ativa o adubo
    adubo_ativado = true;

    // Permite um novo disparo
    adubo_disparado = false;
}

#endregion