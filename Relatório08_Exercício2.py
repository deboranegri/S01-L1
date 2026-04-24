from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass

class Tanque(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} (Tanque) ativou: Barreira Global!")

class Dano(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} (Dano) ativou: Chuva de Justiça!")

# Main
herois = [Tanque("Reinhardt", "Tanque"), Dano("Pharah", "Dano")]

for h in herois:
    h.usar_ultimate()
