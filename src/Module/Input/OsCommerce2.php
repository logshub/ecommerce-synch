<?php
namespace Logshub\EcommerceSearch\Module\Input;

class OsCommerce2 extends ModuleAbstract
{
    public function getName()
    {
        return 'oscommerce2';
    }

    public function getProductsSql()
    {
        return "
        SELECT 'id', 'name', 'url', 'url_image', 'price', 'price_old', 'currency', 'description', 'categories', 'sku'
        UNION
        SELECT
            p.products_id,
            pd.products_name,
            CONCAT('/product_info.php?products_id='',p.products_id),
            CONCAT('/images/', p.products_image),
            p.products_price,
            0,
            (select configuration_value from osc_configuration where configuration_key = 'DEFAULT_CURRENCY'),
            '',
            (SELECT GROUP_CONCAT(cd.categories_name SEPARATOR '|') FROM osc_products_to_categories AS pc JOIN osc_categories_description AS cd ON cd.categories_id = pc.categories_id WHERE pc.products_id = p.products_id),
            p.products_model
        FROM osc_products AS p
        JOIN osc_products_description AS pd ON p.products_id = pd.products_id
        INTO OUTFILE '/var/lib/mysql-files/products.csv'
        FIELDS TERMINATED BY ';'
        ENCLOSED BY '\"' LINES TERMINATED BY '\n';
        ";
    }

    public function getCategoriesSql()
    {
        return "
        SELECT 'id', 'name', 'url', 'url_image'
        UNION
        SELECT c.categories_id, cd.categories_name, CONCAT('/index.php?cPath=', c.categories_id), CONCAT('/images/', c.categories_image)
        FROM osc_categories AS c
        JOIN osc_categories_description AS cd ON c.categories_id = cd.categories_id
        INTO OUTFILE '/var/lib/mysql-files/categories.csv'
        FIELDS TERMINATED BY ';'
        ENCLOSED BY '\"'
        LINES TERMINATED BY '\n';
        ";
    }
}