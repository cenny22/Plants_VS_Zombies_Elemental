// 1. Limpa o texto da variável (remove espaços e converte para minúsculas)
var tipo_limpo = string_lower(string_trim(string(planta_tipo)));

// 2. Converte o texto para o nome do objeto no GameMaker
var nome_objeto = "obj_" + tipo_limpo;

// TRATAMENTO DE EXCEÇÕES E NOMES ESPECIAIS
if (tipo_limpo == "disparervilha" || tipo_limpo == "ervilha" || tipo_limpo == "disparaervilha") {
    nome_objeto = "obj_disparaervilha"; // Ajuste aqui para o nome EXATO do seu objeto
}
else if (tipo_limpo == "noz") {
    nome_objeto = "obj_noz_obstaculo";
}
else if (tipo_limpo == "repelecao") {
    nome_objeto = "obj_repepe_cao";
}

// 3. Busca o índice do objeto no jogo
var obj_index = asset_get_index(nome_objeto);

// SE NÃO ENCONTROU, TENTA BUSCAR POR "obj_disparervilha" (SEM O 'A')
if (!object_exists(obj_index) && (tipo_limpo == "disparervilha" || tipo_limpo == "ervilha")) {
    obj_index = asset_get_index("obj_disparervilha");
}

// 4. SELEÇÃO DO PACOTE
if (object_exists(obj_index)) {
    global.planta_selecionada = obj_index;
    global.pacote_atual_esteira = id; // Guarda referência para destruir ao plantar
    show_debug_message("Planta da esteira selecionada com sucesso: " + object_get_name(obj_index));
} else {
    show_debug_message("ERRO: Objeto nao encontrado para o tipo: " + string(planta_tipo));
}