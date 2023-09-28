import java.io.*;
import java.net.*;
import java.util.*;
import java.util.stream.IntStream;

public class Peer {
    private static final String HOST = "localhost";
    private static final int PUERTO = 6000;
    private static int numeroRecibido;

    public static void main(String[] args) throws IOException {
        int id = Integer.parseInt(args[0]);
        int TOTAL = Integer.parseInt(args[1]);
        int PUERTO_ID = PUERTO + id;
        int VECINO = ((id + 1) % TOTAL) + PUERTO;
				int numeroGenerado = new Random().nextInt(100)+1;

        // Modo Servidor
        try (ServerSocket serverSocket = new ServerSocket(PUERTO_ID)) {
            System.out.println("Servidor[" + PUERTO_ID + "]: Escuchando en el puerto " + PUERTO_ID);

            try {
                Thread.sleep(3000);
            } catch (Exception e) {
                e.printStackTrace();
            }

            System.out.println("Puerto: " + PUERTO_ID + " Vecino: " + VECINO);

            // Modo cliente
            try (Socket clientSocket = new Socket(HOST, VECINO)) {
                PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
								boolean firstStep=true;
                for (int i = 0; i < TOTAL; i++) {
									if(firstStep){
										out.println(numeroGenerado);
										System.out.println("Cliente[" + id + "]: Enviando número " + numeroGenerado);
										firstStep=false;
									}
                    out.println(numeroRecibido);
                    System.out.println("Cliente[" + id + "]: Enviando número " + numeroRecibido);
                }
            }
						
						Socket clientSocket = serverSocket.accept();
						BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
						for (int i = 0; i < TOTAL; i++) {
							String mensaje = in.readLine();
							System.out.println("Servidor[" + PUERTO_ID + "]: Recibí el número " + mensaje);
							numeroRecibido=Integer.parseInt(mensaje,10);
					}
        }
    }
}
