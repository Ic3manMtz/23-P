#include<stdio.h>
#include<sys/stat.h>
#include<dirent.h>

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
        switch (ent->d_type) {
        case DT_REG:
            file_count++;
            printf("\nFile name %s", ent->d_name);
            mostrarMetaDatos(ent->d_name);
            break;

        case DT_DIR:
            dir_count++;
            break;

        default:
            break;
        }
    }

    closedir(dir);

    return 0;
}


int mostrarMetaDatos(char* archivo){
                printf("\nFile name in mostraraMetaDatos%s", archivo);

    struct stat fileStat;
    if(stat(archivo,&fileStat) < 0)    
        return 1;

    printf("Information for %s\n","test.txt");
    printf("---------------------------\n");
    printf("File Size: \t\t%ld bytes\n",fileStat.st_size);
    printf("Number of Links: \t%ld\n",fileStat.st_nlink);
    printf("File inode: \t\t%ld\n",fileStat.st_ino);

    printf("File Permissions: \t");
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

    printf("The file %s a symbolic link\n", (S_ISLNK(fileStat.st_mode)) ? "is" : "is not");
}