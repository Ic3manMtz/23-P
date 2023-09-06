#!/bin/bash

echo -e '\nLista de subdirectorios con su tamaño\n'

result=""

while IFS= read -r -d '' dir; do
    size=$(du -sh "$dir" 2>/dev/null | cut -f1)
    
    padded_dir=$(printf "%-40s" "$dir")
    padded_size=$(printf "%-5s" "$size")

    dir_length=${#padded_dir}
    size_length=${#padded_size}
    line=$(printf "%0.s-" $(seq 1 $(($dir_length + $size_length + 7))))
    
    result+="$line\n"
    result+="| $padded_dir | $padded_size |\n"
done < <(find . -mindepth 1 -type d -print0)

result+="$line\n"
echo -e "$result"
