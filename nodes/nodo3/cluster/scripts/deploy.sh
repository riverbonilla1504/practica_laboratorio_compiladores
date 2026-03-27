#!/bin/bash
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NODE_NAME="$(basename "$(dirname "$(dirname "$SCRIPT_DIR")")")"
TASK_DESC="${1:-despliegue de microservicio-web v1.0.0}"

echo "[START][DEPLOY] Nodo=$NODE_NAME"
echo "[INFO][DEPLOY] Instruccion DSL: $TASK_DESC"
echo "[RUN][DEPLOY] Descargando artefactos del registro interno..."
sleep 1
echo "[PROGRESS][DEPLOY] Nodo=$NODE_NAME Avance=33%"
echo "[RUN][DEPLOY] Instalando dependencias y preparando entorno..."
sleep 1
echo "[PROGRESS][DEPLOY] Nodo=$NODE_NAME Avance=66%"
echo "[RUN][DEPLOY] Reiniciando servicio y verificando salud..."
sleep 1
echo "[PROGRESS][DEPLOY] Nodo=$NODE_NAME Avance=100%"
echo "[DONE][DEPLOY] Nodo=$NODE_NAME Despliegue completado exitosamente."