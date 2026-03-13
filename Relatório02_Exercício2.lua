print("Digite quantos numeros deseja inserir:")
local N = tonumber(io.read())

local tabela = {}

for i = 1, N do
    print("Digite o numero " .. i .. ":")
    tabela[i] = tonumber(io.read())
end

local maior = tabela[1]

for i = 2, N do
    if tabela[i] > maior then
        maior = tabela[i]
    end
end

print("O maior numero da tabela é: " .. maior)
