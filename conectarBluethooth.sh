#!/bin/bash

# Definición de variables
DEVICE="XX:XX:XX:XX:XX:XX"  # Dirección MAC del dispositivo Bluetooth
DEVICE_NAME="MS7"           # Nombre amigable del dispositivo
MAX_ATTEMPTS=5              # Número máximo de intentos de conexión
WAIT_TIME=5                 # Tiempo de espera entre intentos (en segundos)

# Función para conectar el dispositivo
connect_device() {
    echo "Intentando conectar a $DEVICE_NAME..."
    bluetoothctl connect $DEVICE
}

# Función para verificar si el dispositivo está conectado
is_connected() {
    if bluetoothctl info $DEVICE | grep -q "Connected: yes"; then
        return 0  # Conectado
    else
        return 1  # No conectado
    fi
}

# Función principal
main() {
    for ((i=1; i<=$MAX_ATTEMPTS; i++)); do
        if is_connected; then
            echo "$DEVICE_NAME conectado exitosamente."
            return 0
        else
            echo "Intento $i de $MAX_ATTEMPTS"
            connect_device
            sleep $WAIT_TIME
        fi
    done

    echo "No se pudo conectar a $DEVICE_NAME después de $MAX_ATTEMPTS intentos."
    return 1
}

# Ejecutar la función principal
main

# Capturar el código de salida
exit $?