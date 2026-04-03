#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

if ! command -v docker >/dev/null 2>&1; then
  echo "docker 未安装，请先安装 Docker Engine 与 Docker Compose。" >&2
  exit 1
fi

if docker compose version >/dev/null 2>&1; then
  COMPOSE_CMD=(docker compose)
elif command -v docker-compose >/dev/null 2>&1; then
  COMPOSE_CMD=(docker-compose)
else
  echo "未检测到 docker compose 或 docker-compose。" >&2
  exit 1
fi

if [ ! -f .env ]; then
  cp .example.env .env
fi

mkdir -p runtime data
touch data/df.db
chmod 0777 runtime data data/df.db || true

"${COMPOSE_CMD[@]}" up -d --build
"${COMPOSE_CMD[@]}" ps
