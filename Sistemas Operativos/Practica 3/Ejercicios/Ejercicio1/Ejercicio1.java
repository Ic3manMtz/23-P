import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Random;

class Process extends Thread {
    private Socket socket;
    private DataInputStream in;
    private DataOutputStream out;
    private int sum;

    public Process(Socket socket) {
        this.socket = socket;
        this.sum = new Random().nextInt(100); // Genera un valor aleatorio
    }

    public void run() {
        try {
            in = new DataInputStream(socket.getInputStream());
            out = new DataOutputStream(socket.getOutputStream());

            while (true) {
                int receivedValue = in.readInt(); // Recibe el valor del proceso anterior
                sum += receivedValue; // Suma el valor recibido al valor actual
                out.writeInt(sum); // Envía el valor actual al siguiente proceso
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

public class Ejercicio1 {
    public static void main(String[] args) {
        int N = 4; // Número de procesos
        Process[] processes = new Process[N];

        // Crea los procesos y los sockets de conexión
        for (int i = 0; i < N; i++) {
            Socket socket = new Socket("localhost", 8000 + i);
            processes[i] = new Process(socket);
        }

        // Inicia los procesos
        for (Process process : processes) {
            process.start();
        }
    }
}
