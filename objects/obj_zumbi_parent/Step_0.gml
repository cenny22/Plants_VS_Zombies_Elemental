// ============================================================
// FOGO + CONGELAMENTO
// ============================================================

// Se os dois estiverem ativos ao mesmo tempo,
// o efeito mais recentemente aplicado precisa
// ser tratado pelo código que aplicou o efeito.

// Segurança: fogo e con nunca ficam ativos juntos.
if (fogo == true && con > 0)
{
    // Se chegou aqui, o congelamento está ativo.
    // O fogo é removido.
    fogo = false;
    fogo_timer = 0;
}


// ============================================================
// TEMPO DO CONGELAMENTO
// ============================================================

if (con > 0)
{
    con_timer++;

    // 10 segundos congelado
    if (con_timer >= room_speed * 10)
    {
        con = 0;
        con_timer = 0;
    }
}
else
{
    con_timer = 0;
}


// ============================================================
// FOGO — DANO
// ============================================================

if (fogo == true)
{
    fogo_timer++;

    // A cada 1.5 segundos
    if (fogo_timer >= room_speed * 1.5)
    {
        hp -= 10;
        pisk = 10;
        fogo_timer = 0;
    }
}
else
{
    fogo_timer = 0;
}


// ============================================================
// 1. SE ESTIVER PARALISADO
// ============================================================

if (paralisado)
{
    speed = 0;
    tempo_paralisado -= 1;

    if (tempo_paralisado <= 0)
    {
        paralisado = false;
        speed = vel;
    }
}


// ============================================================
// 2. SE NÃO ESTIVER PARALISADO
// ============================================================

else
{
    // Limpa o alvo se for planta ignorada
    if (instance_exists(atacadoread))
    {
        if (atacadoread.object_index == obj_ervaespinho ||
            atacadoread.object_index == obj_esparabalde ||
            atacadoread.object_index == obj_cova_sono)
        {
            atacadoread = noone;
        }
    }

    // Ataca ou anda
    if (instance_exists(atacadoread))
    {
        speed = 0;
        danos_timer++;

        if (danos_timer >= room_speed)
        {
            atacadoread.hp -= 100;
            atacadoread.pisk = 10;
            danos_timer = 0;
        }
    }
    else
    {
        speed = vel + con;
        atacadoread = noone;
    }
}


// ============================================================
// 3. MORTE
// ============================================================

if (hp <= 0)
{
    if (!variable_global_exists("zumbis_mortos"))
        global.zumbis_mortos = 0;

    if (object_index != obj_zumbi_galinha)
        global.zumbis_mortos += 1;

    instance_destroy();
}


// ============================================================
// GÁS
// ============================================================

if (!place_meeting(x, y, obj_gas_enroscacovas))
{
    if (variable_instance_exists(id, "velocidade_base"))
    {
        velocidade = velocidade_base;
    }
}

if (!place_meeting(x, y, obj_gas_enroscacovas))
{
    if (variable_instance_exists(id, "vel_original"))
    {
        if (variable_instance_exists(id, "vel") && vel != 0)
        {
            vel = vel_original;
        }

        if (speed != 0)
        {
            speed = vel_original;
        }
    }
}


// ============================================================
// PISK
// ============================================================

if (pisk > 0)
{
    image_alpha = 0.6;
    pisk--;
}
else
{
    image_alpha = 1;
}


// ============================================================
// COR DO ZUMBI
// ============================================================

var azul_claro = make_color_rgb(135, 206, 250);

if (con > 0)
{
    image_blend = azul_claro;
}
else if (fogo == true)
{
    image_blend = c_orange;
}
else
{
    image_blend = c_white;
}


// ============================================================
// FOGO — PARTÍCULAS
// ============================================================

if (fogo == true)
{
    for (var i = 0; i < array_length(fogo_particulas); i++)
    {
        fogo_particulas[i].y -= fogo_particulas[i].velocidade;
        fogo_particulas[i].vida--;

        if (fogo_particulas[i].vida <= 0)
        {
            fogo_particulas[i].x =
                random_range(-sprite_width * 0.35, sprite_width * 0.35);

            fogo_particulas[i].y =
                random_range(-sprite_height * 0.5, -sprite_height * 0.35);

            fogo_particulas[i].velocidade =
                random_range(0.3, 0.7);

            fogo_particulas[i].tamanho =
                random_range(3, 6);

            fogo_particulas[i].vida =
                random_range(20, 45);
        }
    }
}