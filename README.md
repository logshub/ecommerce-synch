# eCommerce Synch

TODO: image with ecommerce platforms on the left, synch in center, and logshub on the right side.

This is NOT a plugin to any of eCommerce platform. This is standalone application
that process data from store's database (by modules for specific platform) into
other system eg. LogsHub.com search service.

### Supported eCommerce platforms

* osCommerce (2.3.4.1 - 2.4.2)

### How does it work

...

### Requirements

* PHP 7 (PDO, pdo_mysql)
* Composer - https://getcomposer.org/

### Installation (easy)

That way is OK for small and medium stores.
It is easier to setup, but little bit less optimal,
as CSV files will be generated by PHP code insetad of database itself.

1. `composer require logshub/ecommerce-synch`
2. `cp ecommerce-synch/config.example.ini ecommerce-synch/config.ini`
3. Setup your `ecommerce-synch/config.ini`: logshub credentials, input module and database connection. Set `generate_csv_by_database = 0` (easy configuration).
4. Add into your cron: `php bin/ecommerce-search synch -c config.ini` every day in the night.

### Installation (advanced)

It is more advanced setup, but more optimal,
as CSV files will be generated by database itself insetad of PHP code.

1. Make sure you run this code on the same server with database - access to `/var/lib/mysql-files/` needed.
2. Your DB user must have `FILE` privilege in database (see below).
3. Process with the "easy" installation steps with this exception: `generate_csv_by_database = 1`.

AD 2

```
GRANT FILE ON *.* TO oscommerce;
FLUSH PRIVILEGES;
```

### How to create input module?

...

### Input modules to do

* WooCommerce Checkout
* Magento
* PrestaShop
* OpenCart
* osCommerce
* Sylius
* Ubercart - https://www.drupal.org/project/ubercart 
* Spree - https://github.com/spree/spree
