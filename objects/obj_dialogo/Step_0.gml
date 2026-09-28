#region
// ============================================================
// OBJ_DIALOGO — STEP
// ============================================================

if (!dialogo_ativo)
{
    exit;
}


// ============================================================
// VERIFICAR TEXTO ATUAL
// ============================================================

var dados =
    texto[indice_texto];


// ============================================================
// PERSONAGEM
// ============================================================

personagem_atual =
    dados.personagem;


// ============================================================
// TEXTO COMPLETO
// ============================================================

var fala =
    dados.fala;


// ============================================================
// DIGITAÇÃO
// ============================================================

contador_texto += velocidade_texto;


var quantidade_letras =
    floor(contador_texto);


if (quantidade_letras >= string_length(fala))
{
    quantidade_letras =
        string_length(fala);

    pode_avancar = true;
}
else
{
    pode_avancar = false;
}


texto_atual =
    string_copy(
        fala,
        1,
        quantidade_letras
    );


// ============================================================
// AVANÇAR COM E
// ============================================================

if (keyboard_check_pressed(ord("E")))
{
    // Se ainda está digitando,
    // mostra tudo imediatamente.

    if (!pode_avancar)
    {
        contador_texto =
            string_length(fala);

        texto_atual =
            fala;

        pode_avancar = true;
    }
    else
    {
        indice_texto++;

        if (indice_texto >= array_length(texto))
        {
            dialogo_ativo = false;
            instance_destroy();

            exit;
        }

        contador_texto = 0;

        texto_atual = "";

        pode_avancar = false;
    }
}

#endregion