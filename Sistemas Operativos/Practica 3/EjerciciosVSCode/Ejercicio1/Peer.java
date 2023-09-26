import java.io.*;
import java.net.*;
import java.util.Random;
import java.util.Scanner;

public class Peer{
	private static final String HOST="localhost";
	private static final int PUERTO=6000;
	private static int numero;
	private static int suma;

	public static void main(String[] args) throws IOException{
		int id=Integer.parseInt(args[0]);
		int TOTAL=Integer.parseInt(args[1]);
		int PUERTO_ID=PUERTO+id;
		int VECINO=((id+1)%TOTAL)+PUERTO;
		numero=new Random().nextInt(100);
		suma=numero;

		//Modo Servidor
		try(ServerSocket serverSocket=new ServerSocket(PUERTO_ID)){
			System.out.println("Servidor["+PUERTO_ID+"]: Escuchando en el puerto "+PUERTO_ID);

			try{
				Thread.sleep(3000);
			}catch(Exception e){
				e.printStackTrace();
			}

			System.out.println("Puerto: "+PUERTO_ID+" Vecino: "+VECINO);

			//Modo cliente
			try(Socket clientSocket=new Socket(HOST, VECINO)){
				PrintWriter out=new PrintWriter(clientSocket.getOutputStream(), true);
				BufferedReader in=new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));

				for(int i=0; i<TOTAL-1; i++){
					System.out.println("Cliente["+id+"]: Enviando número "+numero);
					out.println(suma);
				}

			}

			Socket clientSocket = serverSocket.accept();

			PrintWriter out=new PrintWriter(clientSocket.getOutputStream(), true);
			BufferedReader in=new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));

			String mensaje;
			while((mensaje=in.readLine())!=null){
				System.out.println("Servidor["+PUERTO_ID+"]: Recibí el número "+mensaje+" Numero: "+numero);
				int numeroRecibido=Integer.parseInt(mensaje);
				suma+=numeroRecibido;
				out.println(suma++);
			}
		}
	}
}