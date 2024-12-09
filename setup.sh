#!/bin/bash

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

# Launch Docker Compose
docker compose up --build -d