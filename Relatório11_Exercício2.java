public class Main {

    public static void main(String[] args) {

        CafeteriaLeblanc leblanc = new CafeteriaLeblanc();

        Cafe cafeSimples = new Cafe("Café Preto", 5.00);
        Cafe cafeLeite = new Cafe("Café com Leite", 7.00);
        CafeGourmet cafeGourmet = new CafeGourmet("Blend Especial do Sojiro", 10.00, 4.50);

        leblanc.adicionarCafe(cafeSimples);
        leblanc.adicionarCafe(cafeLeite);
        leblanc.adicionarCafe(cafeGourmet);

        leblanc.abrirCafeteria();
    }
}
