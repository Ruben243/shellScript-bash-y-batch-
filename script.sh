#!bin/bash

#Colores
Rojo="\e[31m"
Verde="\e[32m"
Azul="\e[34m"
NOCOLOR="\e[0m"

#Funcion que suma dos numeros enteros y muestra el mensaje
sumar_numeros(){

sum=$(($1 + $2))
echo -e "El resultado es ${Azul}$sum${NOCOLOR}"

}

#Funcion que crea un archivo,es necesario especificar la extension, y escribe #un texto dentro de el
crear_archivo(){
echo "$2"  > "$1"
echo -e "${Verde}el archivo $1 se ha creado con el mensaje '$2'${NOCOLOR}"
}

#Funcion que comprime un archivo
comprimir_archivo(){

if [ -e "$1" ];then
    tar -czvf "$1.tar.gz" "$1"
    echo -e "${Azul}El archivo $1 se ha comprimido en $1.tar.gz${NOCOLOR}"
else
   echo -e "${Rojo}El archivo no existe${NOCOLOR}"

fi
}

#Funcion que saluda al usuario
saludos(){
echo -e "Bienvenido ${Amarillo}$(whoami)${NOCOLOR} "
}

#Llamada a la funcion de Saludo
saludos
opcion="Entra"

#Bucle del menu
while [ $opcion != "Salir" ]; do

echo "¿Que desea hacer"
echo "Suma - Hacer una suma"
echo "Archivo - Crear archivo"
echo "Comprimir - Comprimir archivo"
echo "Salir"
read opcion

#Menu que ejecuta una funcion dependiendo del parameto opcion
case $opcion in

suma)
        echo "Introduzca el primer numero"
         read num1
        echo "Introduzca el segundo numero"
         read num2

   sumar_numeros $num1 $num2
;;

archivo)
       echo "Introduzca el nombre del archivo"
        read nombreArchivo
       echo "Escriba el texto"
        read text

   crear_archivo  $nombreArchivo "$text"

;;
comprimir)
        echo "Escriba el nombre del fichero a comprimir"
         read archivo

   comprimir_archivo $archivo
;;

 salir)
       echo -e "${Rojo}Saliendo${NOCOLOR}"
     exit 0
        ;;
    esac
    #fin del bulce

done

