#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

void createFlowers(int,int);
void createFlower(int);

int main(int argc, char const *argv[]){
    if(argc!=4){
        printf("\n\tSe requieren tres argumentos (tallos, flores, petalos)\n");
        return 1;
    }
    
    int tallo, flores, petalos;

    tallo=atoi(argv[1]);
    flores=atoi(argv[2]);
    petalos=atoi(argv[3]);

    printf("\n\nLa flor tendrá un tallo de tamaño %d, con %d flores con %d pétalos cada una\n", tallo, flores, petalos);

    signal(SIGCHLD, SIG_IGN);

    int i,v;
    for(i=0;i<tallo;i++){
        if(fork()){
            if(i==tallo-1){
                createFlowers(flores, petalos);
            }
            while(1){sleep(1);}
            exit(0);
        }
    }

    exit(1);
    return 0;
}


void createFlowers(int flores,int petalos){
    int i,v;
    pid_t process_id = fork();

    if(process_id == 0){
        for(i=0;i<flores;i++){
            if(fork()){
                createFlower(petalos);
                while(1){sleep(1);}
                exit(0);
            }
        }
        exit(0);
    }
}

void createFlower(int petalos){
    int i;
    pid_t process_id = fork();

    if(process_id == 0){
        for(i=0;i<petalos;i++){
            if(!fork()){
                while(1){sleep(1);}
                exit(1);
            }
        }
    }
}