# Website allowing interviewee to be assessed with pre-requisites for joining the ESGI. 
# Copyright (C) 2022 Amin NAIRI
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

.PHONY: start stop restart install development production publish unpublish list

DOCKER_COMPOSE_EXEC_OPTIONS=

ifeq (${CI},true)
	DOCKER_COMPOSE_EXEC_OPTIONS=--user 0:0 -T
endif

start:
	docker-compose up --detach

stop:
	docker-compose down --remove-orphans --volumes --timeout 0

restart: stop start

install: start
	docker-compose exec $(DOCKER_COMPOSE_EXEC_OPTIONS) node npm install

development: install
	docker-compose exec $(DOCKER_COMPOSE_EXEC_OPTIONS) node npm run development

production: install
	docker-compose exec $(DOCKER_COMPOSE_EXEC_OPTIONS) node npm run production

list: install
	docker-compose exec $(DOCKER_COMPOSE_EXEC_OPTIONS) node npx surge list

publish: production
	docker-compose exec $(DOCKER_COMPOSE_EXEC_OPTIONS) node npx surge

unpublish: install
	docker-compose exec $(DOCKER_COMPOSE_EXEC_OPTIONS) node npx surge teardown
