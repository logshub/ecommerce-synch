# Developers Docs

TODO: automate provisioning

### Preparing databases

```
CREATE DATABASE testdatabase;
GRANT ALL ON testdatabase.* TO oscommerce IDENTIFIED BY 'password';

CREATE DATABASE oscommerce23;
GRANT ALL ON oscommerce23.* TO oscommerce IDENTIFIED BY 'password';
CREATE DATABASE oscommerce2341;
GRANT ALL ON oscommerce2341.* TO oscommerce IDENTIFIED BY 'password';
CREATE DATABASE oscommerce242;
GRANT ALL ON oscommerce242.* TO oscommerce IDENTIFIED BY 'password';

CREATE DATABASE opencart2102;
GRANT ALL ON opencart2102.* TO opencart IDENTIFIED BY 'password';
CREATE DATABASE opencart2200;
GRANT ALL ON opencart2200.* TO opencart IDENTIFIED BY 'password';
CREATE DATABASE opencart2302;
GRANT ALL ON opencart2302.* TO opencart IDENTIFIED BY 'password';
CREATE DATABASE opencart3002;
GRANT ALL ON opencart3002.* TO opencart IDENTIFIED BY 'password';
CREATE DATABASE opencart3012;
GRANT ALL ON opencart3012.* TO opencart IDENTIFIED BY 'password';
CREATE DATABASE opencart3031;
GRANT ALL ON opencart3031.* TO opencart IDENTIFIED BY 'password';

CREATE DATABASE prestashop1751;
GRANT ALL ON prestashop1751.* TO prestashop IDENTIFIED BY 'password';
CREATE DATABASE prestashop1744;
GRANT ALL ON prestashop1744.* TO prestashop IDENTIFIED BY 'password';
CREATE DATABASE prestashop1734;
GRANT ALL ON prestashop1734.* TO prestashop IDENTIFIED BY 'password';
CREATE DATABASE prestashop1725;
GRANT ALL ON prestashop1725.* TO prestashop IDENTIFIED BY 'password';
CREATE DATABASE prestashop1712;
GRANT ALL ON prestashop1712.* TO prestashop IDENTIFIED BY 'password';
CREATE DATABASE prestashop1706;
GRANT ALL ON prestashop1706.* TO prestashop IDENTIFIED BY 'password';
CREATE DATABASE prestashop16123;
GRANT ALL ON prestashop16123.* TO prestashop IDENTIFIED BY 'password';
CREATE DATABASE prestashop16110;
GRANT ALL ON prestashop16110.* TO prestashop IDENTIFIED BY 'password';

CREATE DATABASE sylius;
GRANT ALL ON sylius.* TO sylius IDENTIFIED BY 'password';
# php bin/console server:start 0.0.0.0:8081

CREATE DATABASE woocommerce;
GRANT ALL ON woocommerce.* TO woocommerce IDENTIFIED BY 'password';

CREATE DATABASE magento19;
GRANT ALL ON magento19.* TO oscommerce IDENTIFIED BY 'password';
CREATE DATABASE magento16;
GRANT ALL ON magento16.* TO oscommerce IDENTIFIED BY 'password';

FLUSH privileges;
```

Backup

```
mysqldump --host=192.168.1.141 -u oscommerce -ppassword opencart2102 oc_product oc_product_description oc_category oc_category_description oc_setting oc_product_to_category > testdatabase.sql
mysqldump --host=192.168.1.141 -u oscommerce -ppassword oscommerce242 osc_products osc_products_description osc_categories osc_categories_description osc_configuration osc_products_to_categories >> testdatabase.sql
mysqldump --host=192.168.1.141 -u oscommerce -ppassword prestashop1751 newprefix_product newprefix_product_lang newprefix_currency_shop newprefix_currency newprefix_image newprefix_category newprefix_category_lang newprefix_category_product >> testdatabase.sql
mysqldump --host=192.168.1.141 -u oscommerce -ppassword sylius sylius_product sylius_product_translation sylius_product_image sylius_taxon sylius_taxon_translation sylius_product_variant sylius_channel_pricing sylius_channel sylius_currency >> testdatabase.sql
mysqldump --host=192.168.1.141 -u oscommerce -ppassword woocommerce wp_posts wp_postmeta wp_options wp_term_relationships wp_term_taxonomy wp_terms >> testdatabase.sql
mysqldump --host=192.168.1.141 -u oscommerce -ppassword magento19 core_config_data catalog_category_product catalog_category_entity catalog_category_entity_varchar catalog_category_entity_int catalog_product_entity catalog_product_entity_varchar catalog_product_entity_int catalog_product_entity_decimal eav_entity_type eav_attribute >> testdatabase.sql

mysql --host=192.168.1.141 -u oscommerce -ppassword testdatabase < testdatabase.sql
```

Clearing database from not needed content

```
DELETE FROM wp_options WHERE LENGTH(option_value) > 1000;
update osc_configuration set configuration_description = '';
update newprefix_product_lang set description = '', description_short = '';
update oc_category_description set description = '';
update oc_product_description set description = '';
update osc_products_description set products_description = '';
update sylius_product_translation set description = '';
update sylius_taxon_translation set description = '';
update wp_posts set post_content = '';
update wp_options set configuration_description = '';
update osc_configuration set configuration_description = '';

# magento 1
DELETE FROM catalog_category_entity_int WHERE attribute_id != 42;
DELETE FROM catalog_category_entity_varchar WHERE attribute_id != 41;
DELETE FROM catalog_product_entity WHERE entity_id > 300;
DELETE FROM catalog_product_entity_decimal WHERE attribute_id != 75;
DELETE FROM catalog_product_entity_int WHERE attribute_id != 96;
DELETE FROM catalog_product_entity_varchar WHERE attribute_id NOT IN(71,87);
DELETE FROM core_config_data WHERE path != 'currency/options/base';
DELETE FROM eav_attribute WHERE attribute_code NOT IN('name','status','thumbnail','price','is_active');
```

### osCommerce

```
cd /var/www
git clone https://github.com/osCommerce/oscommerce2.git

sudo nano /etc/nginx/sites-available/oscommerce.local.conf
sudo ln -s /etc/nginx/sites-available/oscommerce.local.conf /etc/nginx/sites-enabled/oscommerce.local.conf

sudo chmod 777 /var/www/oscommerce/catalog/includes/configure.php
sudo chmod 777 /var/www/oscommerce/catalog/admin/includes/configure.php
```

nginx config

```
upstream myapp_phpfpm_oscommerce.local {
  server unix:/run/php/php7.2-fpm.sock;
}

server {
    server_name oscommerce.local;
    server_name_in_redirect off;

    root /var/www/oscommerce2/catalog;
    access_log /var/log/nginx/oscommerce.local.log;
    error_log /var/log/nginx/oscommerce.local.error.log;
    index index.php;

    # expires max on static content
    location / { expires max; }

    # Inaccessible locations
    location ~ ^/includes/.*\.php$ { return 403; }
    location ~ ^/admin/includes/.*\.php$ { return 403; }
    location ^~ /admin/backups { return 403; }
    location ^~ /download { return 403; }

    # osCommerce rewrites
    location ~ -p-(?<id>[0-9]+)\.html$ { rewrite ^ /product_info.php?products_id=$id; }
    location ~ -c-(?<id>[0-9_]+)\.html$ { rewrite ^ /index.php?cPath=$id; }
    location ~ -m-(?<id>[0-9]+)\.html$ { rewrite ^ /index.php?manufacturers_id=$id; }
    location ~ -pi-(?<id>[0-9]+)\.html$ { rewrite ^ /popup_image.php?pID=$id; }
    location ~ -pr-(?<id>[0-9]+)\.html$ { rewrite ^ /product_reviews.php?products_id=$id; }
    location ~ -pri-(?<id>[0-9]+)\.html$ { rewrite ^ /product_reviews_info.php?products_id=$id; }

    # Articles contribution
    location ~ -t-(?<id>[0-9_]+)\.html$ { rewrite ^ /articles.php?tPath=$id; }
    location ~ -a-(?<id>[0-9]+)\.html$ { rewrite ^ /article_info.php?articles_id=$id; }

    # Information pages
    location ~ -i-(?<id>[0-9]+)\.html$ { rewrite ^ /information.php?info_id=$id; }

    # Links contribution
    location ~ -links-(?<id>[0-9_]+)\.html$ { rewrite ^ /links.php?lPath=$id; }

    # Newsdesk contribution
    location ~ -n-(?<id>[0-9]+)\.html$ { rewrite ^ /newsdesk_info.php?newsdesk_id=$id; }
    location ~ -nc-(?<id>[0-9]+)\.html$ { rewrite ^ /newsdesk_index.php?newsPath=$id; }
    location ~ -nri-(?<id>[0-9]+)\.html$ { rewrite ^ /newsdesk_reviews_info.php?newsdesk_id=$id; }
    location ~ -nra-(?<id>[0-9]+)\.html$ { rewrite ^ /newsdesk_reviews_article.php?newsdesk_id=$id; }

    # Pass to php
    location ~ \.php$ {
      if (!-f $request_filename) { return 404; }

      fastcgi_split_path_info ^(/update/index.php)(/.+)$;
      fastcgi_pass   myapp_phpfpm_oscommerce.local;
      fastcgi_index  index.php;
      fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
      fastcgi_param REDIRECT_STATUS 200;
      fastcgi_param  PATH_INFO        $fastcgi_path_info;
      include        fastcgi_params;
    }
}
```

## Magento 1.9

```
upstream myapp_phpfpm_magento19.local {
  server unix:/run/php/php7.2-fpm.sock;
}

server {
  listen 80;

  root /var/www/magento19;
  index index.php;

  server_name magento19.local;

  location / {
    try_files $uri $uri/ /index.php?q=$uri&$args;
  }

  error_page 404 /404.html;

  error_page 500 502 503 504 /50x.html;
  location = /50x.html {
    root /usr/share/nginx/www;
  }

  location ~ .php$ {
    # fastcgi_split_path_info ^(/update/index.php)(/.+)$;
    fastcgi_pass myapp_phpfpm_magento19.local;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    fastcgi_param REDIRECT_STATUS 200;
    fastcgi_param  PATH_INFO        $fastcgi_path_info;
    include        fastcgi_params;
  }

  location ~* .(js|css|png|jpg|jpeg|gif|ico)$ {
    expires 1y;
  }

  location ~* .(htm|html)$ {
    expires 1m;
  }

}
```