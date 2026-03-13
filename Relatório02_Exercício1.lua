print("Digite o valor de M (inicio do intervalo):")
local M = tonumber(io.read())

print("Digite o valor de N (fim do intervalo):")
local N = tonumber(io.read())

print("Digite o valor de X (numero da tabuada):")
local X = tonumber(io.read())

for i = M, N do
    print(X .. " x " .. i .. " = " .. (X * i))
end
