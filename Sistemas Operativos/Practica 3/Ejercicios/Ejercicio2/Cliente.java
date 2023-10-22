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
            String mensajeRecibido, mensajeEnviado;

            do{
                System.out.println("[C] Ingresa tu nickname...");
                mensajeEnviado=scanner.nextLine();
                salida.println(mensajeEnviado);
                System.out.println("[C] Mensaje enviado al servidor: " + mensajeEnviado);

                mensajeRecibido=entrada.readLine();
            }while(mensajeRecibido.equals("false"));

            do{
                while ((mensajeRecibido = entrada.readLine()) != null) {
                System.out.println(mensajeRecibido);

                    if(mensajeRecibido.contains("Salir")){
                        break;
                    }
                }
            
                while(true){
                    mensajeEnviado=scanner.nextLine();
                    salida.println(mensajeEnviado);
                    mensajeRecibido=entrada.readLine();

                    if(mensajeRecibido.contains("Operación inválida")){
                        System.out.println(mensajeRecibido);
                        continue;
                    }else{
                        System.out.println(mensajeRecibido);
                        break;
                    }
                }

                String operandos = scanner.nextLine();
                salida.println(operandos);
                String resultado = entrada.readLine();
                System.out.println(resultado);
            }while(!mensajeRecibido.contains("desconectado"));
        }
        
        scanner.close();
    }
}
