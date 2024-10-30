.PHONY: serve stop help

# include .env
# export $(shell sed 's/=.*//' .env)

PWD := $(shell pwd)
TP_API_DB := ../tp-mysql
DB_MANAGER := ../tp-mysql-manager

serve:
	@echo "Starting database container..."
	@cd $(TP_API_DB) && sudo docker compose up --detach
	@echo "Starting SOLR..."
	@cd $(PWD) && sudo docker compose up --detach
	@echo "Starting Adminer..."
	@cd $(DB_MANAGER) && sudo docker compose up --detach
	@echo
	@echo "Database running on tp_mysql:3306"
	@echo "SOLR running on http://localhost:8983"
	@echo "Adminer running on https://localhost/adminer.php"
	@echo
	@echo "I'm up to no good..."
	@echo

stop:
	@echo
	@echo "Stopping all containers..."
	@cd $(DB_MANAGER) && sudo docker compose down
	@cd $(PWD) && sudo docker compose down
	@cd $(TP_API_DB) && sudo docker compose down
	@echo
	@echo "...mischief managed."
	@echo

help:
	@echo "Manage project"
	@echo ""
	@echo "Usage:"
	@echo "  $$ make [command]"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo "  $$ make serve"
	@echo "  Starting the servers"
	@echo ""
	@echo "  $$ make stop"
	@echo "  Stopping the servers"
	@echo ""
