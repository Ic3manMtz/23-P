#!/bin/bash

echo 'Compiling the program flor'
gcc flor.c -o flor

echo 'Ingresa el número de procesos del tallo'
read tallo
echo 'Ingresa el número de procesos de las flores'
read flores
echo 'Ingresa el número de petalos'
read petalos

echo 'Running the program'
./flor $tallo $flores $petalos & 

get_leaf_processes() {
    local root_pid="$1"
    local child_pids=()
    local leaf_pids=()

    # Obtener todos los PIDs hijos del proceso raíz
    child_pids=($(pgrep -P "$root_pid"))

    # Si no hay PIDs hijos, el proceso raíz es una hoja en sí mismo
    if [[ ${#child_pids[@]} -eq 0 ]]; then
        leaf_pids+=("$root_pid")
    else
        # Recorrer los PIDs hijos para encontrar las hojas
        for child_pid in "${child_pids[@]}"; do
            # Obtener los PIDs hojas de los procesos hijos de manera recursiva
            leaf_pids+=($(get_leaf_processes "$child_pid"))
        done
    fi

    echo "${leaf_pids[@]}"
}

kill_child_processes() {
    local parent_pid="$1"

    # Obtener todos los PIDs hijos del proceso padre
    child_pids=($(pgrep -P "$parent_pid"))

    # Recorrer los PIDs hijos y matarlos de manera recursiva
    for child_pid in "${child_pids[@]}"; do
        kill_child_processes "$child_pid"
        kill -9 "$child_pid" &>/dev/null  # Matamos el proceso hijo y redirigimos la salida de error
    done
}

root_pid=$(ps -eo pid,comm | grep flor | head -n 1 | awk '{print $1}')

echo -e "Flor original"
pstree -cp $root_pid

root_process_id=$root_pid  # Reemplaza con el ID del proceso raíz deseado

while true; do
    child_pids=($(pgrep -P "$root_pid"))
    if [[ ${#child_pids[@]} -eq 0 ]]; then
        break
    else
        kill_child_processes "$root_process_id"
    fi

    echo -e '\nPodando flor...'
    sleep 1
    echo 'Flor podada'
    pstree -cp $root_pid
done

kill -9 $root_pid
echo -e '\nSe terminó la poda de la flor'


