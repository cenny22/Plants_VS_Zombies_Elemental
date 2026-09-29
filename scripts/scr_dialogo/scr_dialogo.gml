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
		
				case Room_fase7_planta:
            texto = [
                {
                    personagem: "dave",
                    fala: "OLHA PENNY! Um gatinho de Páscoa todo pintadinho! vem cá miau..."
                },
                {
                    personagem: "penny",
                    fala: "Usuário Dave, isso não é um gato doméstico, é uma onça. Sugiro não tentar fazer carinho."
                },
                {
                    personagem: "dave",
                    fala: "Por que ele está rugindo igual a um motor de caminhão?! Acho que esse gato está passando mal!"
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

		        case Room_fase13_planta: 
            texto = [
                {
                    personagem: "penny",
                    fala: "Usuário Dave, indentifico alto índice de gases mortíferos impossibilitando o uso de nossas plantas."
                },
                {
                    personagem: "dave",
                    fala: "Não se preocupe Penny, nosso novo amigo vai lidar com isso."
                }
            ];
        break;
		
        case Room_fase14_planta:
            texto = [
                {
                    personagem: "dave",
                    fala: "Rápido Penny, me dá um autógrafo daquele cara! É o Macacão de Academia!"
                },
                {
                    personagem: "penny",
                    fala: "Meus sensores indicam que aquele é um Gorila, usuário Dave. E ele parece extremamente hostil."
                }
            ];
        break;
		
		        case Room_fase16_planta: 
            texto = [
                {
                    personagem: "dave",
                    fala: "Penny, parece que nos avistaram."
                },
                {
                    personagem: "penny",
                    fala: "Sim, uma tribo indígena parece insatisfeita."
                }
            ];
        break;
		
		        case Room_fase18_planta: 
            texto = [
                {
                    personagem: "dave",
                    fala: "O que são aqueles farelos vindo em nossa direção?"
                },
                {
                    personagem: "penny",
                    fala: "São zumbis, muitos zumbis."
                }
            ];
        break;
		
        case Room_fase19_planta:
            texto = [
                {
                    personagem: "dave",
                    fala: "Penny, por que aquele cavalo tem o pescoço de guindaste?!"
                },
                {
                    personagem: "penny",
                    fala: "Aquilo é uma girafa, Dave. O pescoço longo serve para alcançar as folhas mais altas."
                },
                {
                    personagem: "dave",
                    fala: "Como é que a comida chega no estômago desse bicho? Deve demorar uns três dias de viagema."
                }
            ];
        break;
		
		        case Room_fase22_planta: 
            texto = [
                {
                    personagem: "penny",
                    fala: "Dave, você por acaso teria ido no pântano."
                },
                {
                    personagem: "dave",
                    fala: "Não, se eu soubesse o que é isso."
                }
            ];
        break;
		
		        case Room_fase26_planta: 
            texto = [
                {
                    personagem: "dave",
                    fala: "Temos um problema, nossas plantas decidiram tirar um cochilo."
                },
                {
                    personagem: "penny",
                    fala: "Girassóis não dormem de dia."
                },
                {
                    personagem: "dave",
                    fala: "Muito menos nosso guarda-costa."
                }
            ];
        break;
		
        case Room_fase28_planta: 
            texto = [
                {
                    personagem: "dave",
                    fala: "Penny, se uma onça de terno e uma girafa de salto alto entrarem num ringue contra um gorila e um jacaré, quem ganha? A galinha!"
                },
                {
                    personagem: "penny",
                    fala: "Por favor, apenas plante suas defesas, Dave."
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