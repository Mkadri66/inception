run:
	@sudo mkdir -p /home/mkadri/data/db /home/mkadri/data/web
	@sudo chmod 700 /home/mkadri/data/db
	@sudo chmod +x /home/mkadri/data/web
	@docker compose -f ./srcs/docker-compose.yml up -d --build || echo "Docker failed to start"


clean:
	docker compose -f srcs/docker-compose.yml down -v --rmi all
	sudo rm -rf /home/mkadri/data/db /home/mkadri/data/web

start:
	@docker compose -f ./srcs/docker-compose.yml start

logs:
	@docker compose -f ./srcs/docker-compose.yml logs -f
stop:
	@docker compose -f ./srcs/docker-compose.yml stop
	@pkill -f mysql || true
down:
	@docker compose -f ./srcs/docker-compose.yml down -v --remove-orphans
	@docker volume prune -f

re: clean run