#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char const *argv[])
{
    int i,v1,v2;
    pid_t raiz=getpid();
    char command[50];
    for(i=0;i<3;i++){
        if(fork()){
            if(fork()){
                wait(&v1);
                wait(&v2);
                int r1=0, r2=0;
                r1=WEXITSTATUS(v1);
                r2=WEXITSTATUS(v2);
                if(raiz==getpid()){
                    printf("\n\tSe crearon %d procesos\n\n",r1+r2+1);
                    printf("\n\tEl pid del proceso padre es %d", raiz);
                }
                exit(r1+r2+1);
            }
        }
    }
    sleep(1);
    exit(1);
    return 0;
}
