#!/bin/bash
echo "1ngrese el nombre del directorio o fichero que desea  buscar"
cd $HOME
val="$(find $HOME | grep "$1$")"
echo "El elemento existe en esta ruta: "  $val
result="$(file $val)"
echo "El fichero es de tipo: " $result



