.DEFAULT_TARGET: help

.PHONY: help
help: ## Display this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: themes
themes: ## Setup themes (download and build)
	rm -r themes/hugo-geekdoc
	mkdir -p themes/hugo-geekdoc/
	curl -L https://github.com/thegeeklab/hugo-geekdoc/releases/latest/download/hugo-geekdoc.tar.gz | tar -xz -C themes/hugo-geekdoc/ --strip-components=1


.PHONY: lint
lint: ## Execute syntatic analysis in the code and autofix minor problems
	@golangci-lint run --fix

.PHONY: test
test: ## Execute the tests in the development environment
	@make db-reset
	go test ./... -shuffle=on -count=1 -race -timeout 2m

.PHONY: benchmark
benchmark: ## Execute the tests in the development environment
	go test ./... -bench=. -count=1 -timeout 2m

.PHONY: coverage
coverage: ## Generate test coverage in the development environment
	@make db-reset
	go test ./... -coverprofile=/tmp/coverage.out -coverpkg=./...
	go tool cover -html=/tmp/coverage.out

.PHONY: ci
ci: lint test ## Execute the tests and lint commands

.PHONY: db-build
db-build: ## Builds a mysql docker image locally
	docker build -f Dockerfile.mysql -t ${DATABASE_IMAGE} .

.PHONY: db-run
db-run: ## Runs the mysql docker container on localhost:3306
	-docker rm -f ${DATABASE_CONTAINER}
	docker run -d -p 3306:3306 -p 33060:33060 --name ${DATABASE_CONTAINER} ${DATABASE_IMAGE}

.PHONY: db-reset
db-reset: ## Reset table registers to initial state (with seeds)
	docker exec -d ${DATABASE_CONTAINER} mysql -u admin -p${DATABASE_PASSWORD_FC} ${DATABASE_NAME} -e 'source /docker-entrypoint-initdb.d/03-base_seed.sql'

.PHONY: db-stop
db-stop: ## Stop database container
	docker stop ${DATABASE_CONTAINER}

.PHONY: db-bash
db-bash: ## Open bash terminal on database container
	docker exec -it ${DATABASE_CONTAINER} bash

.PHONY: db-logs
db-logs: ## Show database logs
	docker logs -f --tail 100 ${DATABASE_CONTAINER}
