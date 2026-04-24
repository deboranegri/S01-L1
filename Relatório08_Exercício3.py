class ArmaCorpoACorpo:
    def __init__(self, tipo):
        self.tipo = tipo

class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

class Joker:
    def __init__(self, membros_equipe):
        # Composição: Joker cria sua própria arma
        self.faca = ArmaCorpoACorpo("Faca de Combate")
        # Agregação: Recebe uma lista de membros externos
        self.equipe = membros_equipe

    def mostrar_equipe(self):
        print(f"Joker usa uma {self.faca.tipo}")
        print("Membros da Equipe:")
        for membro in self.equipe:
            print(f"- {membro.nome} (Arma: {membro.arma})")

# Teste
m1 = PhantomThieves("Ryuji", "Cano")
m2 = PhantomThieves("Ann", "Chicote")
joker = Joker([m1, m2])
joker.mostrar_equipe()
