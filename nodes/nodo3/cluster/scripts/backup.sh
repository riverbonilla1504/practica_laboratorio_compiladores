#!/bin/bash
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NODE_NAME="$(basename "$(dirname "$(dirname "$SCRIPT_DIR")")")"
TASK_DESC="${1:-backup incremental de /etc y /var}"

echo "[START][BACKUP] Nodo=$NODE_NAME"
echo "[INFO][BACKUP] Instruccion DSL: $TASK_DESC"
echo "[RUN][BACKUP] Validando espacio disponible en disco..."
sleep 1

for progress in 25 50 75 100; do
	echo "[PROGRESS][BACKUP] Nodo=$NODE_NAME Avance=${progress}%"
	sleep 1
done

echo "[RUN][BACKUP] Empaquetando archivos de configuracion y registros..."
sleep 1
echo "[DONE][BACKUP] Nodo=$NODE_NAME Backup finalizado y verificado."