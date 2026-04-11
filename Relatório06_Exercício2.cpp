#include <iostream>
#include <string>
using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    void setNome(string n) { nome = n; }
    void setIdade(int i) { idade = i; }
    string getNome() { return nome; }
    int getIdade() { return idade; }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    void setNivel(int n) { nivel = n; }
    int getNivel() { return nivel; }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    void setRank(int r) {
        if (r >= 0 && r <= 10)
            rank = r;
        else
            cout << "Rank invalido! Deve ser entre 0 e 10." << endl;
    }
    int getRank() { return rank; }
};

int main() {
    Protagonista p1;
    p1.setNome("Joker");
    p1.setIdade(17);
    p1.setNivel(42);

    Personagem p2;
    p2.setNome("Ryuji");
    p2.setIdade(17);
    p2.setRank(8);

    cout << "--- Protagonista ---" << endl;
    cout << "Nome: " << p1.getNome() << endl;
    cout << "Idade: " << p1.getIdade() << endl;
    cout << "Nivel: " << p1.getNivel() << endl;

    cout << "\n--- Personagem ---" << endl;
    cout << "Nome: " << p2.getNome() << endl;
    cout << "Idade: " << p2.getIdade() << endl;
    cout << "Rank: " << p2.getRank() << endl;

    return 0;
}
