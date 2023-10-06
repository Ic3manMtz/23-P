import java.io.*;
import java.net.*;
import java.util.ArrayList;
import java.util.List;

public class ServidorMultiHilado implements Runnable {

    static final int PUERTO = 12345;
    Socket s;
    static List<String> nombres = new ArrayList<>();  // Lista de nombres

    public ServidorMultiHilado() {
        try {
            initServidor();
        } catch (Exception e) {
            System.out.println("Error en el servidor: " + e.getMessage());
        }
    }

    public ServidorMultiHilado(Socket s) {
        this.s = s;
    }

    public void initServidor() throws Exception {
        try (ServerSocket serverSocket = new ServerSocket(PUERTO)) {
            while (true) {
                System.out.println("Esperando una conexion:");
                Socket so = serverSocket.accept();
                ServidorMultiHilado hilo = new ServidorMultiHilado(so);
                Thread tcliente = new Thread(hilo);
                tcliente.start();
                System.out.println("Un cliente se ha conectado.");
            }
        }
    }

    @Override
    public void run() {
        PrintWriter salida = null;
        BufferedReader entrada = null;

        try {
            entrada = new BufferedReader(new InputStreamReader(s.getInputStream()));
            salida = new PrintWriter(s.getOutputStream(), true);

            System.out.println("Confirmando conexion al cliente....");
            salida.println("Servidor: Por favor, introduce tu nombre:");

            String nombreCliente = entrada.readLine();

            boolean nombreValido = false;
    
            // Acceso exclusivo al punto crítico
            while (!nombreValido) {
                synchronized (nombres) {
                    if (!nombres.contains(nombreCliente)) {
                        nombres.add(nombreCliente);
                        nombreValido = true;
                    }
                }
    
                if (!nombreValido) {
                    salida.println("El nombre ya está en uso, por favor elige otro:");
                    nombreCliente = entrada.readLine();
                }
            }

            salida.println(nombreCliente +": Estás adentro!");

            while (true) {
                salida.println(nombreCliente +": Por favor, introduce una opción 1 para sumar n numeros || 2 para restar 2 numeros|| 3 multiplicar n numeros ||4 para dividir 2 numeros||0 salir");
                String opcionStr = entrada.readLine();
            
                switch (opcionStr) {
                    case "0":
                        synchronized (nombres) {
                            nombres.remove(nombreCliente);
                        }
                        salida.println(nombreCliente +": Te has desconectado.");
                        s.close();
                        return;
                    case "1":
                    case "3":
                        if(opcionStr.equals("1")) {
                            salida.println(nombreCliente +": ¿Cuántos números deseas sumar?");
                        } else {
                            salida.println(nombreCliente +": ¿Cuántos números deseas multiplicar?");
                        }
            
                        int cantidad = Integer.parseInt(entrada.readLine());
                        double resultado = (opcionStr.equals("1")) ? 0 : 1;
            
                        for (int i = 0; i < cantidad; i++) {
                            salida.println(nombreCliente +": Introduce el número " + (i + 1) + ":");
                            double num = Double.parseDouble(entrada.readLine());
            
                            if (opcionStr.equals("1")) {
                                resultado += num;
                            } else {
                                resultado *= num;
                            }
                        }
            
                        salida.println(nombreCliente + ": El resultado es: " + resultado);
                        break;
                    case "2":
                    case "4":
                        salida.println(nombreCliente + ": Introduce el primer número:");
                        double num1 = Double.parseDouble(entrada.readLine());
                        salida.println(nombreCliente +": Introduce el segundo número:");
                        double num2 = Double.parseDouble(entrada.readLine());
                        resultado = 0;
            
                        switch (opcionStr) {
                            case "2":
                                resultado = num1 - num2;
                                break;
                            case "4":
                                if (num2 != 0) {
                                    resultado = num1 / num2;
                                } else {
                                    salida.println(nombreCliente + ": Error: División por cero.");
                                    continue;
                                }
                                break;
                            default:
                                salida.println(nombreCliente +": Opción no reconocida. Intenta nuevamente.");
                                break;
                        }
                        salida.println(nombreCliente + ": El resultado es: " + resultado);
                        break;
                    default:
                        salida.println(nombreCliente +": Opción no reconocida. Intenta nuevamente.");
                        break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (s != null) s.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) throws IOException {
        new ServidorMultiHilado();
    }
}
