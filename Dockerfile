#
# Ruby backup gem service docker image
#
# http://github.com/tenstartups/backup-service-docker
#

FROM alpine:3.3

MAINTAINER Alexandre Lion <lion@alexandre.xyz>

# Set environment variables.
ENV \
  HOME=/home/backups \
  BACKUP_CONFIG_DIR=/etc/backups \
  BACKUP_DATA_DIR=/var/lib/backups

# Install base packages.
RUN \
  apk --update add build-base bash git libxml2-dev libxslt-dev mysql-client postgresql \
               redis ruby ruby-rdoc ruby-nokogiri ruby-bigdecimal ruby-bundler ruby-dev ruby-irb \
               ruby-io-console ruby-json ruby-nokogiri sqlite tar zlib-dev \
               gnupg xtrabackup sudo && \
  rm -rf /var/cache/apk/*

RUN /usr/bin/gem install backup

# Define working directory.
WORKDIR /home/backups

# Define mountable directories.
VOLUME ["/home/backups", "/etc/backups", "/var/lib/backups", "/var/log/backups"]

# Add files to the container.
COPY entrypoint.sh /docker-entrypoint
COPY perform-backup.sh /usr/local/bin/perform-backup

# Set the entrypoint script.
ENTRYPOINT ["/docker-entrypoint"]
