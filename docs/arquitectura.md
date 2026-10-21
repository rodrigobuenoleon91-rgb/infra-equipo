# Arquitectura

```mermaid
flowchart TD
  A[Administrador] --> B[Túnel SSH]
  B --> C[Firewall UFW: solo 22 y 80]
  C --> D[n8n en Docker]
  E[Logs del sistema] --> F[Cron y script anonimizador]
  F --> D
  D --> G[Groq IA]
  D --> H[Gmail SMTP]
  I[Volumen n8n_data] --> J[Respaldo SHA-256]
```

## Decisiones
- n8n se publica solo en 127.0.0.1:5678 y se accede por túnel SSH.
- El log se anonimiza antes de salir del servidor.
- La respuesta de la IA se contrasta con un conteo real.
