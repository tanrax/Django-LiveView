.DEFAULT_GOAL := help
help:
	@perl -nle'print $& if m{^[a-zA-Z_-|.]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'

run.server: ## Run server
	docker-compose -f docker-compose.yaml up

run.format: ## Format style with black
	black --exclude="/(postgres_data|venv|migrations|\.git)/" core/ app/

