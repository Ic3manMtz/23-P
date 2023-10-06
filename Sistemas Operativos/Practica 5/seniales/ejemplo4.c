#include<stdio.h>
#include<signal.h>
#include<unistd.h>

void manejador(int sig){

    switch(sig){
        case SIGKILL:
            printf("Evento: SIGKILL\n");
            break;
        case SIGSTOP:         
            printf("Evento: SIGSTOP\n");
            break;
        case SIGTSTP:
            printf("Evento: SIGTSTP\n");
            break;
    }
}

int main(){
    
    if (signal(SIGKILL, manejador) == SIG_ERR)
        printf("\nNo se puede cachar la senial: SIGKILL\n");
    if (signal(SIGSTOP, manejador) == SIG_ERR)
        printf("\nNo se puede cachar la senial: SIGSTOP\n");
    if (signal(SIGTSTP, manejador) == SIG_ERR)
        printf("\nNo se puede cachar la senial: SIGSTOP\n");

    while(1) {
        printf("Proceso %d Hola!\n",getpid());
        sleep(1);
    }
    return 1;
}
