#include <iostream>
using namespace std;

float multiplicaArray(float arr[], int tamanho) {
    float produto = 1.0;
    for (int i = 0; i < tamanho; i++)
        produto *= arr[i];
    return produto;
}

int main() {
    int tamanho;
    cout << "Quantos valores deseja inserir? ";
    cin >> tamanho;

    float arr[tamanho];
    for (int i = 0; i < tamanho; i++) {
        cout << "Valor " << i + 1 << ": ";
        cin >> arr[i];
    }

    cout << "Produto: " << multiplicaArray(arr, tamanho) << endl;
    return 0;
}
