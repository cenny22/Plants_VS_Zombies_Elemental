// Verifica se não é a mesma instância
if (other != self)
{
    // Verifica se esta planta atual NÃO é a trepadeira 
    // (Substitua 'obj_trepadeira' pelo nome real do objeto da sua trepadeira)
    if (object_index != obj_trepaervilha)
    {
        // Compara os IDs: quem tiver o ID maior foi criado DEPOIS
        if (id > other.id)
        {
            // Destrói a si mesma (a planta recém-criada)
            instance_destroy();
        }
    }
}