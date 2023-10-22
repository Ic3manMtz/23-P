// Servidor
import java.io.*;
import java.net.*;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.Collections;

public class Servidor implements Runnable {
    static final int PUERTO = 12345;
    Socket s;
    static Set<String> usuarios = Collections.synchronizedSet(new LinkedHashSet<>());

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
        BufferedReader entrada=null;
        String mensaje;
        String newLine=System.getProperty("line.separator");


        try {
            entrada=new BufferedReader(new InputStreamReader(s.getInputStream()));
            salida=new PrintWriter(s.getOutputStream(), true);
            
            System.out.println("[S] Confirmando conexion al cliente....");
            String nickname;
            while(true){
                nickname=entrada.readLine();
                if(usuarios.add(nickname)){
                    System.out.println("[S] Cliente agregado correctamente");
                    salida.println("true");
                    break;
                }else{
                    System.out.println("[S] Cliente ya existente, intente de nuevo");
                    salida.println("false");
                }
            }
            
            while (true) {
                salida.println("[S:"+nickname+"] Bienvenido, las operaciones que puedes realizar son:"+newLine+"\t1.-Sumar"+newLine+"\t2.-Multiplicar"+newLine+"\t3.-Restar"+newLine+"\t4.-Dividir"+newLine+"\t5.-Salir");
                mensaje=entrada.readLine();
                    
                switch (mensaje) {
                    case "1":
                        salida.println("[S:"+nickname+"] Ingresa los numeros a sumar separados por una coma");
                        String[] operandosSuma = entrada.readLine().split(",");
                        int resultadoSuma = sumar(operandosSuma);
                        salida.println("[S:"+nickname+"] Resultado suma: " + resultadoSuma);
                    break;
                    case "2":
                        salida.println("[S:"+nickname+"] Ingresa los numeros a multiplicar separados por una coma");
                        String[] operandosMultiplicacion = entrada.readLine().split(",");
                        int resultadoMultiplicacion = multiplicar(operandosMultiplicacion);
                        salida.println("[S:"+nickname+"] Resultado multiplicación: " + resultadoMultiplicacion);
                    break;
                    case "3":
                        salida.println("[S:"+nickname+"] Ingresa los números a restar separados por una coma");
                        String[] operandosResta = entrada.readLine().split(",");
                        
                        if (operandosResta.length == 2) {
                            int num1 = Integer.parseInt(operandosResta[0]);
                            int num2 = Integer.parseInt(operandosResta[1]);
                            int resultadoResta = restar(num1, num2);
                            salida.println("[S:"+nickname+"] Resultado resta: " + resultadoResta);
                        } else {
                            salida.println("[S:"+nickname+"] Debes ingresar exactamente dos números separados por una coma.");
                        }
                    break;
                    case "4":
                    salida.println("[S:" + nickname + "] Ingresa los números a dividir separados por una coma");
                    String[] operandosDivision = entrada.readLine().split(",");
                    
                    if (operandosDivision.length == 2) {
                        int num1 = Integer.parseInt(operandosDivision[0]);
                        int num2 = Integer.parseInt(operandosDivision[1]);
                    
                        if (num2 != 0) {
                            double resultadoDivision = dividir(num1, num2);
                            salida.println("[S:"+nickname+"] Resultado división: " + resultadoDivision);
                        } else {
                            salida.println("[S:"+nickname+"] El segundo número no puede ser cero.");
                        }
                    } else {
                        salida.println("[S:"+nickname+"] Debes ingresar exactamente dos números separados por una coma.");
                    }
                    
                    case "5":
                        usuarios.remove(nickname);
                        salida.println("[S:"+nickname+"] Te has desconectado.");
                        System.out.println("[S] Se ha desconectado el usuario "+nickname);
                        s.close();
                    return;
                    default:
                        salida.println("[S:"+nickname+"] Opción inválida. Intenta nuevamente.");
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private int sumar(String[] operandos) {
        int suma = 0;
        for(int i = 1; i < operandos.length; i++) {
            suma += Integer.parseInt(operandos[i]);
        }
        return suma;
    }

    private int multiplicar(String[] operandos) {
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
