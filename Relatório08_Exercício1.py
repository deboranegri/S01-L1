class Personagem:
    def __init__(self, vida, resistencia):
        self._vida = vida  # Atributo protegido (convenção _)
        self._resistencia = resistencia

    @property
    def vida(self):
        return self._vida

    @vida.setter
    def vida(self, valor):
        if valor >= 0:
            self._vida = valor
        else:
            print("Vida não pode ser negativa!")

    def __str__(self):
        return f"Personagem com {self._vida} de vida"

class Cavaleiro(Personagem):
    def __init__(self, vida, resistencia, armadura_pesada):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self):
        status_armadura = "com" if self.armadura_pesada else "sem"
        return f"Cavaleiro {status_armadura} armadura pesada e {self._vida} de vida"

# Teste
p = Personagem(100, 50)
c = Cavaleiro(150, 80, True)
print(p)
print(c)
