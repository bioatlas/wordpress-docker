#! make
NOW := $(shell date +%Y%m%d-%H%M%S)
UID = $(shell id -u)
GID = $(shell id -g)
PWD = $(shell pwd)

all: theme-dl up

theme-dl:
	mkdir -p themes/atlas
	cd themes/atlas && \
		wget https://github.com/bioatlas/bioatlas-wordpress-theme/archive/master.zip && \
		unzip master.zip

up:
	docker-compose up -d
	./wait-for-http-OK.sh http://wordpress.bioatlas.se
	xdg-open http://wordpress.bioatlas.se

down:
	docker-compose down

backup:
	docker run --rm --volumes-from wordpressdocker_wordpress_1 \
		-u $(UID):$(GID) -v $(PWD):/tmp alpine \
		sh -c "tar czf /tmp/wordpress-files-$(NOW).tgz -C /var/www/html ./"

	docker exec wordpressdocker_mysql_1 bash -c \
		"mysqldump -u wordpress -p'wordpress' -h 127.0.0.1 wordpress" | gzip > wordpress-db-$(NOW).sql.gz

	cp wordpress-files-$(NOW).tgz wordpress-files-latest.tgz
	cp wordpress-db-$(NOW).sql.gz wordpress-db-latest.sql.gz

restore:
	docker run --rm --volumes-from wordpressdocker_wordpress_1 \
		-v $(PWD):/tmp alpine \
		sh -c "cd /var/www/html && tar xvf /tmp/wordpress-files-latest.tgz"

	gunzip -c wordpress-db-latest.sql.gz | docker exec -i wordpressdocker_mysql_1 mysql -u wordpress -p'wordpress' -h 127.0.0.1 wordpress

