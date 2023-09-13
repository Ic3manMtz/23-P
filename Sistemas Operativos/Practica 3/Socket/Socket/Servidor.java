// Servidor
import java.io.*;
import java.net.*;

public class Servidor {
    public static void main(String[] args) throws IOException {
        final int PUERTO = 12345;
        
        try (ServerSocket serverSocket = new ServerSocket(PUERTO)) {
            System.out.println("Servidor iniciado y escuchando en el puerto: " + PUERTO);

            while (true) {
                Socket clienteSocket = serverSocket.accept();
                System.out.println("Cliente conectado: " + clienteSocket.getRemoteSocketAddress());
                
                BufferedReader entrada = new BufferedReader(new InputStreamReader(clienteSocket.getInputStream()));
                PrintWriter salida = new PrintWriter(clienteSocket.getOutputStream(), true);

                String mensajeCliente = entrada.readLine();
                System.out.println("Recibido del cliente: " + mensajeCliente);

                salida.println("Hola, Cliente! Recibí tu mensaje: " + mensajeCliente);

                clienteSocket.close();
            }
        }
    }
}
