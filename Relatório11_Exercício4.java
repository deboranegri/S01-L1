import java.util.ArrayList;
 
public class Main {
 
    public static void main(String[] args) {
 
        Lagosta lagosta = new Lagosta("Lagosta Gigante");
        Cogumelo cogumelo = new Cogumelo("Cogumelo Venenoso");
 
        Prato pratoLagosta = new Prato("Lagosta Grelhada", lagosta);
        Prato pratoCogumelo = new Prato("Cogumelo Refogado", cogumelo);
 
        pratoLagosta.servir();
        pratoCogumelo.servir();

        System.out.println("Cardápio da Expedição");
        ArrayList<Prato> cardapio = new ArrayList<>();
        cardapio.add(pratoLagosta);
        cardapio.add(pratoCogumelo);
 
        for (Prato p : cardapio) {
            p.servir();
        }
    }
}
 
