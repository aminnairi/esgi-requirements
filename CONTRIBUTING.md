# Contributing

## Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [GNU/Make](https://www.gnu.org/software/make/)

## Setup

```bash
cp .env.example .env
```

*Note: you can edit the `.env` to your match your prefered environment settings.*

## Docker Compose Services Startup

```bash
make start
```

## Development server

```bash
make development
```

## Production

```bash
make production
```

## Docker Compose Services Shutdown

```bash
make stop
```

## Docker Compose Services Restart

```bash
make restart
```