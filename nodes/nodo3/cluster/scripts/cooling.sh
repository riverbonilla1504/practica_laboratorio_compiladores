#!/bin/bash

echo "[INFO] Iniciando enfriamiento del nodo..."

# Simular lectura de temperatura
TEMP=$((30 + RANDOM % 20))
echo "[INFO] Temperatura actual: $TEMP°C"

# Simular acción correctiva
echo "[ACTION] Reduciendo carga del sistema..."
sleep 1

echo "[ACTION] Deteniendo procesos intensivos..."
sleep 1

echo "[ACTION] Activando sistema de enfriamiento..."
sleep 1

# Simular nueva temperatura
NEW_TEMP=$((TEMP - 10))
echo "[INFO] Nueva temperatura: $NEW_TEMP°C"

echo "[SUCCESS] Nodo estabilizado."