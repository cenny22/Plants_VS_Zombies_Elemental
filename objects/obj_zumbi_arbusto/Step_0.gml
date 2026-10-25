// ====================================================================
// 1. INTERAÇÃO ESPECIAL COM ERVA-ESPINHO (MORTE MÚTUA)
// ====================================================================
var espinho_tocado = instance_place(x, y, obj_ervaespinho);

if (espinho_tocado != noone) {
    // Destrói a erva-espinho primeiro
    with (espinho_tocado) {
        instance_destroy();
    }
    
    // Tocou, o zumbi também morre
    instance_destroy();
    
    // Atualiza o placar de kills global
    global.zumbis_mortos += 1;
    
    exit; // Para o código aqui para não processar o resto
}


// ====================================================================
// 2. LÓGICA DE MOVIMENTO E ATAQUE
// ====================================================================
// Verifica se há uma planta à frente para comer
var planta_frente = instance_place(x - 5, y, obj_planta_parent);

if (planta_frente != noone) {
    // TEM PLANTA NA FRENTE! Ele para e começa a comer
    if (estado == "andando") {
        estado = "comendo";
        velocidade_atual = 0; // Para de andar
        atacadoread = planta_frente; // Define o alvo do ataque
        danos_timer = 0; // Reseta o timer de dano
        
        y = planta_frente.y; 
        x = planta_frente.x + 40; 
        
        if (sprite_exists(spr_zumbi_arbusto_comendo)) {
            sprite_index = spr_zumbi_arbusto_comendo;
            image_index = 0; 
            image_speed = 1;  
        }
    }
} else {
    // NÃO TEM PLANTA NA FRENTE. Ele continua andando (ou volta a andar)
    if (estado == "comendo") {
        estado = "andando";
        velocidade_atual = vel_padrao; // Volta a andar
        atacadoread = noone; // Limpa o alvo
        
        if (sprite_exists(spr_zumbi_arbusto_andando)) {
            sprite_index = spr_zumbi_arbusto_andando;
            image_speed = 1; 
        }
    }
}

// LÓGICA DE DANO (enquanto come)
if (estado == "comendo" && instance_exists(atacadoread)) {
    danos_timer++;
    
    if (danos_timer >= room_speed) { 
        atacadoread.hp -= 100; 
        danos_timer = 0;        
    }
}

// ====================================================================
// 3. MOVIMENTAÇÃO CONTÍNUA
// ====================================================================
if (!paralisado) {
    x += velocidade_atual;
}

// ====================================================================
// 4. LÓGICA DE PARALISIA
// ====================================================================
if (paralisado) {
    velocidade_atual = 0; 
    tempo_paralisado -= 1; 
    
    if (tempo_paralisado <= 0) {
        paralisado = false;
        velocidade_atual = velocidade_salva; 
    }
}

// ====================================================================
// 5. CONDIÇÃO DE GAME OVER
// ====================================================================
if (x <= 50) { 
    room_goto(Room_gameover); 
}