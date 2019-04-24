<?php
namespace Logshub\EcommerceSynch\Module\Input;

class Sylius extends ModuleAbstract
{
    public function getName()
    {
        return 'sylius';
    }

    /**
     * Returns Sylius locale to export
     * @todo validate
     */
    public function getLocale()
    {
        return $this->config->getInput('sylius_locale');
    }

    /**
     * @todo price tax excluded?
     * @todo WHERE pt.updated_at ...
     */
    public function getProductsSql(\DateTime $time = null)
    {
        $prefix = $this->getDbPrefix();
        $locale = $this->getLocale();

        $sql = "
        SELECT 'id', 'name', 'url', 'url_image', 'price', 'price_old', 'currency', 'description', 'categories', 'sku'
        UNION
        SELECT
            CONCAT('p', p.id),
            pd.name,
            CONCAT('/', pd.locale, '/products/',pd.slug),
            CONCAT('/media/cache/sylius_shop_product_thumbnail/', pimg.path),
            (
				SELECT (vp.price / 100) AS price
				FROM ".$prefix."product_variant AS v
				JOIN ".$prefix."channel_pricing AS vp ON v.id = vp.product_variant_id
				WHERE v.product_id = p.id AND v.on_hold = 0
				ORDER BY position ASC
				LIMIT 1
            ),
            0,
            (
                SELECT curr.code
                FROM ".$prefix."product_variant AS v
                JOIN ".$prefix."channel_pricing AS vp ON v.id = vp.product_variant_id
                JOIN ".$prefix."channel AS cha ON vp.channel_code = cha.code
                JOIN ".$prefix."currency AS curr ON cha.base_currency_id = curr.id
                WHERE v.product_id = p.id AND v.on_hold = 0
                ORDER BY position ASC
                LIMIT 1
            ),
            '',
            (
                SELECT CONCAT_WS('|', ptd1.name, ptd.name)
                FROM ".$prefix."taxon AS pt
                JOIN ".$prefix."taxon_translation AS ptd ON ptd.translatable_id = pt.id AND ptd.locale = '".$locale."'
                LEFT JOIN ".$prefix."taxon AS pt1 ON pt.parent_id = pt1.id AND pt1.parent_id IS NOT NULL
                LEFT JOIN ".$prefix."taxon_translation AS ptd1 ON ptd1.translatable_id = pt1.id AND ptd1.locale = '".$locale."'
                WHERE pt.id = p.main_taxon_id
            ),
            ''
        FROM ".$prefix."product AS p
        JOIN ".$prefix."product_translation AS pd ON p.id = pd.translatable_id AND pd.locale = '".$locale."'
        LEFT JOIN ".$prefix."product_image AS pimg ON pimg.owner_id = p.id AND pimg.type = 'thumbnail'
        WHERE p.enabled = 1
        GROUP BY p.id
        ";

        // @todo support date of update

        return $sql;
    }

    /**
     * @todo WHERE pt.updated_at ...
     * @todo image
     */
    public function getCategoriesSql(\DateTime $time = null)
    {
        $prefix = $this->getDbPrefix();
        $locale = $this->getLocale();
        
        $sql = "
        SELECT 'id', 'name', 'url', 'url_image'
        UNION
        SELECT
            CONCAT('c', pt.id),
            CONCAT_WS(', ', ptd2.name, ptd1.name, ptd.name),
            CONCAT('/', ptd.locale, '/taxons/',ptd.slug),
            ''
        FROM ".$prefix."taxon AS pt
        JOIN ".$prefix."taxon_translation AS ptd ON ptd.translatable_id = pt.id AND ptd.locale = '".$locale."'
        LEFT JOIN ".$prefix."taxon AS pt1 ON pt.parent_id = pt1.id AND pt1.parent_id IS NOT NULL
        LEFT JOIN ".$prefix."taxon_translation AS ptd1 ON ptd1.translatable_id = pt1.id AND ptd1.locale = '".$locale."'
        LEFT JOIN ".$prefix."taxon AS pt2 ON pt1.parent_id = pt2.id AND pt2.parent_id IS NOT NULL
        LEFT JOIN ".$prefix."taxon_translation AS ptd2 ON ptd2.translatable_id = pt2.id AND ptd2.locale = '".$locale."'
        WHERE pt.parent_id IS NOT NULL;
        ";

        // @todo support date of update

        return $sql;
    }
}
