import java.util.concurrent.locks.ReentrantLock; 

class Suma implements Runnable{ 
	static final int N=200000;
	static int suma=0;
	private String nombre; 
	private ReentrantLock re; //Candado en Java
	private Candado ca;

	public Suma(ReentrantLock rt, String n) { 
		this.re = rt; 
		this.nombre = n; 
	} 

	public Suma(Candado ca, String n){
		this.ca=ca;
		this.nombre=n;
	}

	public void run() { 
		System.out.println("Hilo: "+nombre);
		for(int i=0;i<N;i++){
			//while(!re.tryLock()){}
			ca.lock();
			suma++;
			ca.unlock();
			//re.unlock();
		}
	} 
} 
