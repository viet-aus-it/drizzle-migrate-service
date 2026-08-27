# Drizzle Migrate Service

This service is used to run DB migrations/deployments in production
using Node 24 and Drizzle.

## Prerequisites

- Docker 20+, Docker Compose 1.28+
- Valid Drizzle migration folder

## Building this service

```shell
docker build -t ghcr.io/viet-aus-it/drizzle-migrate-service .
```

## Running this service with Docker run

```shell
# Passing env on the command line
docker run \
  --rm \
  -e "DATABASE_URL=postgresql://johndoe:randompassword@localhost:5432/mydb?schema=public" \
  --volume /path/to/drizzle/migration/folder:/src/drizzle \
  --volume /path/to/drizzle.config.ts:/src/drizzle.config.ts \
  ghcr.io/viet-aus-it/drizzle-migrate-service

# Using an env file
cp .env.sample .env # <- Fill this file out with valid credentials
docker run \
  --rm \
  --env-file ./.env \
  --volume /path/to/drizzle/migration/folder:/src/drizzle \
  --volume /path/to/drizzle.config.ts:/src/drizzle.config.ts \
  ghcr.io/viet-aus-it/drizzle-migrate-service
```

## Running in Docker Compose with a db service to test

```yaml
services:
  db:
    image: postgres:17
    env_file: ".env"

  db-deploy:
    image: ghcr.io/viet-aus-it/drizzle-migrate-service
    depends_on:
      - db
    env_file: ".env"
    volumes:
      - ./drizzle:/src/drizzle
      - ./drizzle.config.ts:/src/drizzle.config.ts
```

```bash
docker-compose up -d db
docker-compose up db-deploy
```

See `examples/` for ready-to-use postgres and mysql setups.
