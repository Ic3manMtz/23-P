import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.LockSupport;

public class Semaforo {
    private ConcurrentLinkedQueue<Thread> cola = new ConcurrentLinkedQueue<>();
    private final AtomicInteger estado;
    
    public Semaforo(int valor){
        if(valor<0){
            throw new IllegalArgumentException("El valor inicial del semáforo no puede ser negativo");
        }
        this.recursos=new AtomicInteger(valor);
    }

    public void sem_wait(){
        while(estado.get()==0){
            LockSupport.park();
        }

        estado.decrementAndGet();
    }

    public void sem_signal(){
        estado.incrementAndGet();
        LockSupport.unpark(Thread.currentThread());
    }
}
