<?php
namespace Logshub\EcommerceSynch\Module\Input;

class OpenCart extends ModuleAbstract
{
    public function getName()
    {
        return 'opencart';
    }

    public function getProductsSql(\DateTime $time = null)
    {
        $prefix = $this->getDbPrefix();

        $sql = "
        SELECT 'id', 'name', 'url', 'url_image', 'price', 'price_old', 'currency', 'description', 'categories', 'sku', 'tmp_image_size'
        UNION
        SELECT
            CONCAT('p', p.product_id),
            pd.name,
            CONCAT('/index.php?route=product/product&product_id=',p.product_id),
            CONCAT('/image/cache/', p.image),
            p.price,
            0,
            (SELECT value FROM ".$prefix."setting WHERE `key` LIKE 'config_currency'),
            '',
            (
                SELECT GROUP_CONCAT(cd.name SEPARATOR '|')
                FROM ".$prefix."product_to_category AS pc
                JOIN ".$prefix."category_description AS cd ON cd.category_id = pc.category_id
                WHERE pc.product_id = p.product_id
            ),
            p.sku,
            (
                SELECT GROUP_CONCAT(value SEPARATOR 'x')
                FROM ".$prefix."setting
                WHERE `key` IN('config_image_product_width', 'config_image_product_height')
            )
        FROM ".$prefix."product AS p
        JOIN ".$prefix."product_description AS pd USING(product_id)
        WHERE status = 1
        ";

        if (!empty($time)) {
            $formatedDate = $time->format('Y-m-d H:i:s');
            $sql .= " AND p.date_modified >= '".$formatedDate."' ";
        }

        return $sql;
    }

    /**
     * @todo parent-child relation
     * @todo image
     */
    public function getCategoriesSql(\DateTime $time = null)
    {
        $prefix = $this->getDbPrefix();
        
        $sql = "
        SELECT 'id', 'name', 'url', 'url_image'
        UNION
        SELECT
            CONCAT('c', c.category_id),
            cd.name,
            CONCAT('/index.php?route=product/category&path=', c.category_id),
            ''
        FROM ".$prefix."category AS c
        JOIN ".$prefix."category_description AS cd ON c.category_id = cd.category_id
        ";

        if (!empty($time)) {
            $formatedDate = $time->format('Y-m-d H:i:s');
            $sql .= " WHERE c.date_modified >= '".$formatedDate."' ";
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
        SELECT CONCAT('p', p.product_id)
        FROM ".$prefix."product AS p
        JOIN ".$prefix."product_description AS pd USING(product_id)
        WHERE status = 1
        
        UNION
        SELECT CONCAT('c', c.category_id)
        FROM ".$prefix."category AS c
        JOIN ".$prefix."category_description AS cd ON c.category_id = cd.category_id
        ";
    }

    public function getProductCsvRowCallback()
    {
        return [$this, 'onCsvRow'];
    }

    /**
     * Adds size into image url eg.
     * /image/cache/catalog/demo/macbook_1.jpg
     * /image/cache/catalog/demo/macbook_1-228x228.jpg
     */
    public function onCsvRow(array $row)
    {
        $size = $row[10];
        unset($row[10]);

        if (empty($row[3]) || empty($size)) {
            return $row;
        }

        $lastDot = \strrpos($row[3], '.');
        if ($lastDot) {
            $row[3] = \substr($row[3], 0, $lastDot) .
                '-' . $size .
                \substr($row[3], $lastDot);
        }

        return $row;
    }
}
