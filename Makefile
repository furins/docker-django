./envs:
	cp templates/.envs .envs

./src:
	cp templates/src ./src
	echo "aggiungere submoduli nella cartella src attraverso il comando 'git submodule add <repository_path>'"

# COMANDI DISPONIBILI
init: ./src ./envs

build:
	cd infrastructure
	docker-compose build

up:
	cd infrastructure
	docker-compose up -d

up-non-daemon:
	cd infrastructure
	docker-compose up

start:
	cd infrastructure
	docker-compose start

stop:
	cd infrastructure
	docker-compose stop

restart:
	cd infrastructure
	docker-compose stop && docker-compose start

shell-nginx:
	cd infrastructure
	docker exec -ti nz01 /bin/sh

shell-web:
	cd infrastructure
	docker exec -ti dz01 /bin/sh

shell-db:
	cd infrastructure
	docker exec -ti pz01 /bin/sh

log-nginx:
	cd infrastructure
	docker-compose logs nginx  

log-web:
	cd infrastructure
	docker-compose logs web  

log-db:
	cd infrastructure
	docker-compose logs db

collectstatic:
	cd infrastructure
	docker exec dz01 /bin/sh -c "python manage.py collectstatic --noinput"  