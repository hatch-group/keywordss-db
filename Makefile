DB_REPOSITORY_NAME:=hatchgroup/keywordss-db
DB_CONTAINER_NAME:=keywordss-db-dev

docker/run:
	docker run -d -p 3306:3306 --name $(DB_CONTAINER_NAME) -v keywordss-data:/var/lib/mysql --env-file _secret/.env $(DB_REPOSITORY_NAME):latest
	@echo 'Connect DB port :3306 !!!'

docker/stop:
	docker container stop $(DB_CONTAINER_NAME)
	docker container rm $(DB_CONTAINER_NAME)

db/init:
	mysql -u root -p -h 127.0.0.1 --port 3306 -e 'CREATE DATABASE keywordss;'
	mysql -u root -p -h 127.0.0.1 --port 3306 keywordss < sql-files/init.sql

db/delete:
	mysql -u root -p -h 127.0.0.1 --port 3306 -e 'DROP DATABASE keywordss;'
