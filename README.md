# transcribathon-solr

Dockerized Solr for Transcribathon platform.

This container depends on a running tp-mysql service in the same network.

For each core (folder):
Rename the core.properties.example to core.properties and make you changes for the database connection.

Then we can start/stopping this container.

## start

	$ sudo docker-compose up -d

## stop

	$ sudo docker-compose down
