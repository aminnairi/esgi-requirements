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

## Development server

```bash
make development
```

## Surge publishing

```bash
make publish
```

## Surge publish list

```bash
make list
```

## Surge unpublishing

```bash
make unpublish
```

## Stop Docker Compose services

```bash
make stop
```
