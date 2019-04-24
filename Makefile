test:
	./vendor/bin/phpunit --bootstrap vendor/autoload.php --testdox tests
run:
	php bin/ecommerce-synch synch -c config.ini
cs-fixer:
	php-cs-fixer fix .
