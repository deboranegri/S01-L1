print("Digite quantos numeros deseja inserir:")
local N = tonumber(io.read())

local tabela = {}
local impares = {}

for i = 1, N do
    print("Digite o numero " .. i .. ":")
    tabela[i] = tonumber(io.read())
end

local j = 1

for i = 1, N do
    if tabela[i] % 2 ~= 0 then
        impares[j] = tabela[i]
        j = j + 1
    end
end

print("Numeros impares encontrados:")

for i = 1, #impares do
    print(impares[i])
end
