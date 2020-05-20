app_start:
	docker-compose -f "deployment/docker-compose.yml" up -d --build --force-recreate

app_stop:
	docker stop app_manager
	docker stop app_database
	
app_restart:
	make app_stop
	make app_start

log_manager :
	docker logs app_manager -f --since 5m

log_database :
	docker logs app_database -f --since 5m

exec_manager :
	docker exec -it app_manager bash
exec_database :
	docker exec -it app_database bash