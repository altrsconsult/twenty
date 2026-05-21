#!/usr/bin/env bash
set -euo pipefail

# ─── Twenty local dev ───────────────────────────────────────────────────────
# Backend: twenty-app-dev container (PostgreSQL + Redis + server na porta 2020)
# Frontend: hot-reload via Nx na porta 3001

CONTAINER_NAME="twenty-dev"
IMAGE="twentycrm/twenty-app-dev:v2.6.0"
DATA_VOLUME="twenty-dev-data"
STORAGE_VOLUME="twenty-dev-storage"

# ── 1. Backend ───────────────────────────────────────────────────────────────
if docker ps --format "{{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
  echo "✅ Backend já está rodando: http://localhost:2020"
else
  echo "🚀 Iniciando backend (${IMAGE})..."
  docker run -d \
    --name "${CONTAINER_NAME}" \
    -p 2020:2020 \
    -v "${DATA_VOLUME}:/data/postgres" \
    -v "${STORAGE_VOLUME}:/app/packages/twenty-server/.local-storage" \
    "${IMAGE}"
  echo "⏳ Aguardando backend iniciar..."
  sleep 8
  echo "✅ Backend disponível: http://localhost:2020"
  echo "   Login: tim@apple.dev / tim@apple.dev"
fi

# ── 2. Frontend ──────────────────────────────────────────────────────────────
echo ""
echo "🚀 Iniciando frontend com hot-reload..."
echo "   Frontend: http://localhost:3001"
echo "   Backend:  http://localhost:2020"
echo ""
npx nx start twenty-front
