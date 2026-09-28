with(obj_dave)
{
	instance_destroy(obj_dave);
	instance_destroy(obj_penny);	
}
#region OBJ_DIALOGO — CLEAN UP

// Para o som de voz se ainda estiver tocando
if (som_voz_atual != noone && audio_is_playing(som_voz_atual))
{
    audio_stop_sound(som_voz_atual);
}

// Retoma todas as músicas de fundo do jogo
if (som_voz_atual != noone && audio_is_playing(som_voz_atual))
{
    audio_stop_sound(som_voz_atual);
}

// Despausa as músicas
audio_resume_sound(F_planta);
audio_resume_sound(Menu);
audio_resume_sound(Esteira);
audio_resume_sound(boss);

#endregion