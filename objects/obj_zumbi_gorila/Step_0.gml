// No Step do obj_zumbi_gorila:

// Move o gorila usando estritamente a velocidade atual dele
x += velocidade_atual;

// Checagem de morte
if (hp <= 0)
{
    instance_destroy();
    global.zumbis_mortos++;
}