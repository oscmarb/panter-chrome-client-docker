build:
	@docker build -t panther .

run:
	@docker run --rm -t panther sh -c 'php /app/app.php -a $(url)'