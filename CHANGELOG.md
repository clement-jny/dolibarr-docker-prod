# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added

- Use DOLI_VERSION env var
- Add specific version selection in .env
- Keep empty folder

### Changed

- Remove quote
- Remove unnecessery file

## [1.12.0] - 2025-07-07

### Changed

- Remove TRAEFIK_HOST variable from .env.example and update README with new configuration instructions
- Update Traefik configuration to use COMPOSE_FOR variable instead of DOLI_COMPANY_NAME
- Remove phpMyAdmin and Adminer configuration from .env.example
- Remove unused phpMyAdmin and Adminer services from compose.yml

### Documentation

- Add instructions for integrating phpMyAdmin and Adminer in Docker setup
- Improve comments for environment variables in compose.yml
- Improve comments for environment variables in compose.yml

### Fixed

- Replace links with depends_on for db service in compose.yml

## [1.11.1] - 2025-04-24

### Fixed

- Update DOLI_HOST_PORT to 80 and use COMPOSE_FOR variable in container names

### Maintenance

- Deactivate log for changelog

## [1.11.0] - 2025-04-20

### Added

- Use plugins and deactivate design

### Maintenance

- Update hydra theme

## [1.10.0] - 2025-04-20

### Changed

- Change name of mariadb env variable

## [1.9.1] - 2025-02-17

### Added

- Add timezone support on mariadb container

## [1.9.0] - 2025-02-10

### Added

- *(workflow)* New wf for auto changelog and update for auto release
- Add custom git-cliff configuration

### Other

- *(other)* Delete old changelog file

## [1.8.0] - 2025-02-05

### Maintenance

- Update workflow & ChangeLog files

## [1.7.0] - 2025-02-04

### Added

- Add new env var

### Maintenance

- Update changelog
- Update readme

### Other

- *(other)* Use new env var | add db under traefik

## [1.6.0] - 2025-02-04

### Added

- Add summary file generation

## [1.5.0] - 2025-02-04

### Added

- Get last change messages and put in env
- Create ChangeLog file | create sql file for update in db | create workflow to auto-release on new push
- Use new env port; chore: move adminer end of file
- Add env port; chore: add comments
- Change utc
- Upgrade php file size limit

### Maintenance

- Update readme; feat: implmement traefik support in setup script
- Add multi-lines support in env
- Add permissions
- Update user in workflow
- Change utc+1 to europe/paris
- Update readme | update compose to update php timezone
- Update readme
- Add ds_store ignore

### Other

- *(other)* Initial commit

[unreleased]: https://github.com/clement-jny/dolibarr-docker-prod/compare/v1.12.0..HEAD
[1.12.0]: https://github.com/clement-jny/dolibarr-docker-prod/compare/v1.11.1..v1.12.0
[1.11.1]: https://github.com/clement-jny/dolibarr-docker-prod/compare/v1.11.0..v1.11.1
[1.11.0]: https://github.com/clement-jny/dolibarr-docker-prod/compare/v1.10.0..v1.11.0
[1.10.0]: https://github.com/clement-jny/dolibarr-docker-prod/compare/v1.9.1..v1.10.0
[1.9.1]: https://github.com/clement-jny/dolibarr-docker-prod/compare/v1.9.0..v1.9.1
[1.9.0]: https://github.com/clement-jny/dolibarr-docker-prod/compare/v1.8.0..v1.9.0
[1.8.0]: https://github.com/clement-jny/dolibarr-docker-prod/compare/v1.7.0..v1.8.0
[1.7.0]: https://github.com/clement-jny/dolibarr-docker-prod/compare/v1.6.0..v1.7.0
[1.6.0]: https://github.com/clement-jny/dolibarr-docker-prod/compare/v1.5.0..v1.6.0
[1.5.0]: https://github.com/clement-jny/dolibarr-docker-prod/releases/tag/v1.5.0

