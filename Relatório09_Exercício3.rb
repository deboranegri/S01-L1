class MicroondasTelefone
  def initialize(nome)
    @nome = nome
  end

  def ativar
    puts "Banana Verde detectada! O Microondas-Telefone (#{@nome}) está operando!"
  end
end

class Relatorio
  attr_reader :nome_projeto, :autor

  def initialize(nome_projeto, autor)
    @nome_projeto = nome_projeto
    @autor = autor
  end
end

class LabRegistro
  def initialize
    @microondas = MicroondasTelefone.new("nome provisório")
    @registros = []
  end

  def adicionar_registro(nome_projeto, autor)
    @microondas.ativar
    @registros << Relatorio.new(nome_projeto, autor)
  end

  def listar_experimentos
    puts "Experimentos registrados:"
    @registros.each do |r|
      puts "  Projeto: #{r.nome_projeto} | Autor: #{r.autor}"
    end
  end
end

lab = LabRegistro.new
lab.adicionar_registro("KRR", "Okabe Rintaro")
lab.adicionar_registro("CERN Hack", "Makise Kurisu")
lab.adicionar_registro("Divergência 1%", "Hashida Itaru")
lab.listar_experimentos
