#! make

all: theme-dl up

theme-dl:
	mkdir -p themes/atlas
	cd themes/atlas && \
		wget https://github.com/AtlasOfLivingAustralia/ala-wordpress-theme/archive/master.zip && \
		unzip master.zip

up:
	docker-compose up -d
	./wait-for-http-OK.sh http://wordpress.bioatlas.se
	xdg-open http://wordpress.bioatlas.se

down:
	docker-compose down
