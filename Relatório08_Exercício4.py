from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo, funcao):
        self.custo = custo
        self.funcao = funcao

class NetRunner(Cibernetico):
    def __init__(self, custo_implante, funcao_implante):
        # Composição: NetRunner possui um implante
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self):
        print(f"Hackeando sistema usando {self.implante.funcao}!")

class Faccao:
    def __init__(self):
        # Agregação: Lista de objetos do tipo Cibernetico
        self.membros = []

    def adicionar_membro(self, membro):
        self.membros.append(membro)

    def executar_ataque_em_massa(self):
        for m in self.membros:
            m.realizar_hack()

# Main
voodoos = Faccao()
voodoos.adicionar_membro(NetRunner(500, "Protocolo de Brecha"))
voodoos.adicionar_membro(NetRunner(800, "Curto-Circuito"))

voodoos.executar_ataque_em_massa()
