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
lint: ## Execute markdown analisys and fixes minor problems
	@docker run -v ${PWD}/content:/workdir davidanson/markdownlint-cli2:v0.15.0 --fix "**/*.md" "#node_modules"
