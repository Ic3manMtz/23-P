// Servidor
import java.io.*;
import java.net.*;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.Collections;

public class Servidor implements Runnable {
    static final int PUERTO = 12345;
    Socket s;
    static Set<String> mensajes = Collections.synchronizedSet(new LinkedHashSet<>());

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
            while(true) {
                System.out.println("[S] Esperando una conexion:");
                so = serverSocket.accept();
                Servidor hilo = new Servidor(so);
                Thread tcliente = new Thread(hilo);
                tcliente.start();
                
                //Inicia el socket, ahora esta esperando una conexion por parte del cliente
                System.out.println("[S] Un cliente se ha conectado.");
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
            
            System.out.println("[S] Confirmando conexion al cliente....");
            String nickname;
            while(true){
                nickname = entrada.readLine();
                if(mensajes.add(nickname)){
                    System.out.println("[S] Cliente agregado correctamente");
                    salida.println("true");
                    break;
                }else{
                    System.out.println("[S] Cliente ya existente, intente de nuevo");
                    salida.println("false");
                }
            }

            String mensaje = entrada.readLine();
            if(mensaje.equals("menu")){
                salida.println("[S:"+nickname+"] Bienvenido, las operaciones que puedes realizar son:\n\t-Sumar\n\t-Multiplicar\n\t-Restar\n\t-Dividir\nPara indicar una operacion escribe el nombre de la operacion seguida por los operandos");
            }

            String operacion = entrada.readLine();
            if(operacion.startsWith("sumar")){
                String[] operandos = operacion.split(" ");
                int resultadoSuma = sumar(operandos);
                salida.println(nickname + " Resultado suma: " + resultadoSuma);
            }

            // Ejemplo de multiplicación
            operacion = entrada.readLine();
            if(operacion.startsWith("multiplicar")){
                String[] operandos = operacion.split(" ");
                int resultadoMultiplicacion = multiplicar(operandos);
                salida.println(nickname + " Resultado multiplicación: " + resultadoMultiplicacion);
            }

            // Ejemplo de resta
            operacion = entrada.readLine();
            if(operacion.startsWith("restar")){
                String[] operandos = operacion.split(" ");
                int resultadoResta = restar(Integer.parseInt(operandos[1]), Integer.parseInt(operandos[2]));
                salida.println(nickname + " Resultado resta: " + resultadoResta);
            }

            // Ejemplo de división
            operacion = entrada.readLine();
            if(operacion.startsWith("dividir")){
                String[] operandos = operacion.split(" ");
                int resultadoDivision = dividir(Integer.parseInt(operandos[1]), Integer.parseInt(operandos[2]));
                salida.println(nickname + " Resultado división: " + resultadoDivision);
            }
            //System.out.println("[S] Cerrando conexion...");
            //s.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public int sumar(String[] operandos) {
        int suma = 0;
        for(int i = 1; i < operandos.length; i++) {
            suma += Integer.parseInt(operandos[i]);
        }
        return suma;
    }

    public int multiplicar(String[] operandos) {
        int multiplicacion = 1;
        for(int i = 1; i < operandos.length; i++) {
            multiplicacion *= Integer.parseInt(operandos[i]);
        }
        return multiplicacion;
    }

    private int restar(int a, int b){
        return a-b;
    }

    private int dividir(int a, int b){
        return a/b;
    }

    public static void main(String[] args) throws IOException {        
        Servidor s = new Servidor();
    }
}
