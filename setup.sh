#!/bin/bash

# Load env variables from .env file
if [ -f .env ]; then
  set -a
  source .env
  set +a
else
  echo "⚠️  .env file not found!"
  exit 1
fi

# Directories to create
directories=(custom documents mariadb)

# Create directories if they don't exist
for dir in "${directories[@]}"; do
  if [ ! -d "$dir" ]; then
    mkdir "$dir"
    echo "Directory '$dir' created."
  else
    echo "Directory '$dir' already exists."
  fi
done


# Ask user if they want to enable Traefik
read -p "Do you want to enable Traefik for this instance? (y/n): " TRAEFIK_ENABLED

# Generate a compose.override.yml file if Traefik needs to be enabled
if [[ "$TRAEFIK_ENABLED" == "y" ]]; then

  cat <<EOF > compose.override.yml
services:
  web:
    labels:
      - traefik.enable=true
      - traefik.http.routers.${COMPOSE_FOR}.entrypoints=web
      - traefik.http.routers.${COMPOSE_FOR}.entrypoints=websecure
      - traefik.http.routers.${COMPOSE_FOR}.tls=true
      - traefik.http.routers.${COMPOSE_FOR}.tls.certresolver=production
      - traefik.http.routers.${COMPOSE_FOR}.rule=Host(\`${TRAEFIK_HOST}\`)
      - traefik.http.services.${COMPOSE_FOR}.loadbalancer.server.port=\${DOLI_DOCKER_PORT}
    networks:
      - traefik_default

  db:
    networks:
      - traefik_default

networks:
  traefik_default:
    external: true
EOF

  echo "✅ Traefik support enabled with name: $COMPOSE_FOR"
else
  echo "🚫 Traefik will not be enabled."
fi

# Launch Docker Compose
docker compose up --build -d

# Write a summary file
cat <<EOF > summary.txt
Access link: ${DOLI_URL_ROOT}

- Dolibarr DB credentials -
DB name is: ${DOLI_DB_NAME}
MariaDB user: root / ${MARIADB_ROOT_PASSWORD}
MariaDB user: ${DOLI_DB_USER} / ${DOLI_DB_PASSWORD}

- Dolibarr web credential -
Dolibarr superuser: ${DOLI_ADMIN_LOGIN} / ${DOLI_ADMIN_PASSWORD}
EOF
