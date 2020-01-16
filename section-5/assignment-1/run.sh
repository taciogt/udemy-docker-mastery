# Starts a new Postgres database creating a new volume: big log stream about the database creation
docker container run postgres:9.6.1

# Starts another Postgres database creating a new volume: ANOTHER big log stream about the database creation
docker container run postgres:9.6.1

# Starts another version of Postgres database creating a new volume: ONE MORE big log stream about the database creation
docker container run postgres:9.6.2

# Starts a new Postgres database creating a new NAMED volume:a big log stream about the database creation
docker container run --mount source=psql-data,target=/var/lib/postgresql/data postgres:9.6.1
# Starts a new Postgres database using the same named volume: a SHORT log stream
docker container run --mount source=psql-data,target=/var/lib/postgresql/data postgres:9.6.1
# Starts a new Postgres database (with a patch upgrade) using the same named volume: a SHORT log stream again \o/
docker container run --mount source=psql-data,target=/var/lib/postgresql/data postgres:9.6.2