function soma(a, b)
    return a + b
end

function subtracao(a, b)
    return a - b
end

function multiplicacao(a, b)
    return a * b
end

function divisao(a, b)
    return a / b
end

function calculadora(num1, num2, operador)

    if operador == "+" then
        return soma(num1, num2)

    elseif operador == "-" then
        return subtracao(num1, num2)

    elseif operador == "*" then
        return multiplicacao(num1, num2)

    elseif operador == "/" then
        return divisao(num1, num2)

    else
        return "Erro: operador inválido"
    end
end


print("Digite o primeiro numero:")
local n1 = tonumber(io.read())

print("Digite o operador (+, -, *, /):")
local op = io.read()

print("Digite o segundo numero:")
local n2 = tonumber(io.read())

local resultado = calculadora(n1, n2, op)

print("Resultado: ", resultado)
