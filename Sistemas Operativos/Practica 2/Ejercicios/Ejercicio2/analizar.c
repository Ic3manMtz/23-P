#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <dirent.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

int mostrarMetaDatos(char*);

int main(int argc, char const *argv[]){
    //Validamos el parámetro del programa
    if (argc != 2) {
        printf("Directorio no proporcionado, intenta de nuevo.\n");
        return 1;
    }

    //Guardamos el directorio ingresa en la variable directory
    const char *userInput = argv[1];
    char directory[256];
    strcpy(directory,userInput);

    //Abrimos el directorio ingresado
    DIR *dir;
    dir=opendir(directory);
    if(dir==NULL){
        printf("\n\tNo se pudo abrir el directorio ingresado, intente de nuevo");
        return 1;
    }

    //Leemos el primer archivo del directorio
    struct dirent *ent;
    ent=readdir(dir);
    int dir_count=0;

    pid_t root=getpid();

    while(ent!=NULL){
        if(strcmp(ent->d_name,".")!=0 && strcmp(ent->d_name,"..")!=0){
            if(ent->d_type == DT_REG){
                char file_path[256];
                int result = snprintf(file_path, sizeof(file_path), "%.*s/%s", (int)(sizeof(file_path) - strlen(directory) - 1), directory, ent->d_name);
                mostrarMetaDatos(file_path);
            }
            if(ent->d_type == DT_DIR){
                dir_count++;
                char file_path[256];
                int result = snprintf(file_path, sizeof(file_path), "%.*s/%s", (int)(sizeof(file_path) - strlen(directory) - 1), directory, ent->d_name);

                pid_t pid = fork();
                if(pid==0){
                    strcpy(directory,file_path);
                    dir=opendir(directory);
                    ent=readdir(dir);
                    continue;
                }
            }
        }
        ent=readdir(dir);
    }    

    if(getpid()!=root){
        exit(1);
    }

    int i,v;
    for(i=0;i<dir_count;i++){
        wait(&v);
    }

    closedir(dir);

    exit(1);
    return 0;
}

int mostrarMetaDatos(char* archivo){
    struct stat fileStat;
    if(stat(archivo,&fileStat) < 0)    
        return 1;

    printf("\nMetadatos del archivo %s\n",archivo);
    printf("\tTamaño: \t\t%ld bytes\n",fileStat.st_size);
    printf("\tNumero de Links: \t%ld\n",fileStat.st_nlink);
    printf("\tIdentificador inode: \t%ld\n",fileStat.st_ino);

    printf("\tPermisos: \t");
    printf( (S_ISDIR(fileStat.st_mode)) ? "d" : "-");
    printf( (fileStat.st_mode & S_IRUSR) ? "r" : "-");
    printf( (fileStat.st_mode & S_IWUSR) ? "w" : "-");
    printf( (fileStat.st_mode & S_IXUSR) ? "x" : "-");
    printf( (fileStat.st_mode & S_IRGRP) ? "r" : "-");
    printf( (fileStat.st_mode & S_IWGRP) ? "w" : "-");
    printf( (fileStat.st_mode & S_IXGRP) ? "x" : "-");
    printf( (fileStat.st_mode & S_IROTH) ? "r" : "-");
    printf( (fileStat.st_mode & S_IWOTH) ? "w" : "-");
    printf( (fileStat.st_mode & S_IXOTH) ? "x" : "-");
    printf("\n\n");
    return 0;
}