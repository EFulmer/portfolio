DOCKER_IMAGE_NAME=portfolio-app

# Build-related commands:
build-docker:
	docker build --no-cache --file application.Dockerfile --tag $(DOCKER_IMAGE_NAME) .

# Run-related commands:
run-local-dev:
	poetry run python manage.py runserver

run-docker-dev:
	docker-compose -f docker-compose.yml -f docker-compose-dev.yml up

run-docker-prod:
	docker-compose -f docker-compose.yml -f docker-compose-prod.yml up --build

stop-docker-prod: 
	docker-compose -f docker-compose.yml -f docker-compose-prod.yml down
