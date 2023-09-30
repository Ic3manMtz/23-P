// Cliente.java
import java.io.*;
import java.net.*;
import java.util.Scanner;

public class Cliente {
    public static void main(String[] args) throws IOException {
        final String DIRECCION_SERVIDOR = "localhost";
        final int PUERTO = 12345;
        Scanner scanner;
    
        try (Socket socket = new Socket(DIRECCION_SERVIDOR, PUERTO)) {
            PrintWriter salida = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader entrada = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            scanner = new Scanner(System.in);
            String respuestaServidor;
            do{
                System.out.println("[C] Ingresa tu nickname...");
                String mensaje = scanner.nextLine();
                salida.println(mensaje);
                System.out.println("[C] Mensaje enviado al servidor: " + mensaje);

                respuestaServidor = entrada.readLine();
                System.out.println("\n[C] Respuesta del servidor: " + respuestaServidor);
            }while(respuestaServidor.equals("false"));

            salida.println("menu");
            respuestaServidor = entrada.readLine();
            System.out.println(respuestaServidor);
            String respuestaMenu = scanner.nextLine();
            salida.println(respuestaMenu);

            String resultado = entrada.readLine();
            System.out.println(respuestaMenu+" = "+resultado);
        }
        
        scanner.close();
    }
}
