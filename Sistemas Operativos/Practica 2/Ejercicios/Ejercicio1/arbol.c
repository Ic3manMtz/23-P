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

    int i,j,v,v1,v2;
    //Creación de la primer lista
    for(i=profundidad-1;i>=0;i-=2){
        if(fork()){
            break;
        }
    }

    //Se crea una lista a cada proceso de la primer lista
    for(j=i;j>=0;j--){
        if(fork()){
            break;
        }
    }
    
    if(getpid()!=root){
        if(j==0){
            exit(1);
        }
        
        if(i!=j){
            wait(&v);
            int r=WEXITSTATUS(v);
            exit(r+1);
        }

        if(i==j){
            wait(&v1);
            wait(&v2);
            int r1=WEXITSTATUS(v1);
            int r2=WEXITSTATUS(v2);
            exit(r1+r2+1);
        }
    }

    wait(&v1);
    wait(&v2);
    int r1=WEXITSTATUS(v1);
    int r2=WEXITSTATUS(v2);
    printf("\n\tSoy el procesos raíz con pid [%d] y he creado %d procesos\n",getpid(),r1+r2+1);

    return 0;
}
