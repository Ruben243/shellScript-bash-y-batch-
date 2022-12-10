#! /bin/bash 
#shebang

#Author:Ruben-GFP
#Fecha:10/12/2022
#Descripcion: Script en bash para sumar numeros,crear carpetas y archivos,#actualizar respositorios y sistema

#Colores disponibles para las fuentes
Rojo="\e[31m"
Verde="\e[32m"
Azul="\e[34m"
NOCOLOR="\e[0m"

#opciones una variable de control inicializada para que entre en el bucle,que #luego se usara para elegir las opciones
opcion="entra"
#Da la bienvenida personaliozada usando el comando whoami
echo -e "Bienvenido,${Amarillo}$(whoami)${NOCOLOR}"
#inicio del bucle.La condicion de entrada es que opcion sea distinto de salir
while [ $opcion != "Salir" ]; do
    echo "¿Que desea hacer?"
    echo "update-  Actualia  los respositorios del sistema"
    echo "upgrade- Actualiza los programas del sistema"
    echo "limpiar- Limpia el sistema"
    echo "sumar- suma dos numeros"
    echo "carpeta- crea una carpeta en la Home"
    echo "archivo- crea un archivo en Documentos y permite escribir en el"
    echo -e "${Amarillo}salir- Sale del programa${NOCOLOR}"
    #read indica que debe coger el valor que escribas en la terminal
    read opcion

    #Menu que elegira una opcion segun lo que escribas
    case $opcion in

#Esta opcion actualiza los repositorios del sistema
    update)
        sudo apt update
        echo -e "${Azul}Respositorios actualizandos${NOCOLOR}"
        ;;

#Esta opcion actualiza el sistema
    upgrade)
        sudo apt upgrade
        echo -e "${Azul}Aplicaciones actualiadas${NOCOLOR}"

        ;;
#Esta opcion limpia el sistema desinstalando los programas que no son necesarios
    limpiar)
        sudo apt autoremove
        echo -e "${Azul}Todo Limpio${NOCOLOR}"

        ;;
#Esta opcion suma dos numeros enteros y muestra el resultado
    sumar)
        echo "Introduzca el primer numero"
        read num1
        echo "Introduzca el segundo numero"
        read num2
        resultado=$(($num1 + $num2))
        echo -e "${Azul}El resultado es: $resultado${NOCOLOR}"
        ;;
#Esta opcion creara una carpeta en la home del usuario que ejecute el script
    carpeta)
        echo -e "${Verde}Esta opcion creara una carpeta en su Home ¿Esta de acuerdo?si/no${NOCOLOR}"
        read opc
        if [ $opc == "si" ]; then
            cd /home/"$(whoami)"
            echo "¿Que nombre le quiere poner?"
            read carpeta
            if [ ! -d $carpeta ]; then
                mkdir "$carpeta"
                if [ -d $carpeta ]; then
                    echo -e "${Azul}Carpeta creada${NOCOLOR}"
                fi
            else
                echo -e "${Rojo}El nombre de la carpeta ya existe${NOCOLOR}"
            fi

        else
            echo -e "${Rojo}Cancelando ${NOCOLOR}"
        fi
        ;;
#Esta opcion creara un archivo en la carpeta de cocumentos
    archivo)
        echo -e "${Verde}Esta opcion creara un archivo en la carpeta de Documentos,si ya existe lo abrira¿Esta de acuerdo?si/no${NOCOLOR}"
        read opc
        if [ $opc == "si" ]; then
           #usando el comando whoami se asegura que funcionara #independientemente del usuario que ejecute el script
            cd /home/"$(whoami)"/Documentos
            echo "¿Que nombre le quiere poner?"
            read archivo
            nano "$archivo"
            echo -e "${Azul}Archivo creado${NOCOLOR}"

        else
            echo -e "${Rojo}Cancelando ${NOCOLOR}"
        fi
        ;;

#Esta opcion lista todo los archivos de la home recursivamente y los muestra en #forma de arbol
    listar)
        tree /home/"$(whoami)" -r
        ;;
#Sale del programa
    salir)
        echo -e "${Rojo}Saliendo${NOCOLOR}"
        exit 0
        ;;
    esac
    #fin del menu

done
#Fin del bucle while
