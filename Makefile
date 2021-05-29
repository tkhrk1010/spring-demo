.DEFAULT_GOAL := help

build: ## build container image
	@printf '\033[34m%s\033[m\n' 'docker-compose build --no-cache'
	@docker-compose build --no-cache

up: ## start container
	@printf '\033[34m%s\033[m\n' 'docker-compose up -d web'
	@docker-compose up -d web

down: ## stop container
	@printf '\033[34m%s\033[m\n' 'docker-compose down'
	@docker-compose down

rebuild: down build up ## rebuild container

ls: ## list container
	@printf '\033[34m%s\033[m\n' 'docker container ls'
	@docker container ls

test: ## test container
	@printf '\033[34m%s\033[m\n' 'sls -v'
	@docker container exec serverless sls -v

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

