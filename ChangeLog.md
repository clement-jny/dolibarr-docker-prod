## [v1.5.0] - 2025-02-04

### Added

- Added SQL update file for database.
- Added user input prompts in the setup script (`setup.sh`) for better customization.
- Added Traefik support in the script file for reverse proxy configuration.

### Changed

- Improved setup script logic to handle user input dynamically.

## [v1.4.0] - 2025-01-08

### Changed

- Updated the README to use `mv` instead of `cp` for file renaming in the instructions.

## [v1.3.0] - 2025-01-08

### Added

- Added PHP timezone configuration (Europe/Paris) in the Docker container.

## [v1.2.0] - 2025-01-08

### Changed

- Added all necessary ports inside the `.env` file.
- Moved the adminer container to the end of the `compose.yml` file for better structure.

## [v1.1.0] - 2025-01-07

### Changed

- Increased PHP file size limit in both `.env` and `compose.yml` files.

### Added

- Docker Compose configuration file (`compose.yml`).
- Setup script (`setup.sh`) to automate environment preparation.
- README file with detailed setup instructions.
- `.env.example` and `.env` files for environment variables

## [v1.0.0] - 2024-12-09

- Initial release with basic setup for Dolibarr in Docker.
