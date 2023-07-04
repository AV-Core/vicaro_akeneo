# Starte vom Basis-Image
FROM akeneo/pim-php-dev:8.1

# Setze das Arbeitsverzeichnis im Container
WORKDIR /srv/pim

# Kopiere alle lokalen Dateien in das Arbeitsverzeichnis des Containers
COPY . /srv/pim

# Führe Composer install aus
RUN php /usr/local/bin/composer install 

# PIM initialisieren
RUN bin/docker/pim-dependencies.sh
RUN bin/docker/pim-initialize.sh

# Der Port, auf dem der Server laufen wird
EXPOSE 8080

# Starte den Server
CMD ["php", "-S", "0.0.0.0:8080"]
