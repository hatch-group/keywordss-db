DB_REPOSITORY_NAME:=hatchgroup/keywordss-db
DB_CONTAINER_NAME:=keywordss-db-dev

docker/run:
	docker run -d -p 3306:3306 --name $(DB_CONTAINER_NAME) -v keywordss-data:/var/lib/mysql --env-file _secret/.env $(DB_REPOSITORY_NAME):latest
	@echo 'Connect DB port :3306 !!!'

docker/stop:
	docker container stop $(DB_CONTAINER_NAME)
	docker container rm $(DB_CONTAINER_NAME)

