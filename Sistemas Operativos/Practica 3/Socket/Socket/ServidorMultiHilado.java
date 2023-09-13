// Servidor
import java.io.*;
import java.net.*;

public class ServidorMultiHilado implements Runnable {
    static final int PUERTO = 12345;
    Socket s;

    public ServidorMultiHilado(){
        try{
            initServidor();
        }catch(Exception e){
            System.out.println("Error en el servidor: "+e.getMessage());
        }
    }

    public ServidorMultiHilado(Socket s) {
        this.s=s;
    }

    //SERVIDOR
    public void initServidor() throws Exception {
        ServerSocket sc;
        Socket so;

        try (ServerSocket serverSocket = new ServerSocket(PUERTO)) {
            while(true) {
                System.out.println("Esperando una conexion:");
                so = serverSocket.accept();
                ServidorMultiHilado hilo = new ServidorMultiHilado(so);
                Thread tcliente = new Thread(hilo);
                tcliente.start();
                
                //Inicia el socket, ahora esta esperando una conexion por parte del cliente
                System.out.println("Un cliente se ha conectado.");
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
            
            System.out.println("Confirmando conexion al cliente....");
            String mensajeCliente = entrada.readLine();
            System.out.println("Recibido del cliente: " + mensajeCliente);
            System.out.println(mensajeRecibido);
            salida.println("Hola, Cliente! Recibí tu mensaje: " + mensajeCliente);
            System.out.println("Cerrando conexion...");
            s.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws IOException {        
        ServidorMultiHilado s = new ServidorMultiHilado();
    }
}