include .env

setup:
	docker-compose up -d

stop:
	docker-compose down

import_db_test:
	$(call health_check)
	docker exec -it ${DB_CONTAINER_NAME} bash -c "mysql -u ${DB_USER} ${DB_NAME} --password=${DB_PASSWORD} < /${DB_DATA}/setup.sql"

define health_check
	docker exec -it ${DB_CONTAINER_NAME} bash -c "./utils/wait_for_db.sh"
endef
