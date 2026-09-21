// 1. Desliga o estado de jogo iniciado
global.fase_iniciada = false;

// 2. Desliga os alarmes dos controladores (evita que continuem rodando na tela de Game Over)
if (instance_exists(obj_controlador_fase4)) { obj_controlador_fase4.alarm[1] = -1; }
if (instance_exists(obj_controlador_fase3)) { obj_controlador_fase3.alarm[1] = -1; }
// Adicione as outras fases se elas usarem controladores com nomes diferentes (ex: obj_controlador_fase2)

// 3. TELEPORTE DE SEGURANÇA: Se a sala existir, vai para ela. Se não, avisa para não crashar.
if (room_exists(Room_gameover)) {
    room_goto(Room_gameover);
} else {
    show_message("Game Over! (Verifique se o nome da sua sala é exatamente 'Room_gameover' no Asset Browser)");
}