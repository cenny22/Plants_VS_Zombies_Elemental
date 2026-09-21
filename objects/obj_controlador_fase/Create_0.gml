global.sois = 100;
total_fase = 5;
//global.sois = 1000000000000000; 
global.fase_iniciada = false;
global.planta_selecionada = noone; 

global.plantas_escolhidas = ds_list_create();
global.zumbis_mortos = 0;

// ATENÇÃO: Não ligamos os alarmes aqui! 
// Eles vão ligar sozinhos assim que você clicar no botão "JÁ".