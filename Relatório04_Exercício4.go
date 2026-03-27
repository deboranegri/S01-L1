package main

import "fmt"

func verificarLogin(usuario, senha string) bool {
	if usuario == "admin" && senha == "senha" {
		return true
	}
	return false
}

func main() {
	var usuario, senha string

	for {
		fmt.Print("Digite o nome de usuário: ")
		fmt.Scan(&usuario)
		fmt.Print("Digite a senha: ")
		fmt.Scan(&senha)

		if verificarLogin(usuario, senha) {
			fmt.Println("Login bem-sucedido!")
			break
		} else {
			fmt.Println("Usuário ou senha incorretos. Tente novamente.")
		}
	}
}
