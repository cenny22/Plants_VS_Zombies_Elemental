// O tiro só causa dano se o zumbi arbusto estiver fora da moita (ou seja, comendo!)
if (other.estado == "comendo") {
    
    other.hp -= 20; // Tira 10 de vida do zumbi arbusto (ajuste o valor se quiser mais dano)
    
    instance_destroy(); // Destrói a ervilha para ela não atravessar e sumir da tela
}
// Se o estado for "andando", o "if" é ignorado e a ervilha passa direto (ele fica imune)