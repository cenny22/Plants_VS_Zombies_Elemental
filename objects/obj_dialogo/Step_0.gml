#region OBJ_DIALOGO — STEP

if (!dialogo_ativo)
{
    exit;
}

// ============================================================
// VERIFICAR TEXTO E PERSONAGEM ATUAL
// ============================================================

var dados = texto[indice_texto];
personagem_atual = dados.personagem;

// ============================================================
// SELEÇÃO E SORTEIO DO TEMPO INICIAL DO ÁUDIO
// ============================================================

if (!som_iniciado)
{
    var tempo_inicio = 0;

    if (personagem_atual == "penny")
    {
        som_voz_atual = Penny;
        
        // Tempos possíveis da Penny: 0.00s, 4.00s, 10.50s e 12.63s
        var tempos_penny = [0.00, 4.00, 10.50, 12.63];
        tempo_inicio = tempos_penny[irandom(array_length(tempos_penny) - 1)];
    }
    else if (personagem_atual == "dave")
    {
        som_voz_atual = Dave;
        
        // Tempos possíveis do Dave: 0.00s, 2.20s, 6.18s e 60.00s
        var tempos_dave = [0.00, 2.20, 6.18, 60.00];
        tempo_inicio = tempos_dave[irandom(array_length(tempos_dave) - 1)];
    }

    if (som_voz_atual != noone)
    {
        // Garante que se havia outro som tocando, ele pare antes
        audio_stop_sound(som_voz_atual);

        // Inicia o áudio em loop
        var inst_som = audio_play_sound(som_voz_atual, 1, true);

        // Define a posição exata de início em segundos no áudio que acabou de começar
        audio_sound_set_track_position(inst_som, tempo_inicio);
    }

    som_iniciado = true; // Marca como iniciado para não sortear a cada frame
}

// ============================================================
// DIGITAÇÃO DO TEXTO
// ============================================================

var fala = dados.fala;
var tamanho_fala = string_length(fala);

if (contador_texto < tamanho_fala)
{
    contador_texto += velocidade_texto;
    pode_avancar = false;
}
else
{
    contador_texto = tamanho_fala;
    pode_avancar = true;
}

// Atualiza o texto na tela
var quantidade_letras = floor(contador_texto);
texto_atual = string_copy(fala, 1, quantidade_letras);

// ============================================================
// AVANÇAR COM A TECLA "E"
// ============================================================

if (keyboard_check_pressed(ord("E")))
{
    if (som_voz_atual != noone && audio_is_playing(som_voz_atual))
    {
        audio_stop_sound(som_voz_atual);
    }

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
        som_iniciado = false; // Libera para sortear o tempo da próxima fala
    }
}

#endregion