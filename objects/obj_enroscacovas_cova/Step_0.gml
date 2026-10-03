if (adubo_ativado)
{
    var qtd = instance_number(obj_zumbi_parent);
	sprite_index = Sprite105_1

    repeat (min(4, qtd))
    {
        var zumbi = instance_find(obj_zumbi_parent, irandom(qtd - 1));
        if (instance_exists(zumbi)) zumbi.hp -= 400;
    }

    adubo_ativado = false;
}