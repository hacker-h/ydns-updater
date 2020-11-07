# ydns-updater

This is a simple updater script for ydns DNS entries.
It supports IPv4 and IPv6.

# Getting started
Create a `domains.env` file and a `ydns.env` file according to the `.example` files provided.

# Usage

## shell script
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

## docker compose
```
docker-compose up -d
```
