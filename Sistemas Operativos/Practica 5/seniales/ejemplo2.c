#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>

int pid=0;
int i=0;

void manejador(int sig){
    pid = getpid();
    printf("5 segundos mas!!!\n");
}

int main() {
    if (signal(SIGALRM,manejador) == SIG_ERR) {
        printf("\nNo se puede cachar la senial: SIGALRM\n");
        exit(0);
    }

    while(1){
        alarm(5);
        pause();
    }
    return 1;
}

