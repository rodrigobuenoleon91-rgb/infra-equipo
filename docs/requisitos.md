# Requerimientos

## Funcionales
| ID | Requerimiento |
|---|---|
| RF1 | Recibir líneas de log anonimizadas y filtrar solo los intentos fallidos |
| RF2 | Generar con IA un resumen de 3 viñetas e indicar si hay fuerza bruta |
| RF3 | Enviar por correo el resumen junto con el conteo real |
| RF4 | Crear respaldos con SHA-256 y permitir restaurarlos y verificarlos |

## No funcionales
| ID | Requerimiento | Cómo se mide |
|---|---|---|
| RNF1 | Solo SSH (22) y HTTP (80) expuestos; n8n en localhost | ufw status y ss -tulpn |
| RNF2 | Ningún dato real sale hacia la IA | grep de IPs da 0 |
| RNF3 | Todo respaldo se verifica con sha256sum -c | diff sin diferencias |
| RNF4 | El disco no pasa del 80% | Alerta de disco |
