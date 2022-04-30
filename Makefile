.PHONY:  help
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-30s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

shell_plus:
	docker-compose run --rm web bash -c "odoo-cli shell"

start: ## runserver
	docker-compose run --rm --service-ports web

build-odoo: ## > tifa
	docker build -t 'odoo:local' -f 'compose/web/Dockerfile' .

build-odoo-no-cache: ## > tifa
	docker build -t 'odoo:local' -f 'compose/web/Dockerfile' --no-cache .

