#region
// ============================================================
// OBJ_QUADRADO_GRID — LEFT PRESSED
// PLANTAR A PLANTA SELECIONADA
// ============================================================

if (!variable_global_exists("planta_selecionada"))
{
exit;
}

if (global.planta_selecionada == noone)
{
exit;
}

if (ocupado)
{
exit;
}

// ============================================================
// OBJETO DA PLANTA
// ============================================================

var objeto_planta =
global.planta_selecionada;

if (!object_exists(objeto_planta))
{
exit;
}

// ============================================================
// DESCOBRIR QUAL PLANTA É
// ============================================================

var dados =
planta_obter_por_objeto(
objeto_planta
);

if (is_undefined(dados))
{
exit;
}

// ============================================================
// VERIFICAR SÓIS NOVAMENTE
// Segurança para evitar gastar se algo mudou
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

var planta_criada =
instance_create_layer(
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
// DESCONTAR SÓIS
// ============================================================

global.sois -= dados.custo;

// ============================================================
// OCUPAR O QUADRADO
// ============================================================

ocupado = true;

// ============================================================
// INICIAR COOLDOWN DA CARTA
// (Ignora o cooldown se a sala for Room_fase28_planta)
// ============================================================

if (room != Room_fase28_planta)
{
if (instance_exists(obj_barra_lateral))
{
with (obj_barra_lateral)
{
iniciar_cooldown(
global.barra_selecionada,
dados.recarga * room_speed
);
}
}
}

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

#endregion