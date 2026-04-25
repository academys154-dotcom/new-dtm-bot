#!/usr/bin/env bash
set -euo pipefail

mkdir -p /app/data /app/exports

exec python app/main.py
