#include <iostream>
#include <string>
using namespace std;

class MembroInatel {
public:
    string nomeCompleto;

    virtual void identificar() {
        cout << "Sou um membro da comunidade Inatel: " << nomeCompleto << "." << endl;
    }
};

class Coordenador : public MembroInatel {
public:
    string departamento;

    void identificar() override {
        cout << "Meu nome e " << nomeCompleto
             << ", sou o coordenador do departamento de "
             << departamento << " no Inatel." << endl;
    }
};

class Pesquisador : public MembroInatel {
public:
    string laboratorio;

    void identificar() override {
        cout << "Meu nome e " << nomeCompleto
             << ", e realizo pesquisas no laboratorio "
             << laboratorio << " do Inatel." << endl;
    }
};

int main() {
    Coordenador c;
    c.nomeCompleto = "Carlos Silva";
    c.departamento = "Engenharia de Software";

    Pesquisador p;
    p.nomeCompleto = "Ana Souza";
    p.laboratorio = "LabIA";

    MembroInatel* m1 = &c;
    MembroInatel* m2 = &p;

    m1->identificar();
    m2->identificar();

    return 0;
}
