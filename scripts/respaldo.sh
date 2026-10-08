#!/usr/bin/env bash
# respaldo.sh - Comprime ~/documentos en ~/respaldos con fecha y hora
set -euo pipefail

ORIGEN="documentos"
DESTINO="$HOME/respaldos"
ARCHIVO="$DESTINO/docs-$(date +%F_%H%M).tar.gz"

mkdir -p "$DESTINO"
tar -czf "$ARCHIVO" -C "$HOME" "$ORIGEN"
echo "$(date '+%F %T') Respaldo creado: $ARCHIVO"
