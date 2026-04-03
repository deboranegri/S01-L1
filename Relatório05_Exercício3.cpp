#include <iostream>
using namespace std;

int main() {
    float saldo;
    int opcao;

    cout << "Informe o saldo inicial: R$ ";
    cin >> saldo;

    do {
        cout << "\n--- MENU ---\n";
        cout << "1. Ver Saldo\n";
        cout << "2. Depositar\n";
        cout << "3. Sacar\n";
        cout << "4. Sair\n";
        cout << "Opcao: ";
        cin >> opcao;

        if (opcao == 1) {
            cout << "Saldo atual: R$ " << saldo << endl;
        } else if (opcao == 2) {
            float valor;
            cout << "Valor para depositar: R$ ";
            cin >> valor;
            saldo += valor;
            cout << "Deposito realizado! Novo saldo: R$ " << saldo << endl;
        } else if (opcao == 3) {
            float valor;
            cout << "Valor para sacar: R$ ";
            cin >> valor;
            if (valor > saldo)
                cout << "Saldo Insuficiente!" << endl;
            else {
                saldo -= valor;
                cout << "Saque realizado! Novo saldo: R$ " << saldo << endl;
            }
        }
    } while (opcao != 4);

    cout << "Programa encerrado." << endl;
    return 0;
}
