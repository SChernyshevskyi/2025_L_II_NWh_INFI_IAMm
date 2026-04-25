deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	python -m flake8 hello_world test

run:
	python main.py

.PHONY: test docker_build docker_run docker_push

test:
	PYTHONPATH=. python -m pytest --verbose -s

TAG=$(USERNAME)/sviatoslav65913

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer

docker_push: docker_build
	docker login -u $(USERNAME) -p $${DOCKER_PASSWORD}; \
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker logout