# ydns-updater

This is a simple updater script for ydns DNS entries.
It supports IPv4 and IPv6.

# Getting started
Create a `domains.env` file and a `ydns.env` file according to the `.example` files provided.

# Usage

## Run in a bash/dash shell
```
# export all required variables
set -a
source domains.env
source ydns.env
ENABLE_IPV6=True
UPDATE_DELAY=30
set +a

sh update_ydns.sh
```

## Run with Docker Compose
Check the `environment` section in `docker-compose.yml` and adapt it to your needs.

### Run Docker Compose in the foreground
```
docker-compose up --build
```

### Run Docker Compose in the background
```
docker-compose up --build -d
```
