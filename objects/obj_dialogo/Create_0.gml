#region OBJ_DIALOGO — CREATE

// ============================================================
// INICIAR DIÁLOGO
// ============================================================

scr_dialogo();

// ============================================================
// CONTROLE
// ============================================================

dialogo_ativo = true;
indice_texto = 0;

// ============================================================
// TEXTO SENDO DIGITADO
// ============================================================

texto_atual = "";
velocidade_texto = 2;
contador_texto = 0;

// ============================================================
// CONTROLE DO PERSONAGEM, VOZ E SORTEIO DE TEMPO
// ============================================================

personagem_atual = "";
som_voz_atual = noone;
som_iniciado = false; // Garante que o sorteio só ocorra 1x por fala

// ============================================================
// AVANÇAR
// ============================================================

pode_avancar = false;

// Pausa as músicas de fundo do jogo
audio_pause_all();

#endregion