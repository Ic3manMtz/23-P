package clases;

import java.io.*;
import java.net.*;
import java.util.Random;

class Process extends Thread {
	private int processId;
	private int puerto;
    private int siguientePuerto;
    private int numero;
    private static final String DIRECCION_SERVIDOR = "localhost";
	private static int contadorProcesos;
    
    private Process() {
    	this.processId=++Process.contadorProcesos;
    }

    public Process(int puerto) {
    	this();
    	this.puerto=puerto;
    	this.siguientePuerto=puerto+processId;
    	this.numero = new Random().nextInt(200) + 1;
    }
    
    public int get() {
    	return this.siguientePuerto;
    }

    //Servidor
    public void recibir() {
        try (ServerSocket serverSocket = new ServerSocket(puerto)) {
            System.out.println("Servidor iniciado y escuchando en el puerto: " + puerto);

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
        }catch(Exception e) {
        	e.printStackTrace();
        }
    }
    
    //Cliente
    public void enviar() {
        try (Socket socket = new Socket(DIRECCION_SERVIDOR, puerto)) {
            PrintWriter salida = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader entrada = new BufferedReader(new InputStreamReader(socket.getInputStream()));

            String mensaje = "Hola, Servidor!";
            salida.println(mensaje);
            System.out.println("Mensaje enviado al servidor: " + mensaje);

            String respuestaServidor = entrada.readLine();
            System.out.println("Respuesta del servidor: " + respuestaServidor);
        }catch(Exception e) {
        	e.printStackTrace();
        }
    }

	public static void main(String[] args) {
		//Process proceso1 = new Process(1234);
		//Process proceso2 = new Process(1235);
		System.out.println("Hola mundo");
	}
}
