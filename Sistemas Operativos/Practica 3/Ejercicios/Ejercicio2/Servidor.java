// Servidor
import java.io.*;
import java.net.*;

public class Servidor implements Runnable {
    static final int PUERTO = 12345;
    Socket s;

    public Servidor(){
        try{
            initServidor();
        }catch(Exception e){
            System.out.println("Error en el servidor: "+e.getMessage());
        }
    }

    public Servidor(Socket s) {
        this.s=s;
    }

    //SERVIDOR
    public void initServidor() throws Exception {
        ServerSocket sc;
        Socket so;

        try (ServerSocket serverSocket = new ServerSocket(PUERTO)) {
            System.out.println("\t[Servidor] Servidor iniciado correctamente");
            while(true) {
                System.out.println("\n[Servidor] Esperando una conexion:");
                so = serverSocket.accept();
                Servidor hilo = new Servidor(so);
                Thread tcliente = new Thread(hilo);
                tcliente.start();
                
                //Inicia el socket, ahora esta esperando una conexion por parte del cliente
                System.out.println("[Servidor] Un cliente se ha conectado.");
            }
        }
    }

    @Override
    public void run() {
        //Canales de entrada y salida de datos
        PrintWriter salida=null;
        String mensajeRecibido="";
        BufferedReader entrada=null;

        try {
            entrada = new BufferedReader(new InputStreamReader(s.getInputStream()));
            salida = new PrintWriter(s.getOutputStream(), true);
            
            System.out.println("[Servidor] Confirmando conexion al cliente....");
            String mensajeCliente = entrada.readLine();
            System.out.println("[Servidor] Recibido del cliente: " + mensajeCliente);
            System.out.println(mensajeRecibido);
            salida.println("[Servidor] Hola, Cliente! Recibí tu mensaje: " + mensajeCliente);
            System.out.println("[Servidor] Cerrando conexion...");
            s.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws IOException {        
        Servidor s = new Servidor();
    }
}