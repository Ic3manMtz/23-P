import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.LockSupport;

public class Semaforo {
    private final AtomicInteger estado;
    private ConcurrentLinkedQueue<Thread> cola = new ConcurrentLinkedQueue<>();
    @SuppressWarnings("unused")
    private Thread propietario=null;
    
    public Semaforo(int valor){
        if(valor<0){
            throw new IllegalArgumentException("El valor inicial del semáforo no puede ser negativo");
        }
        this.estado=new AtomicInteger(valor);
    }

    public void sem_wait(){
        Thread hilo = Thread.currentThread();
        cola.add(hilo);

        while(cola.peek() != hilo || estado.get()<=0){
            LockSupport.park();
        }

        estado.decrementAndGet();
        propietario=cola.remove();
    }

    public void sem_post(){
        estado.incrementAndGet();
        LockSupport.unpark(cola.peek());
    }
}
