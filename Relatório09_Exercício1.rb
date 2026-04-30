class BebidaAfterlife
  attr_reader :nome

  def initialize(nome, custo_base)
    @nome = nome
    self.custo_base = custo_base
  end

  def custo_base
    @custo_base
  end

  def custo_base=(valor)
    if valor > 0
      @custo_base = valor
    else
      puts "Erro: custo_base deve ser maior que zero!"
    end
  end

  def preco_total
    @custo_base
  end

  def to_string
    "Bebida: #{@nome} | Valor Final: $#{preco_total}"
  end
end

class DrinkIconico < BebidaAfterlife
  def initialize(nome, custo_base, nivel_notoriedade)
    super(nome, custo_base)
    @nivel_notoriedade = nivel_notoriedade
  end

  def preco_total
    @custo_base + (@nivel_notoriedade * 8)
  end
end


drinks = [
  DrinkIconico.new("The Joker's Smile", 20, 5),
  DrinkIconico.new("Breaking Bad Blue", 15, 3),
  DrinkIconico.new("Walter White Whiskey", 30, 7)
]

puts "=== Bar AfterLife ==="
drinks.each { |d| puts d.to_string }
