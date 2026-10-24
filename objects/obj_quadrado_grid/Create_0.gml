// ============================================================
// OBJ_QUADRADO_GRID — CREATE
// ============================================================

// ============================================================
// CONTROLE DE OCUPAÇÃO
// ============================================================

// FALSE = quadrado livre
// TRUE  = quadrado possui uma planta
ocupado = false;

// ============================================================
// SISTEMA DE TOLERÂNCIA DE COOLDOWN (0.2 SEGUNDOS)
// ============================================================
planta_recente_id = noone;       // Guarda o ID da instância criada
planta_recente_dados = undefined; // Guarda as informações da planta (recarga, etc.)
planta_recente_barra = noone;     // Guarda qual slot da barra foi usado
timer_cooldown_pendente = -1;     // Timer em frames (0.2 segundos)

// ============================================================
// AVISO DE SÓIS
// ============================================================
aviso_sois = "";
global.aviso_sois_timer = 0;