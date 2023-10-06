import java.io.*;
import java.net.*;

public class Cliente {
    public static void main(String[] args) throws IOException {
        final String DIRECCION_SERVIDOR = "localhost";
        final int PUERTO = 12345;

        try (Socket socket = new Socket(DIRECCION_SERVIDOR, PUERTO)) {
            PrintWriter salida = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader entrada = new BufferedReader(new InputStreamReader(socket.getInputStream()));

            // Esperar el mensaje del servidor
            String respuestaServidor = entrada.readLine();
            System.out.println(respuestaServidor);

            BufferedReader userInput = new BufferedReader(new InputStreamReader(System.in));

            String nombre;
            do {
                System.out.print("Introduce tu nombre: ");
                nombre = userInput.readLine();
                salida.println(nombre);
                respuestaServidor = entrada.readLine();
                System.out.println(respuestaServidor);
            } while (respuestaServidor.equals("El nombre ya está en uso, por favor elige otro:"));

            boolean continuar = true;
            while (continuar) {
                respuestaServidor = entrada.readLine();
                System.out.println(respuestaServidor);

                String opcion = userInput.readLine();
                salida.println(opcion);

                if (opcion.equals("0")) {
                    respuestaServidor = entrada.readLine();
                    System.out.println(respuestaServidor);
                    continuar = false;
                } else if (opcion.equals("1") || opcion.equals("3")) {
                    respuestaServidor = entrada.readLine();
                    System.out.println(respuestaServidor);
                    
                    String cantidad = userInput.readLine();
                    salida.println(cantidad);
                    
                    int n = Integer.parseInt(cantidad);
                    for (int i = 0; i < n; i++) {
                        respuestaServidor = entrada.readLine();
                        System.out.println(respuestaServidor);
                        String num = userInput.readLine();
                        salida.println(num);
                    }
                    respuestaServidor = entrada.readLine();
                    System.out.println(respuestaServidor);
                } else if(opcion.equals("2") || opcion.equals("4")){
                    for (int i = 0; i < 2; i++) {
                        respuestaServidor = entrada.readLine();
                        System.out.println(respuestaServidor);
                        String num = userInput.readLine();
                        salida.println(num);
                    }
                    respuestaServidor = entrada.readLine();
                    System.out.println(respuestaServidor);
                }
                else
                {
                    respuestaServidor = entrada.readLine();
                    System.out.println(respuestaServidor);
                }
            }
        }
    }
}
