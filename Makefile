SHELL := bash

dcr = docker compose run --rm php82
dcrx = docker compose run --rm php82-xdebug

.PHONY: build
build:
	@docker compose build --pull
	@docker push wickedbyte/project-skeleton:php82
	@docker push wickedbyte/project-skeleton:php82-xdebug
	@docker push wickedbyte/project-skeleton:php82-pcov
	@$(dcr) composer install

.PHONY: pull
pull:
	@docker pull wickedbyte/project-skeleton:php82
	@docker pull wickedbyte/project-skeleton:php82-xdebug
	@docker pull wickedbyte/project-skeleton:php82-pcov
	@$(dcr) composer install

.PHONY: clean
clean:
	@$(dcr) rm -rf ./.phpbench
	@$(dcr) rm -rf ./.tmp
	@$(dcr) rm -rf ./vendor

.PHONY: shell
shell:
	@$(dcr) bash

.PHONY: composer
composer:
	@$(dcr) composer install

.PHONY: phpunit
phpunit:
	@$(dcr) vendor/bin/phpunit

.PHONY: phpbench
phpbench:
	@$(dcr) vendor/bin/phpbench run --report=aggregate

.PHONY: psysh
psysh:
	@$(dcrx) vendor/bin/psysh

.PHONY: phpcs
phpcs:
	@$(dcr) vendor/bin/phpcs

.PHONY: phpcs
phpcbf:
	@$(dcr) vendor/bin/phpcbf

.PHONY: phpstan
phpstan:
	@$(dcr) vendor/bin/phpstan

.PHONY: phpstan
rector:
	@$(dcr) vendor/bin/rector process
	@$(dcr) vendor/bin/phpcbf
