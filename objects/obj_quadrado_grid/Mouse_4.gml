// ============================================================
// OBJ_QUADRADO_GRID — LEFT PRESSED
// PLANTAR A PLANTA SELECIONADA (PERMITE MÚLTIPLAS PLANTAS)
// ============================================================

if (!variable_global_exists("planta_selecionada"))
{
    exit;
}

if (global.planta_selecionada == noone)
{
    exit;
}

// ============================================================
// OBJETO DA PLANTA
// ============================================================

var objeto_planta = global.planta_selecionada;

if (!object_exists(objeto_planta))
{
    exit;
}

// ============================================================
// DESCOBRIR QUAL PLANTA É
// ============================================================

var dados = planta_obter_por_objeto(objeto_planta);

if (is_undefined(dados))
{
    exit;
}

// ============================================================
// VERIFICAR SÓIS NOVAMENTE
// ============================================================

if (!variable_global_exists("sois"))
{
    exit;
}

if (global.sois < dados.custo)
{
    exit;
}

// ============================================================
// CRIAR A PLANTA
// ============================================================

var planta_criada = instance_create_layer(
    x,
    y,
    "Instances",
    objeto_planta
);

if (planta_criada == noone)
{
    exit;
}

// ============================================================
// DESCONTAR SÓIS IMEDIATAMENTE (COMO JÁ ERA ANTES)
// ============================================================
global.sois -= dados.custo;

// ============================================================
// PREPARAR TIMER DE MONITORAMENTO (0.2 SEGUNDOS)
// ============================================================

if (!variable_instance_exists(self, "timer_cooldown_pendente")) 
{
    timer_cooldown_pendente = -1;
}

timer_cooldown_pendente = 0.05 * room_speed; 
planta_recente_id = planta_criada;
planta_recente_dados = dados;
planta_recente_barra = global.barra_selecionada;

// ============================================================
// LIMPAR SELEÇÃO
// ============================================================

global.planta_selecionada = noone;
global.barra_selecionada = noone;

if (instance_exists(obj_barra_lateral))
{
    with (obj_barra_lateral)
    {
        cancelar_planta();
    }
}
