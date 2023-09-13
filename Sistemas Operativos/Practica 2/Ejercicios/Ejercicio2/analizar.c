#include<stdio.h>
#include<stdlib.h>
#include<sys/stat.h>
#include<dirent.h>
#include<string.h>

int mostrarMetaDatos(char*);

int main(int argc, char const *argv[]){
    DIR *dir;
    struct dirent *ent;
    int file_count = 0;
    int dir_count = 0;

    if (argc != 2) {
        printf("Directorio no proporcionado, intenta de nuevo.\n");
        return 1;
    }

    const char *directorio = argv[1];

    dir = opendir(directorio);
    if (dir == NULL) {
        printf("Could not open directory.\n");
        return 1;
    }

    while ((ent = readdir(dir)) != NULL) {
        if(ent->d_type == DT_REG){
            char file_path[256];
            int result = snprintf(file_path, sizeof(file_path), "%.*s/%s", (int)(sizeof(file_path) - strlen(directorio) - 1), directorio, ent->d_name);
            mostrarMetaDatos(file_path);
        }
        
        if(ent->d_type == DT_DIR){
            dir_count++;
            char file_path[256];
            int result = snprintf(file_path, sizeof(file_path), "%.*s/%s", (int)(sizeof(file_path) - strlen(directorio) - 1), directorio, ent->d_name);
            printf("\nRuta del directorio %s \n",file_path);

            //fork();
        }
    }

    //wait
    int i,v;
    for(i=0;i<dir_count;i++){
        wait(&v);
        printf("\nNumero de directorios encontrados %d\n",dir_count);
        closedir(dir);
    }

    return 0;
}

int mostrarMetaDatos(char* archivo){
    struct stat fileStat;
    if(stat(archivo,&fileStat) < 0)    
        return 1;

    printf("\nMetadatos del archivo %s\n",archivo);
    printf("\tTamaño: \t\t%ld bytes\n",fileStat.st_size);
    printf("\tNumero de Links: \t%ld\n",fileStat.st_nlink);
    printf("\tIdentificador inode: \t\t%ld\n",fileStat.st_ino);

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