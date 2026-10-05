# Infra Equipo - Docker Compose

## Descripción
Servicio web desplegado con Docker Compose, versionado con Git y GitHub.

## Estructura
- `docker-compose.yml`: definición del servicio
- `web/`: contenido que sirve nginx
- `.gitignore`: archivos que no se suben

## Requisitos
- Ubuntu o Debian
- Git
- Docker y Docker Compose

## Cómo desplegar
1. Clonar: `git clone git@github.com:rodrigobuenoleon91-rgb/infra-equipo.git`
2. Entrar: `cd infra-equipo`
3. Levantar: `docker compose up -d`
4. Abrir `http://localhost:8080` en el navegador

## Cómo detener
`docker compose down`
