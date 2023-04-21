@echo off
:: Nombre del archivo: menu.bat
:: Descripción:Este archivo despliega un menu con distintas opciones
:: Autor: Rubén Ginés
:: Fecha de creación: 21/04/2023



REM ************Marca el incio del bucle
:menu

REM ***********Limpia la pantalla
cls

REM ********** Muestra el menu de opciones

@echo Menu de opciones:

echo 1. Informacion del usuario y sistema

echo 2. Informacion de la red a la que esta conectado

echo 3. Crear una carpeta en el escritorio

echo 4. Crear un archivo en Documentos

echo 5. Salir

set /p opt=Elige una opcion :

REM Inicio de la estructura de control condicional
if %opt%==1 goto:opt1

if %opt%==2 goto:opt2

if %opt%==3 goto:opt3
	
	
if %opt%==4 goto:opt4

if %opt%==5 goto:opt5

REM ********Opcion que Muestra la idel usuario y del equipo*******

:opt1
REM '%USERNAME%: Nombre de usuario actual
REM '%USERDOMAIN%: Nombre del dominio al que pertenece el usuario actual
REM %USERPROFILE%: Ruta de acceso al perfil de usuario actual
REM %HOMEDRIVE%: Unidad de disco en la que se encuentra el directorio de inicio del usuario actual
REM %HOMEPATH%: Ruta de acceso al directorio de inicio del usuario actual
REM %LOGONSERVER%: Nombre del servidor al que se conectó el usuario actual en el inicio de sesión
REM %COMPUTERNAME%: Nombre del equipo actual
REM %OS%: Nombre del sistema operativo actual
REM %PROCESSOR_ARCHITECTURE%: Arquitectura del procesador del equipo actual
REM %NUMBER_OF_PROCESSORS%: Número de procesadores lógicos en el equipo actual
	echo Nombre de usuario: %USERNAME%
	echo Dominio de usuario: %USERDOMAIN%
	echo Ruta del perfil de usuario: %USERPROFILE%
	echo Unidad de disco del directorio de inicio: %HOMEDRIVE%
	echo Ruta del directorio de inicio: %HOMEPATH%
	echo Servidor de inicio de sesión: %LOGONSERVER%
	echo Nombre del equipo: %COMPUTERNAME%
	echo Sistema operativo: %OS%
	echo Arquitectura del procesador: %PROCESSOR_ARCHITECTURE%
	echo Numero de procesadores: %NUMBER_OF_PROCESSORS%
pause

REM Regresa al incio del menu
goto:menu


REM ******Muesta la informacion conexion de red********

:opt2
 ipconfig
 pause
 goto:menu
 
 
REM *********Permite elegir entre unas ubucaciones y crea una archivo*************
:opt3
    REM Valores por defecto
    set directorio=escritorio
	set nombreCarpeta=%date:~-4,4%%date:~-7,2%%date:~-10,2%%TIME:~6,2%
	set /p directorio=Elige una opcion para guardar la carpeta(escritorio,documentos, home)
	REM  Pide el nombre de la carpeta
	set /p nombreCarpeta=Nombra tu carpeta
	if exist %nombreCarpeta%  goto:sinDefinir
	REM Estructura de control que crea el directorio en la ruta elegida
	if %directorio% == escritorio  md %USERPROFILE%\Desktop\%nombreCarpeta%
		
	if %directorio% == documentos md %USERPROFILE%\Documents\%nombreCarpeta%
		
	if %directorio% == inicio md %USERPROFILE%\%nombreCarpeta
	
REM Aviso para el usuario
echo Creando la carpeta %nombreCarpeta%..
echo La carpeta %nombreCarpeta% ha creado correctamente.
pause
 goto:menu
 
REM ********** Crea un archivo de texto en Documentos***********
:opt4
	REM Valores por defecto
	set nombreArchivo=%date:~-4,4%%date:~-7,2%%date:~-10,2%%TIME:~6,2%
	set /p contenido=Introduce el contenido del archivo:
	REM Si el nombre esta vacio le asigna la fecha, si no el nombre asignado por el usuario
	set /p nombreArchivo=nombra tu archivo:
	if exist %nombreArchivo% goto:sinDefinir
	set ruta="%USERPROFILE%\Documents\%nombreArchivo%".txt
	echo %contenido% > %ruta%
	echo Creando el archivo %nombreArchivo% ...
	echo El archivo %nombreArchivo% se genero correctamente.
	pause
  goto:menu

REM En aso de que el archivo o carpeta exista avisa al susuario y lo redirige al menu
:sinDefinir
echo la carpeta o archivo que intenta crear ya existe,redirigiendo al menu
pause
goto:menu

  
REM *****Sale del programa******************

:opt5
echo Saliendo del programa.Pulsa una tecla para salir
pause>nul


	
	


	