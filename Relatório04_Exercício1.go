package main

import "fmt"

func ValidarUsuario(nome string) (bool, string) {
	if len(nome) >= 8 {
		return true, "Usuário criado com sucesso!"
	}
	return false, "Erro: O nome de usuário é muito curto"
}

func main() {
	for {
		fmt.Print("Digite um nome de usuário: ")
		var nome string
		fmt.Scanln(&nome)

		valido, mensagem := ValidarUsuario(nome)
		fmt.Println(mensagem)

		if valido {
			break
		}
	}
}
