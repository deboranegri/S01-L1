#include <iostream>
#include <string>
using namespace std;

class Robo {
public:
    string modelo;
    int versao;
    float potenciaLaser;
    int integridade;

    void disparar(Robo& alvo) {
        cout << modelo << " disparou em " << alvo.modelo << "!" << endl;
        alvo.integridade -= (int)potenciaLaser;
    }

    void exibirStatus() {
        cout << "Modelo: " << modelo
             << " | Versao: " << versao
             << " | Laser: " << potenciaLaser
             << " | Integridade: " << integridade << endl;
    }
};

int main() {
    Robo r1, r2;

    r1.modelo = "X-900";
    r1.versao = 3;
    r1.potenciaLaser = 35.5f;
    r1.integridade = 100;

    r2.modelo = "Z-200";
    r2.versao = 1;
    r2.potenciaLaser = 20.0f;
    r2.integridade = 100;

    r1.disparar(r2);

    cout << "\n--- Status Final ---" << endl;
    r1.exibirStatus();
    r2.exibirStatus();

    return 0;
}
