function scr_dialogo()
{
    switch (room)
    {
        case Room_fase1_planta:
            texto = [
                {
                    personagem: "dave",
                    fala: "OLHA, QUE LEGAL. ESTAMOS DENTRO DO MEU TACO!"
                },
                {
                    personagem: "penny",
                    fala: "Sinto muito em te informar usuário Dave, mas estamos provavelmente em uma floresta"
                },
                {
                    personagem: "dave",
                    fala: "Que bom que avisou, mas já lambi o chão."
                }
            ];
        break;

        case Room_fase3_planta: 
            texto = [
                {
                    personagem: "penny",
                    fala: "Alerta! Detectando maior presença de zumbis nesta área."
                },
                {
                    personagem: "dave",
                    fala: "Que estranho, parece que estão usando objetos na cabeça, que tipo de maluco faria isso?"
                }
            ];
        break;
		
		        case Room_fase6_planta: 
            texto = [
                {
                    personagem: "dave",
                    fala: "Penny, sua sabe-tudo, quem veio primeiro, o ovo ou a galinha?"
                },
                {
                    personagem: "penny",
                    fala: "Eu evitarei responder essa pergunta para não ter problemas no processador."
                }
				
            ];
        break;
		
		        case Room_fase12_planta: 
            texto = [
                {
                    personagem: "dave",
                    fala: "Coitados desses girassóis, terão que produzir o mais rápido que conseguirem."
                },
                {
                    personagem: "penny",
                    fala: "O dia hoje parece nublado."
                }
            ];
        break;

        default: // Caso a room não esteja listada, carrega um texto padrão
            texto = [
                {
                    personagem: "dave",
                    fala: "O que está me olhando?"
                }
            ];
        break;
    }
}