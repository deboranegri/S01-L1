public class Main {
 
    public static void main(String[] args) {
 
        Alien alien1 = new Alien("Zorg");
        Alien alien2 = new Alien("Xenu");
        Youkai youkai1 = new Youkai("Kitsune");
        Youkai youkai2 = new Youkai("Oni");
 
        RegistroOculto registro = new RegistroOculto();
 
        registro.registrarEntidade(alien1);
        registro.registrarEntidade(alien2);
        registro.registrarEntidade(youkai1);
        registro.registrarEntidade(youkai2);

        registro.registrarEntidade(alien1);
 
        registro.listarEntidades();
    }
}
 
