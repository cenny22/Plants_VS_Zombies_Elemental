event_inherited(); 

#region OBJ_TRIPLERVILHA — ADUBO

if (adubo_ativado)
{
    // ========================================================
    // INICIA UMA GRANDE RAJADA
    // ========================================================

    ervilhas_rajada = 60;

    // Começa imediatamente
    alarm[2] = 1;

    // Impede outro disparo enquanto a rajada acontece
    pode_atirar = false;

    // Desativa o gatilho para não reiniciar todo frame
    adubo_ativado = false;
}

#endregion
var margem_altura = 16; 
var distancia_fileira = 100;
// ====================================================================
// DETECÇÃO NAS 3 FILEIRAS
// ====================================================================

// 1. Linha de CIMA (y - distancia_fileira)
var zumbi_cima = collision_rectangle(x, (y - distancia_fileira) - margem_altura, room_width, (y - distancia_fileira) + margem_altura, obj_zumbi_parent, false, true);
var arbusto_cima = collision_rectangle(x, (y - distancia_fileira) - margem_altura, room_width, (y - distancia_fileira) + margem_altura, obj_zumbi_arbusto, false, true);

// 2. Linha do MEIO / ATUAL (y)
var zumbi_meio = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_parent, false, true);
var arbusto_meio = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_arbusto, false, true);

// 3. Linha de BAIXO (y + distancia_fileira) — CORRIGIDO AQUI: obj_zumbi_arbusto
var zumbi_baixo = collision_rectangle(x, (y + distancia_fileira) - margem_altura, room_width, (y + distancia_fileira) + margem_altura, obj_zumbi_parent, false, true);
var arbusto_baixo = collision_rectangle(x, (y + distancia_fileira) - margem_altura, room_width, (y + distancia_fileira) + margem_altura, obj_zumbi_arbusto, false, true);


// Verifica se há pelo menos um alvo válido em qualquer uma das três linhas
zumbi_na_linha = false;

// Checagem da fileira de CIMA
if (zumbi_cima != noone || (arbusto_cima != noone && arbusto_cima.estado == "comendo")) {
    zumbi_na_linha = true;
}

// Checagem da fileira do MEIO
if (zumbi_meio != noone || (arbusto_meio != noone && arbusto_meio.estado == "comendo")) {
    zumbi_na_linha = true;
}

// Checagem da fileira de BAIXO
if (zumbi_baixo != noone || (arbusto_baixo != noone && arbusto_baixo.estado == "comendo")) {
    zumbi_na_linha = true;
}


// ====================================================================
// EXECUÇÃO DO DISPARO TRIPLO
// ====================================================================
if (zumbi_na_linha && pode_atirar) {
    // Tiro da fileira de CIMA
    instance_create_layer(x + 20, y - distancia_fileira, "Instances", obj_ervilha_fogo);
    
    // Tiro da fileira do MEIO (Atual)
    instance_create_layer(x + 20, y, "Instances", obj_ervilha_fogo);
    
    // Tiro da fileira de BAIXO
    instance_create_layer(x + 20, y + distancia_fileira, "Instances", obj_ervilha_fogo);
    
    pode_atirar = false;
    alarm[0] = game_get_speed(gamespeed_fps) * 1.5;
}

#region
// ============================================================
// ADUBO ATIVADO — RAJADA DE ERVILHAS EM 3 LINHAS
// ============================================================

if (adubo_ativado)
{

    // ========================================================
    // QUANTIDADE DE ERVILHAS
    // ========================================================

    var quantidade_ervilhas = 8;


    // ========================================================
    // ESPAÇAMENTO ENTRE AS ERVILHAS
    // ========================================================

    var espacamento_ervilha = 25;


    // ========================================================
    // LINHA DE CIMA
    // ========================================================

    for (var i = 0; i < quantidade_ervilhas; i++)
    {
        var ervilha_cima =
            instance_create_layer(
                x + 20 - (i * espacamento_ervilha),
                y - distancia_fileira,
                "Instances",
                obj_ervilha
            );

        ervilha_cima.direction = 0;
    }


    // ========================================================
    // LINHA DO MEIO
    // ========================================================

    for (var i = 0; i < quantidade_ervilhas; i++)
    {
        var ervilha_meio =
            instance_create_layer(
                x + 20 - (i * espacamento_ervilha),
                y,
                "Instances",
                obj_ervilha
            );

        ervilha_meio.direction = 0;
    }


    // ========================================================
    // LINHA DE BAIXO
    // ========================================================

    for (var i = 0; i < quantidade_ervilhas; i++)
    {
        var ervilha_baixo =
            instance_create_layer(
                x + 20 - (i * espacamento_ervilha),
                y + distancia_fileira,
                "Instances",
                obj_ervilha
            );

        ervilha_baixo.direction = 0;
    }


    // ========================================================
    // FINALIZA O ADUBO
    // ========================================================

    adubo_ativado = false;


    // ========================================================
    // SPRITE DE ADUBO
    // ========================================================

    //sprite_index = spr_espinhoguiado_adubo;


    // ========================================================
    // VOLTA AO NORMAL DEPOIS DE 1,2 SEGUNDOS
    // ========================================================

    //alarm[1] =
       // game_get_speed(gamespeed_fps) * 1.2;
}

#endregion