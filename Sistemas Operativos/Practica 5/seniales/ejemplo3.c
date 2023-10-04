#include <sys/types.h>
#include <signal.h>
#include <unistd.h>
#include <stdio.h>

void manejador (int senial){
   printf("Senial del padre\n");
}

int main(){
   int pid=fork();
   if(pid == 0){
      signal(SIGUSR1, manejador);
         while(1)
            pause ();
   }else{
      while(1){
         sleep(1);
         kill(pid, SIGUSR1);
      }
   }
}



