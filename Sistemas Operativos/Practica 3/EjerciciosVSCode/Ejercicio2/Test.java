import java.io.*;
import java.util.Scanner;

public class Test{
    public static void main(String[] args) throws IOException{
        Cliente cliente = new Cliente();
        cliente.startConnection("localhost",6000);
        Scanner scanner = new Scanner(System.in);

        while(true){
            System.out.println("Escribe el mensaje para el servidor...");
            String mensaje = scanner.nextLine();
            String respuesta = cliente.sendMessage(mensaje);
            System.out.println("Respuesta del servidor: "+respuesta);
        }
    }
}