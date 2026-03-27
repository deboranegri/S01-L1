package main

import "fmt"

func fibonacci(n int) {
	a, b := 0, 1
	for i := 0; i < n; i++ {
		fmt.Printf("%d ", a)
		a, b = b, a+b
	}
	fmt.Println()
}

func main() {
	var n int
	fmt.Print("Quantos números da sequência de Fibonacci deseja ver? ")
	fmt.Scan(&n)
	fibonacci(n)
}
