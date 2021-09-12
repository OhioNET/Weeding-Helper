# Weeding Helper Makefile
# -----------------------
#  SHELL:=/bin/bash
#
#  help:
#       @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build OhioNet Weeding Helper Images
        docker build -t ohionet/weeding-helper-app -f docker/app/Dockerfile .
        docker build -t ohionet/weeding-helper-db -f docker/db/Dockerfile .

start: ## Start Weeding Helper Containers
        docker-compose -f docker/docker-compose.ohn.yml up -d

stop: ## Stop Weeding Helper Containers
        docker-compose -f docker/docker-compose.ohn.yml stop