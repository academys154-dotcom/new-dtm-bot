#!/bin/sh
set -e

mkdir -p /app/data /app/exports

exec python app/main.py
