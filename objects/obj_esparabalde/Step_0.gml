#region OBJ_ESPARABALDE — STEP

event_inherited();

// ====================================================================
// CHECAGEM DO ADUBO — TRANSFORMAÇÃO GLOBAL DE ZUMBIS
// ====================================================================

if (adubo_ativado)
{
    adubo_ativado = false; // Reseta o gatilho

    // Efeito visual instantâneo na Esparabalde
    sprite_index = Sprite32_1;
    image_index = 0;
    image_speed = 1;

    // Roda através de TODOS os zumbis ativos na sala
    with (obj_zumbi_parent)
    {
        // Se a instância atual NÃO for um zumbi básico já transformado
        if (object_index != obj_zumbi_basico)
        {
            // Salva a posição e o estado do zumbi para manter fluidez
            var pos_x = x;
            var pos_y = pos_x; // mantendo o eixo Y e X corretos
            var hp_atual = hp;

            // Transforma o zumbi atual em zumbi básico
            // O segundo argumento "true" executa o Create do novo objeto
            instance_change(obj_zumbi_basico, true);
			global.zumbis_mortos--

            // Restaura a vida e posição no novo objeto básico
            x = pos_x;
            y = pos_y;
            
            // Opcional: Mantém a vida reduzida se ele já tiver tomado dano
            if (variable_instance_exists(id, "hp"))
            {
                hp = min(hp_atual, hp); 
            }
        }
    }
}

// ====================================================================
// DETECÇÃO E ANIMAÇÃO PADRÃO DA ESPARABALDE
// ====================================================================

var raio_deteccao = 64; 
var zumbi_proximo = instance_nearest(x, y, obj_zumbi_parent);

if (instance_exists(zumbi_proximo) && distance_to_object(zumbi_proximo) <= raio_deteccao) 
{
    if (sprite_index != Sprite32_1) 
    {
        sprite_index = Sprite32_1;
        image_index = 0;
        image_speed = 1;
    }
    
    if (image_index >= image_number - 1) 
    {
        image_speed = 0;
        image_index = image_number - 1;
    }
} 
else 
{
    if (sprite_index != Sprite32_2) 
    {
        sprite_index = Sprite32_2;
        image_index = 0;
        image_speed = 1;
    }
}

#endregion