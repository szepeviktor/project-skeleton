SHELL := bash

php = docker compose run --rm php
php_xdebug = docker compose run --rm php-xdebug
composer = $(php) composer
composer_xdebug = $(php-xdebug) composer

build: .env
	@docker compose build --pull
	@$(composer) install
	@$(php) mkdir build

.env:
	@$(dcr) cp .env.example .env

.PHONY: clean
clean:
	@$(php) rm -rf ./.phpbench ./.tmp ./build ./vendor

.PHONY: shell
shell:
	@$(php) bash

.PHONY: phpunit
phpunit:
	@$(composer) phpunit

.PHONY: phpbench
phpbench:
	@$(composer) phpunit

.PHONY: psysh
psysh:
	@$(composer_xdebug) phpunit

.PHONY: phpcs
phpcs:
	@$(composer) phpcs

.PHONY: phpcbf
phpcbf:
	@$(composer) phpcbf

.PHONY: phpstan
phpstan:
	@$(composer) phpstan

.PHONY: rector
rector:
	@$(composer) rector
	@$(composer) phpcbf

.PHONY: ci
ci:
	@$(composer) ci

.PHONY: update
update:
	@$(composer) update -W
	@$(composer) bump
