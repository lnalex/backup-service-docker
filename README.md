# Docker Backup Image

[![](https://images.microbadger.com/badges/image/lnalex/docker-backup.svg)](https://hub.docker.com/r/lnalex/docker-backup/) [![](https://images.microbadger.com/badges/version/lnalex/docker-backup.svg)](https://hub.docker.com/r/lnalex/docker-backup/)

A minimal Docker image of the [backup Ruby gem](https://github.com/backup/backup/).

## Directory structure
    /etc/backups     => Configurations (BACKUP_CONFIG_DIR)
    /var/lib/backups => Log files (BACKUP_DATA_DIR)
    /home/backups    =>  Output packaged backup files

## Usage

`docker run -it --rm -v $(pwd)/config/:/etc/backups -v $(pwd)/data:/var/lib/backups -v $(pwd)/out:/home/backups lnalex/docker-backup my_backup`

All your modules have to be in the `config/models`(e.g. `config/models/my_backup.rb`).

## Environment variables

`BACKUP_DATA_DIR`  (See directory structure)
`BACKUP_CONFIG_DIR` (See directory structure)
`BACKUP_TRIGGER_ID` Use cmd argument at the end of the `docker run` command or can be overridden.

## License

Apache 2 ([fork](https://github.com/tenstartups/backup-service-docker))

