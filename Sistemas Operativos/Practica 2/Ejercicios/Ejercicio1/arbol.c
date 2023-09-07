#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

void createChildren(int);

int main(int argc, char const *argv[]){
    if(argc!=2){
        printf("\n\tSe requiere la profundidad para ejecutar el programa\n");
        return 1;
    }

    int profundidad=atoi(argv[1]);
    pid_t root = getpid();

    int i,j,v;
    //Creación de la primer lista
    for(i=profundidad-1;i>=0;i-=2){
        if(fork()){
            wait(&v);
            printf("\nMi id es %d y mi pid es [%d]\n",i, getpid());
            break;
        }
    }

    //Se crea una lista a cada proceso de la primer lista
    if(i>=0){
        for(j=i-1;j>=0;j--){
            if(fork()){
                wait(&v);
                printf("Id[%d]->Padre Id[%d]\t(i,j)=(%d,%d)\n",getpid(),getppid(),i,j);
                break;
            }
        }
    }

    if(i==0){
        char comando[100];
        sprintf(comando, "pstree -p %d", root);

        // Ejecutar el comando Bash
        system(comando);
    }
    
    return 0;
}
