#include<stdio.h>
#include<signal.h>
#include<unistd.h>

void manejador(int signo){
 
    printf("\n%d :)\n",getpid());
}

int main(){
  if (signal(SIGINT, manejador) == SIG_ERR)
         printf("\nNo se puede cachar la senial: SIGINT\n");
 
  while(1) 
    sleep(1);

  return 1;
}
