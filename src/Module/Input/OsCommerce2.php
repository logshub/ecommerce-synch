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
            CONCAT('p', p.products_id),
            pd.products_name,
            CONCAT('/product_info.php?products_id=',p.products_id),
            CONCAT('/images/', p.products_image),
            p.products_price,
            0,
            (SELECT configuration_value FROM osc_configuration WHERE configuration_key = 'DEFAULT_CURRENCY'),
            '',
            (SELECT GROUP_CONCAT(cd.categories_name SEPARATOR '|') FROM osc_products_to_categories AS pc JOIN osc_categories_description AS cd ON cd.categories_id = pc.categories_id WHERE pc.products_id = p.products_id),
            p.products_model
        FROM osc_products AS p
        JOIN osc_products_description AS pd ON p.products_id = pd.products_id
        ";
    }

    public function getCategoriesSql()
    {
        return "
        SELECT 'id', 'name', 'url', 'url_image'
        UNION
        SELECT
            CONCAT('c', c.categories_id),
            cd.categories_name,
            CONCAT('/index.php?cPath=', c.categories_id),
            CONCAT('/images/', c.categories_image)
        FROM osc_categories AS c
        JOIN osc_categories_description AS cd ON c.categories_id = cd.categories_id
        ";
    }
}