tipo = ""; 
sprite_index = Sprite39;
// Se a variável de bloqueio ainda não existir, cria como falsa
if (!variable_global_exists("fase2_desbloqueada")) {
    global.fase2_desbloqueada = false;
}

// GARANTE QUE A LISTA DE PLANTAS EXISTA ANTES DE ENTRAR EM QUALQUER FASE
if (!variable_global_exists("plantas_escolhidas")) {
    global.plantas_escolhidas = ds_list_create();
}

global.cro = 0