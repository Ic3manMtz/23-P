import java.io.*;
import java.net.*;
import java.util.*;

public class Peer {
    private static final String HOST = "localhost";
    private static final int PUERTO = 6000;

    public static void main(String[] args) throws IOException {
        int id = Integer.parseInt(args[0]);
        int TOTAL = Integer.parseInt(args[1]);
        int PUERTO_ID = PUERTO + id;
        int VECINO = ((id + 1) % TOTAL) + PUERTO;
        int numeroGenerado = new Random().nextInt(100)+1;
        int numeroRecibido=0;
        boolean firstStep=true;
        int suma=0;
    
        // Creación del ServerSocket
        try (ServerSocket serverSocket = new ServerSocket(PUERTO_ID)) {
            System.out.println("Servidor[" + PUERTO_ID + "]: Escuchando en el puerto " + PUERTO_ID+", Numero generado: "+numeroGenerado);
    
            try {
                Thread.sleep(3000);
            } catch (Exception e) {
                e.printStackTrace();
            }
    
            System.out.println("Puerto: " + PUERTO_ID + " Vecino: " + VECINO);
    
            // Creación del cliente
            try (Socket clientSocket = new Socket(HOST, VECINO)) {
                PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
    
                // Aceptación del socket del servidor
                Socket serverSocketClient = serverSocket.accept();
                BufferedReader in = new BufferedReader(new InputStreamReader(serverSocketClient.getInputStream()));
    
                for(int i=0; i<TOTAL; i++){
                    if(firstStep){
                        out.println(numeroGenerado);
                        System.out.print("\nCliente[" + id + "]: Enviando número " + numeroGenerado);
                        firstStep=false;
                    }else {
                        out.println(numeroRecibido);
                        System.out.print("\nCliente[" + id + "]: Enviando número " + numeroRecibido);
                    }
    
                    // Envío y recepción de mensajes
                    String mensaje = in.readLine();
                    System.out.print("\nServidor[" + PUERTO_ID + "]: Recibí el número " + mensaje);
                    numeroRecibido=Integer.parseInt(mensaje,10);
                    suma+=numeroRecibido;
                }
            }
    
            System.out.print("\nServidor[" + PUERTO_ID + "]: La suma total de los números recibidos es: "+suma );
        }
    }
    
}
