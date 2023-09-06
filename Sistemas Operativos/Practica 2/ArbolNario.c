#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char const *argv[])
{
    if (argc < 2){
        printf("Por favor ingresa el número de hijos como argumento en la línea de comandos.\n");
        return 1;
    }
    int numHijos = atoi(argv[1]);
    if (numHijos <= 0){
        printf("The number of child processes must be a positive integer.\n");
        return 1;
    }

    int i,j,k,v,r;
    pid_t raiz=getpid();

    for(i=0;i<3;i++){
        for(j=0;j<numHijos;j++){
            if(fork()){
                int totalHijos;
                for(k=0;k<numHijos;k++){
                    wait(&v);
                    r=WEXITSTATUS(v);
                    totalHijos+=r;
                }

                if(raiz==getpid()){
                    printf("\n\tSe crearon %d procesos\n\n",v+1);
                }

                exit(totalHijos+1);
            }

        }
    }
    sleep(1);
    exit(1);
    return 0;
}
