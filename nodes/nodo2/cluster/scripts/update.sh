#!/bin/bash
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NODE_NAME="$(basename "$(dirname "$(dirname "$SCRIPT_DIR")")")"
TASK_DESC="${1:-actualizacion de paquetes de seguridad}"

echo "[START][UPDATE] Nodo=$NODE_NAME"
echo "[INFO][UPDATE] Instruccion DSL: $TASK_DESC"
echo "[RUN][UPDATE] Sincronizando indices de paquetes..."
sleep 1
echo "[PROGRESS][UPDATE] Nodo=$NODE_NAME Avance=40%"
echo "[RUN][UPDATE] Aplicando parches y actualizaciones pendientes..."
sleep 1
echo "[PROGRESS][UPDATE] Nodo=$NODE_NAME Avance=80%"
echo "[RUN][UPDATE] Limpiando paquetes obsoletos y validando versiones..."
sleep 1
echo "[PROGRESS][UPDATE] Nodo=$NODE_NAME Avance=100%"
echo "[DONE][UPDATE] Nodo=$NODE_NAME Actualizacion completada."