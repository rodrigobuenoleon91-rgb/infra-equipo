# Matriz de riesgos

| Riesgo | P | I | Sev. | Mitigación |
|---|---|---|---|---|
| Disco lleno | 3 | 3 | 9 | Alerta al 80% y ampliar el volumen |
| Fuga de datos hacia la IA | 2 | 3 | 6 | Anonimizar y verificar con grep |
| Credenciales expuestas | 2 | 3 | 6 | Guardarlas en n8n, nunca en el repo |
| La IA inventa datos | 3 | 2 | 6 | Prompt restringido y conteo real |
| Puerto de Docker saltando UFW | 2 | 3 | 6 | Publicar en 127.0.0.1 |
| Túnel SSH caído | 3 | 1 | 3 | ServerAliveInterval |
| Respaldo corrupto | 1 | 3 | 3 | Verificar SHA-256 y restaurar |
