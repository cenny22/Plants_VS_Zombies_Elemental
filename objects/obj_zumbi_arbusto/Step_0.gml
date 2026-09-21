// ====================================================================
// 1. INTERAÇÃO ESPECIAL COM ERVA-ESPINHO (MORTE INSTANTÂNEA)
// ====================================================================
// Verifica se ele tocou em alguma Erva-Espinho
var espinho_tocado = instance_place(x, y, obj_ervaespinho);

if (espinho_tocado != noone) {
    // Tocou, morreu. Sem choro.
    instance_destroy();
    
    // Avisa o controlador da fase (ajuste para o controlador da sua fase atual)
    if (instance_exists(obj_controlador_fase4)) {
        obj_controlador_fase4.zumbis_mortos += 1;
    }
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
        speed = 0; // Para de andar
        atacadoread = planta_frente; // Define o alvo do ataque
        danos_timer = 0; // Reseta o timer de dano
        
        // CORREÇÃO DE COORDENADA: Garante que ele fique perfeitamente alinhado na fileira (Y)
        // E fixa a distância X ideal da planta para ele não dar o "pulo"
        y = planta_frente.y; 
        x = planta_frente.x + 40; // Ajuste o "+ 40" para a distância visual perfeita da mordida
        
        // MUDANÇA VISUAL: Muda para o sprite dele comendo
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
        speed = vel_padrao; // Volta a andar
        atacadoread = noone; // Limpa o alvo
        
        // MUDANÇA VISUAL: Volta para o sprite dele andando (o arbusto)
        if (sprite_exists(spr_zumbi_arbusto_andando)) {
            sprite_index = spr_zumbi_arbusto_andando;
            image_speed = 1; // Garante que a animação continue
        }
    }
}

// LÓGICA DE DANO (enquanto come)
if (estado == "comendo" && instance_exists(atacadoread)) {
    danos_timer++;
    
    // Desfere 1 ataque a cada 1 segundo (baseado na velocidade da sala)
    if (danos_timer >= room_speed) { 
        atacadoread.hp -= 100; // Tira 100 de vida da planta
        danos_timer = 0;       // Reseta o cronômetro do dano
    }
}


// ====================================================================
// 3. CONDIÇÃO DE GAME OVER
// ====================================================================
// Se o zumbi passar do limite esquerdo da tela (chegar na casa)
if (x <= 50) { 
    room_goto(Room_gameover); // Leva o jogador para a tela de derrota
}
// ====================================================================
// LÓGICA DE PARALISIA
// ====================================================================
if (paralisado) {
    velocidade_atual = 0; // Garante que o zumbi continue parado
    
    tempo_paralisado -= 1; // Decrementa 1 frame a cada Step
    
    // Quando os 10 segundos acabarem
    if (tempo_paralisado <= 0) {
        paralisado = false;
        velocidade_atual = velocidade_salva; // Devolve a velocidade normal ao zumbi
    }
}