import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {

        Mago howl = new Mago("Howl", 27);
        howl.apresentar();

        Divisao quarto = new Divisao("Quarto", "Descanso");
        Divisao laboratorio = new Divisao("Laboratório", "Experimentos mágicos");
        Divisao cozinha = new Divisao("Cozinha", "Preparar refeições");

        ArrayList<Divisao> lista = new ArrayList<>();
        CasteloAnimado castelo = new CasteloAnimado(lista);

        castelo.adicionarDivisao(quarto);
        castelo.adicionarDivisao(laboratorio);
        castelo.adicionarDivisao(cozinha);

        castelo.listarDivisoes();
    }
}
