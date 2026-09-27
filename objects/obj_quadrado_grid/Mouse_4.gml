#region
// ============================================================
// OBJ_QUADRADO_GRID — LEFT PRESSED
// PLANTAR A PLANTA SELECIONADA
// ============================================================


// ============================================================
// VERIFICA SE EXISTE PLANTA SELECIONADA
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
// VERIFICA SE O QUADRADO JÁ ESTÁ OCUPADO
// ============================================================

if (ocupado)
{
    exit;
}


// ============================================================
// PEGA O OBJETO DA PLANTA
// ============================================================

var objeto_planta =
    global.planta_selecionada;


// ============================================================
// SEGURANÇA
// ============================================================

if (!object_exists(objeto_planta))
{
    exit;
}


// ============================================================
// POSIÇÃO DO GRID
// ============================================================

// A planta nasce exatamente no centro
// deste quadrado.

var planta_x = x;
var planta_y = y;


// ============================================================
// CRIA A PLANTA
// ============================================================

var planta_criada =
    instance_create_layer(
        planta_x,
        planta_y,
        "Instances",
        objeto_planta
    );


// ============================================================
// VERIFICA SE FOI CRIADA
// ============================================================

if (planta_criada == noone)
{
    exit;
}


// ============================================================
// MARCA O QUADRADO COMO OCUPADO
// ============================================================

ocupado = true;


// ============================================================
// LIMPA A SELEÇÃO
// ============================================================

global.planta_selecionada = noone;

global.barra_selecionada = noone;


// ============================================================
// AVISA A BARRA PARA DESSELECIONAR
// ============================================================

if (instance_exists(obj_barra_lateral))
{
    with (obj_barra_lateral)
    {
        cancelar_planta();
    }
}

#endregion