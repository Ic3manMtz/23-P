#include<stdio.h>
#include<signal.h>
#include<unistd.h>

void manejador(int sig){
    printf("Proceso %d Error!!!!!\n",getpid());
    raise (SIGKILL);
}


int main(){
    int contador=0;
    int r,a=0;
    if (signal(SIGFPE, manejador) == SIG_ERR)
        printf("\nNo se puede cachar la senial: SIGFPE,\n");


    while(contador<5) {
        printf("Proceso %d Hola!\n",getpid());
        sleep(1);
        contador++;
    }
    r=contador/a;
    return 1;
    
}
