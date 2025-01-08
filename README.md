# Dolibarr ERP & CRM Project

## Setup instructions

### Create Necessary Directories

If the following directories do not exist, create them. **Do not commit these directories to the repository**, as they contain sensitive information:

- `custom`: Contains custom modules for Dolibarr.
- `documents`: Stores files uploaded and generated via the Dolibarr web interface.
- `mariadb`: Holds the databases and tables for the application.
- `old`: Used for old configurations or backups as necessary.
- `adminer`: Contains a default style, which can be modified or replaced.

### Configure Environment Variables

Create a `.env` file based on `.env.example` by copying it and modifying the values as needed:

```bash
# Rename .env.example to .env
mv .env.example .env
```

Edit the [.env](.env) file and adjust the configuration according to your requirements.

### Run Dolibarr

#### With Docker Compose

```bash
# Build and start the Docker containers
docker compose up --build -d
```

```bash
# Stop and remove the Docker containers
docker compose down
```

#### With Setup Script

Alternatively, you can use the `setup.sh` script.

This script will create the necessary directories and launch Docker Compose for you.

```bash
# Grant execute permissions to the setup script
chmod +x setup.sh
# Run the setup script
./setup.sh
```
