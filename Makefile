all :
	docker-compose -f ./srcs/docker-compose.yml build --no-cache 
	docker-compose -f ./srcs/docker-compose.yml up


up : 
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

re:
	@docker compose -f scrs/docker-compose.yml up -d --build

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps

# clean : stop \
# 	docker rm $$(docker ps -qa);\
# 	docker rmi -f $$(docker images -qa);\
# 	docker volume rm $$(docker volume ls -q);\
# 	docker network rm $$(docker network ls -q);\

.PHONY: all up down stop start status