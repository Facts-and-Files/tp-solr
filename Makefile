# include .env
# export $(shell sed 's/=.*//' .env)

this_container := $(shell pwd)
api_db_container := ../tp-mysql
db_manager_container := ../tp-mysql-manager

docker_start:
	@echo "Starting database container..."
	@cd $(api_db_container) && sudo docker-compose up -d
	@echo "Starting SOLR..."
	@cd $(this_container) && sudo docker-compose up -d
	@echo "Starting Adminer..."
	@cd $(db_manager_container) && sudo docker-compose up -d
	@echo
	@echo "Database running on tp_mysql:3306"
	@echo "SOLR running on http://localhost:8983"
	@echo "Adminer running on https://localhost/adminer.php"
	@echo
	@echo "I'm up to no good..."
	@echo

docker_stop:
	@echo
	@echo "Stopping all containers..."
	@cd $(db_manager_container) && sudo docker-compose down
	@cd $(this_container) && sudo docker-compose down
	@cd $(api_db_container) && sudo docker-compose down
	@echo
	@echo "...mischief managed."
	@echo
