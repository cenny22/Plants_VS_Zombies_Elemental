global.sois = 50; // Começa com 150 sóis também
total_fase = 10;
//global.sois = 100000000000000000; 
global.fase_iniciada = false;
global.planta_selecionada = noone;
horda_iniciada = false; // Define que a horda da fase 2 ainda não começou

// Reinicia o contador de zumbis mortos para esta fase
global.zumbis_mortos = 0; 
// Inicializa o contador de zumbis nascidos
zumbis_nascidos = 0;

// Nota: Não criamos a lista global.plantas_escolhidas aqui porque 
// ela já foi criada pelo jogo lá na Fase 1 e continua valendo.
// ... seus códigos originais do Create ...
