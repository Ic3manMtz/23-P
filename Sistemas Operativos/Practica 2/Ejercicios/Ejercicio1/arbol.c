#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

int main(int argc, char const *argv[]){
    if(argc!=2){
        printf("\n\tSe requiere la profundidad para ejecutar el programa\n");
        return 1;
    }

    int profundidad=atoi(argv[1]);

    int i,j,v;
    for(i=profundidad-1;i>=0;i-=2){
        if(fork()){
            wait(&v);
            printf("\nMi id es %d y mi pid es [%d]",i, getpid());
            break;
        }
    }

    if(i>=0){
        pid_t process_id = fork();

        if(process_id == 0){
            for(j=0;j<i;j++){
                if(!fork()){
                    while(1){sleep(1);}
                    exit(1);
                }
            }
        }
    }

    return 0;
}
