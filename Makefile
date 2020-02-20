setup:
	$(call do_setup)

stop:
	docker-compose down

define do_setup
	docker-compose up -d
	docker exec -it db bash -c 'mysql -u LaTeam factures --password=tortue < /home/data_db/setup.sql'
endef
