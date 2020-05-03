.PHONY: clean total-clean image up down test coverage

clean:
	find . -name "*.pyc" -delete

total-clean: clean
	find . -name "*~" -o -name "*.swp" -delete

image: total-clean
	docker build -t vm011126.massey.ac.nz/polyu/watchonmongo -f Dockerfile .

up:
	docker-compose -f docker/docker-compose.yml up -d --force-recreate

down:
	docker-compose -f docker/docker-compose.yml down -v

test: clean
	flask test

coverage: clean
	coverage run --source='.' --branch --omit="settings.py" `which flask` test
	coverage report
