IMAGE = lamp
NAME = lamp
PORTS = -p 80:80 -p 3306:3306
APPDIR = /app
VOLUMES = \
	-v $(APPDIR)/www:/app \
	-v $(APPDIR)/_mysql_data:/var/lib/mysql

.PHONY: build run stop inspect rm logs ports

build:
		docker build -t $(IMAGE) .

run:
		docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(IMAGE)

stop:
		docker stop $(NAME)
		docker rm $(NAME)

inspect:
		docker exec -it $(NAME) bash

rm:
		docker rm $(NAME)

logs:
		docker logs $(NAME)

ports:
		docker port $(NAME)