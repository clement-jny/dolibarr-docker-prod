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
directories=(custom documents mariadb old adminer)

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
  # Transform DOLI_COMPANY_NAME: replace spaces and '-' with '_'
  DOLI_COMPANY_NAME_CLEAN=$(echo "$DOLI_COMPANY_NAME" | tr ' -' '__')

  cat <<EOF > compose.override.yml
services:
  web:
    labels:
      - traefik.enable=true
      - traefik.http.routers.${DOLI_COMPANY_NAME_CLEAN}.entrypoints=web
      - traefik.http.routers.${DOLI_COMPANY_NAME_CLEAN}.entrypoints=websecure
      - traefik.http.routers.${DOLI_COMPANY_NAME_CLEAN}.tls=true
      - traefik.http.routers.${DOLI_COMPANY_NAME_CLEAN}.tls.certresolver=production
      - traefik.http.routers.${DOLI_COMPANY_NAME_CLEAN}.rule=Host(\`${DOLI_URL_ROOT}\`)
      - traefik.http.services.${DOLI_COMPANY_NAME_CLEAN}.loadbalancer.server.port=\${DOLI_DOCKER_PORT}
    networks:
      - traefik_default
EOF
  echo "✅ Traefik support enabled with name: $DOLI_COMPANY_NAME_CLEAN"
else
  echo "🚫 Traefik will not be enabled."
fi

# Launch Docker Compose
docker compose up --build -d