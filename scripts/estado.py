#!/usr/bin/env python3
"""estado.py - Reporte de solo lectura del estado del sistema."""
import shutil
import socket
from datetime import datetime


def disco_usado_pct(ruta="/"):
    total, usado, _ = shutil.disk_usage(ruta)
    return round(usado / total * 100)


def memoria_libre_gb():
    with open("/proc/meminfo") as f:
        for linea in f:
            if linea.startswith("MemAvailable:"):
                kb = int(linea.split()[1])
                return round(kb / 1024 / 1024, 1)
    return None


def main():
    print(f"Equipo: {socket.gethostname()}")
    print(f"Disco usado: {disco_usado_pct()}%")
    print(f"Memoria libre: {memoria_libre_gb()} GB")
    print(f"Fecha: {datetime.now():%Y-%m-%d %H:%M:%S}")


if __name__ == "__main__":
    main()
