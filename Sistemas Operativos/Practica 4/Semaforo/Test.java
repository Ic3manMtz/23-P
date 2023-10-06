import java.util.Scanner;
import java.util.concurrent.Semaphore;

public class Test {
    static Semaforo datoListo = new Semaforo(0);
    static Semaforo trabajadorListo = new Semaforo(1);
    static int dato = 0;

    public static void main(String[] args) {
        int iteraciones = 4;

        Thread thread1 = new Thread(new LeeRunnable(iteraciones));
        Thread thread2 = new Thread(new ProcesaRunnable(iteraciones));

        thread1.start();
        thread2.start();

        try {
            thread1.join();
            thread2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    static class LeeRunnable implements Runnable {
        int iteraciones;

        public LeeRunnable(int iteraciones) {
            this.iteraciones = iteraciones;
        }

        public void run() {
            for (int i = 0; i < iteraciones; i++) {
                trabajadorListo.sem_wait();
                System.out.print("Lector: Dame el siguiente número a procesar: ");
                Scanner scanner = new Scanner(System.in);
                dato = scanner.nextInt();
                System.out.println("Lector: Recibí " + dato);
                datoListo.sem_post();                
            }
        }
    }

    static class ProcesaRunnable implements Runnable {
        int iteraciones;

        public ProcesaRunnable(int iteraciones) {
            this.iteraciones = iteraciones;
        }

        public void run() {
            for (int i = 0; i < iteraciones; i++) {
                datoListo.sem_wait();
                System.out.println("Trabajador: procesaré " + dato);
                trabajadorListo.sem_post();
            }
        }
    }
}
