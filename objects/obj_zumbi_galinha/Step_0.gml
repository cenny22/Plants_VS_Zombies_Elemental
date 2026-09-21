event_inherited();
// ====================================================================
// 1. INTERAÇÃO ESPECIAL COM ERVA-ESPINHO (MORTE INSTANTÂNEA)
// ====================================================================
// Verifica se ele tocou em alguma Erva-Espinho
var espinho_tocado = instance_place(x, y, obj_ervaespinho);

if (espinho_tocado != noone) {
    // Tocou, morreu. Sem choro.
    instance_destroy(); 
}