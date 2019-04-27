<?php
namespace Logshub\EcommerceSynch\Module\Input;

class WooCommerce extends ModuleAbstract
{
    public function getName()
    {
        return 'woocommerce';
    }

    /**
     * @todo price tax excluded?
     */
    public function getProductsSql(\DateTime $time = null)
    {
        $prefix = $this->getDbPrefix();

        $sql = "
        SELECT 'id', 'name', 'url', 'url_image', 'price', 'price_old', 'currency', 'description', 'categories', 'sku'
        UNION
        SELECT
            CONCAT('p', p.id),
            p.post_title,
            CONCAT('/product/', p.post_name),
            img.guid,
            price.meta_value,
            sprice.meta_value,
            curr.option_value,
            '',
            (
                SELECT GROUP_CONCAT(terms.name SEPARATOR '|')
                FROM ".$prefix."term_relationships AS tr
                JOIN ".$prefix."term_taxonomy AS tt ON tr.term_taxonomy_id = tt.term_taxonomy_id AND taxonomy = 'product_cat'
                JOIN ".$prefix."terms AS terms ON terms.term_id = tt.term_id
                WHERE tr.object_id = p.id AND terms.name != 'Uncategorized'
                ORDER BY terms.term_id
            ),
            sku.meta_value
        FROM ".$prefix."posts AS p
        LEFT JOIN ".$prefix."postmeta AS imgth ON p.id = imgth.post_id AND imgth.meta_key = '_thumbnail_id'
        LEFT JOIN ".$prefix."posts AS img ON imgth.meta_value = img.id AND img.post_type = 'attachment'
        LEFT JOIN ".$prefix."postmeta AS price ON p.id = price.post_id AND price.meta_key = '_regular_price'
        LEFT JOIN ".$prefix."postmeta AS sprice ON p.id = sprice.post_id AND sprice.meta_key = '_sale_price'
        LEFT JOIN ".$prefix."options AS curr ON curr.option_name = 'woocommerce_currency'
        LEFT JOIN ".$prefix."postmeta AS sku ON p.id = sku.post_id AND sku.meta_key = '_sku'
        WHERE p.post_type = 'product' AND p.post_status = 'publish'
        ";

        if (!empty($time)) {
            $formatedDate = $time->format('Y-m-d H:i:s');
            $sql .= " AND p.post_modified >= '".$formatedDate."' ";
        }

        return $sql;
    }

    /**
     * @todo image
     */
    public function getCategoriesSql(\DateTime $time = null)
    {
        $prefix = $this->getDbPrefix();
        
        $sql = "
        SELECT 'id', 'name', 'url', 'url_image'
        UNION
        SELECT
            CONCAT('c', terms.term_id),
            terms.name,
            CONCAT('/product-category/', terms.slug, '/'),
            ''
        FROM ".$prefix."term_taxonomy AS tt
        JOIN ".$prefix."terms AS terms ON terms.term_id = tt.term_id
        WHERE taxonomy = 'product_cat' AND terms.name != 'Uncategorized'
        ";

        // unable to filter by date of modification,
        // as there is no such field in database for categories

        return $sql;
    }

    /**
     * @return string
     */
    public function getCurrentIdsSql()
    {
        $prefix = $this->getDbPrefix();
        
        return "
        SELECT CONCAT('p', p.id)
        FROM ".$prefix."posts AS p
        WHERE p.post_type = 'product' AND p.post_status = 'publish'
        
        UNION
        SELECT CONCAT('c', terms.term_id)
        FROM ".$prefix."term_taxonomy AS tt
        JOIN ".$prefix."terms AS terms ON terms.term_id = tt.term_id
        WHERE taxonomy = 'product_cat' AND terms.name != 'Uncategorized'
        ";
    }
}
