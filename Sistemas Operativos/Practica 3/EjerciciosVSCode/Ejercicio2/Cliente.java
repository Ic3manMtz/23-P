// Cliente.java
import java.io.*;
import java.net.*;

public class Cliente {
    public static void main(String[] args) throws IOException {
        final String DIRECCION_SERVIDOR = "localhost";
        final int PUERTO = 12345;

        try (Socket socket = new Socket(DIRECCION_SERVIDOR, PUERTO)) {
            PrintWriter salida = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader entrada = new BufferedReader(new InputStreamReader(socket.getInputStream()));

            String mensaje = "Hola, Servidor!";
            salida.println(mensaje);
            System.out.println("[Cliente] Mensaje enviado al servidor: " + mensaje);

            String respuestaServidor = entrada.readLine();
            System.out.println("[Cliente] Respuesta del servidor: " + respuestaServidor);
        }
    }
}
