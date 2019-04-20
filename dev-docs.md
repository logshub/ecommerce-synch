# Developers Docs

TODO: automate provisioning

### Preparing databases

```
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

CREATE DATABASE woocommerce;
GRANT ALL ON woocommerce.* TO woocommerce IDENTIFIED BY 'password';

FLUSH privileges;
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