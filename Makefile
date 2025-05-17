DOCKER_IMAGE_NAME=portfolio-app

# Build-related commands:
build-docker:
	docker build --file application.Dockerfile --tag $(DOCKER_IMAGE_NAME) .

# Run-related commands:
run-local-dev:
	poetry run python manage.py runserver

run-docker:
	docker run --name=portfolioapp -p=127:0.0.1:8001:8000 --env-file=env.list $(DOCKER_IMAGE_NAME)
