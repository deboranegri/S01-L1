module Localizavel
  def local_atual
    puts "#{@nome} está localizado(a) em: #{@localizacao}"
  end
end

module Perigoso
  def exibir_ameaca
    puts "ALERTA: #{@nome} representa uma ameaça!"
  end
end

class Pessoa
  def initialize(nome)
    @nome = nome
  end

  def nome
    @nome
  end
end

class Testemunha < Pessoa
  include Localizavel

  def initialize(nome, localizacao)
    super(nome)
    @localizacao = localizacao
  end
end

class Suspeito < Pessoa
  include Localizavel
  include Perigoso

  def initialize(nome, localizacao)
    super(nome)
    @localizacao = localizacao
  end
end

class CenaDoCrime
  def initialize
    @pessoas = []
  end

  def adicionar_pessoa(pessoa)
    @pessoas << pessoa
  end

  def listar_todos
    puts "Pessoas na cena:"
    @pessoas.each { |p| puts "  - #{p.nome} (#{p.class})" }
  end

  def identificar_perigosos
    @pessoas.select { |p| p.respond_to?(:exibir_ameaca) }
  end
end

# Main
cena = CenaDoCrime.new
cena.adicionar_pessoa(Testemunha.new("Mrs. Hudson", "Corredor"))
cena.adicionar_pessoa(Suspeito.new("Professor Moriarty", "Biblioteca"))
cena.adicionar_pessoa(Suspeito.new("Irene Adler", "Jardim"))

cena.listar_todos

puts "Suspeitos perigosos identificados:"
cena.identificar_perigosos.each do |s|
  s.local_atual
  s.exibir_ameaca
end
