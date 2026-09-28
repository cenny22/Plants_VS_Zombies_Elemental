#region OBJ_DIALOGO — GLOBAL LEFT PRESSED

if (!dialogo_ativo)
{
    exit;
}

// Interrompe o som atual no clique
if (som_voz_atual != noone && audio_is_playing(som_voz_atual))
{
    audio_stop_sound(som_voz_atual);
}

var dados = texto[indice_texto];
var fala = dados.fala;
var tamanho_fala = string_length(fala);

if (!pode_avancar)
{
    contador_texto = tamanho_fala;
    texto_atual = fala;
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
    som_iniciado = false; // Libera para sortear o tempo na próxima fala
}

#endregion