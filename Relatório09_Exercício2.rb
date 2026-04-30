class Musico
  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(obra)
    raise NotImplementedError, "#{self.class} deve implementar tocar_partitura"
  end

  def nome
    @nome
  end
end

class Pianista < Musico
  def tocar_partitura(obra)
    puts "#{@nome} toca '#{obra}' ao piano com delicadeza e emoção!"
  end
end

class Violinista < Musico
  def tocar_partitura(obra)
    puts "#{@nome} executa '#{obra}' no violino com alma apaixonada!"
  end
end

class Maestro
  def initialize
    @musicos = []
  end

  def adicionar_musico(musico)
    @musicos << musico
  end

  def iniciar_concerto(obra)
    puts "\n🎼 Iniciando concerto: '#{obra}'"
    @musicos.each { |m| m.tocar_partitura(obra) }
  end

  def ajustar_postura(estado)
    @musicos.map { |m| "#{m.nome} está em ritmo #{estado}!" }
  end
end

maestro = Maestro.new
maestro.adicionar_musico(Pianista.new("Kosei Arima", "Piano"))
maestro.adicionar_musico(Violinista.new("Kaori Miyazono", "Violino"))
maestro.adicionar_musico(Pianista.new("Tsubaki Sawabe", "Piano"))

maestro.iniciar_concerto("Clair de Lune")

puts "Ajuste de postura:"
maestro.ajustar_postura("Allegro").each { |frase| puts frase }
