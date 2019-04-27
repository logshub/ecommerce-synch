<?php
namespace Logshub\EcommerceSynch\Module\Input;

class OsCommerce2 extends ModuleAbstract
{
    public function getName()
    {
        return 'oscommerce2';
    }

    public function getProductsSql(\DateTime $time = null)
    {
        $prefix = $this->getDbPrefix();

        $sql = "
        SELECT 'id', 'name', 'url', 'url_image', 'price', 'price_old', 'currency', 'description', 'categories', 'sku'
        UNION
        SELECT
            CONCAT('p', p.products_id),
            pd.products_name,
            CONCAT('/product_info.php?products_id=',p.products_id),
            CONCAT('/images/', p.products_image),
            p.products_price,
            0,
            (SELECT configuration_value FROM ".$prefix."configuration WHERE configuration_key = 'DEFAULT_CURRENCY'),
            '',
            (SELECT GROUP_CONCAT(cd.categories_name SEPARATOR '|') FROM ".$prefix."products_to_categories AS pc JOIN ".$prefix."categories_description AS cd ON cd.categories_id = pc.categories_id WHERE pc.products_id = p.products_id),
            p.products_model
        FROM ".$prefix."products AS p
        JOIN ".$prefix."products_description AS pd ON p.products_id = pd.products_id
        WHERE p.products_status = 1
        ";

        if (!empty($time)) {
            // p.products_last_modified can be NULL, but it will be imported on the first time (not time provided here)
            $formatedDate = $time->format('Y-m-d H:i:s');
            $sql .= " AND p.products_last_modified >= '".$formatedDate."' ";
        }

        return $sql;
    }

    public function getCategoriesSql(\DateTime $time = null)
    {
        $prefix = $this->getDbPrefix();
        
        $sql = "
        SELECT 'id', 'name', 'url', 'url_image'
        UNION
        SELECT
            CONCAT('c', c.categories_id),
            cd.categories_name,
            CONCAT('/index.php?cPath=', c.categories_id),
            CONCAT('/images/', c.categories_image)
        FROM ".$prefix."categories AS c
        JOIN ".$prefix."categories_description AS cd ON c.categories_id = cd.categories_id
        ";

        if (!empty($time)) {
            // c.last_modified can be NULL, but it will be imported on the first time (not time provided here)
            $formatedDate = $time->format('Y-m-d H:i:s');
            $sql .= " WHERE c.last_modified >= '".$formatedDate."' ";
        }

        return $sql;
    }

    /**
     * @return string
     */
    public function getCurrentIdsSql()
    {
        $prefix = $this->getDbPrefix();
        
        return "
        SELECT CONCAT('p', p.products_id)
        FROM ".$prefix."products AS p
        JOIN ".$prefix."products_description AS pd ON p.products_id = pd.products_id
        WHERE p.products_status = 1
        
        UNION
        SELECT CONCAT('c', c.categories_id)
        FROM ".$prefix."categories AS c
        JOIN ".$prefix."categories_description AS cd ON c.categories_id = cd.categories_id
        ";
    }
}
