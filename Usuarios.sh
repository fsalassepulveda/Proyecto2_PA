#!/bin/bash
#INICIO

clear

OPCION=$1
USUARIO=$2


echo -e "-------------------------"
if [ $OPCION == "A" ];then

    awk 'BEGIN { print "Usuarios reales:  "} $3 >= 1000 { print "	- UID del usuario "$1" :" $3   | "sort -r"}' FS=":" /etc/passwd

elif [ $OPCION == "B" ];then

      cat /etc/passwd | grep -i "^$USUARIO" | awk 'BEGIN {print "Usuarios con inicial '$USUARIO': "} {sum +=1} sum != 0 {print "-" $1}' FS=":"

else
    echo -e "ERROR AL INGRESAR OPCION\nVuelva a ingresar"
fi

# ls -l | awk ' $3 == "flan" {sum += 1} END{print sum}'

