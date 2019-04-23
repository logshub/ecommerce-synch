<?php
namespace Logshub\EcommerceSynch\Module\Input;

class PrestaShop extends ModuleAbstract implements RemovableInterface
{
    public function getName()
    {
        return 'prestashop';
    }

    /**
     * Returns id of shop to process
     */
    public function getShopId()
    {
        return (int)$this->config->getInput('prestashop_shop_id');
    }

    /**
     * @todo price tax excluded?
     * @todo link from product_lang.link_rewrite
     * @todo jpg always?
     * @todo check product.date_upd
     */
    public function getProductsSql()
    {
        $prefix = $this->getDbPrefix();
        $shopId = $this->getShopId();

        return "
        SELECT 'id', 'name', 'url', 'url_image', 'price', 'price_old', 'currency', 'description', 'categories', 'sku'
        UNION
        SELECT
            CONCAT('p', p.id_product),
            pd.name,
            CONCAT('/index.php?controller=product&id_product=',p.id_product),
            concat(
				'/img/p/',
				mid(im.id_image,1,1),
				'/',
				if (length(im.id_image)>1,concat(mid(im.id_image,2,1),'/'),''),
				if (length(im.id_image)>2,concat(mid(im.id_image,3,1),'/'),''),
				if (length(im.id_image)>3,concat(mid(im.id_image,4,1),'/'),''),
				if (length(im.id_image)>4,concat(mid(im.id_image,5,1),'/'),''),
				im.id_image,
				'.jpg'
			),
            p.price,
            0,
            c.iso_code,
            '',
            (
                SELECT GROUP_CONCAT(pcd.name SEPARATOR '|')
				FROM ".$prefix."category AS pc
				JOIN ".$prefix."category_lang AS pcd ON pcd.id_category = pc.id_category
				JOIN ".$prefix."category_product AS pcc ON pcc.id_category = pc.id_category
				WHERE pcc.id_product = p.id_product AND is_root_category = 0 AND pcd.id_shop = ".$shopId."
				ORDER BY level_depth DESC
            ),
            p.reference
        FROM ".$prefix."product AS p
        JOIN ".$prefix."product_lang AS pd ON p.id_product = pd.id_product AND pd.id_shop = ".$shopId."
        JOIN ".$prefix."currency_shop AS cs ON pd.id_shop = cs.id_shop
        JOIN ".$prefix."currency AS c ON cs.id_currency = c.id_currency
        LEFT JOIN ".$prefix."image AS im ON p.id_product = im.id_product AND cover = 1
        WHERE p.active = 1
        ";
    }

    /**
     * @todo parent-child relation
     * @todo image
     */
    public function getCategoriesSql()
    {
        $prefix = $this->getDbPrefix();
        $shopId = $this->getShopId();
        
        return "
        SELECT 'id', 'name', 'url', 'url_image'
        UNION
        SELECT
            CONCAT('c', c.id_category),
            CONCAT_WS(', ', cd2.name, cd1.name, cd.name),
            CONCAT('/index.php?controller=category&id_category=', c.id_category),
            ''
        FROM ".$prefix."category AS c
        JOIN ".$prefix."category_lang AS cd ON c.id_category = cd.id_category
        LEFT JOIN ".$prefix."category AS c1 ON c1.id_category = c.id_parent AND c1.is_root_category = 0 AND c1.active = 1
        LEFT JOIN ".$prefix."category_lang AS cd1 ON c1.id_category = cd1.id_category AND cd1.id_shop = ".$shopId."
        LEFT JOIN ".$prefix."category AS c2 ON c2.id_category = c1.id_parent AND c2.is_root_category = 0 AND c2.active = 1
        LEFT JOIN ".$prefix."category_lang AS cd2 ON c2.id_category = cd2.id_category AND cd2.id_shop = ".$shopId."
        WHERE cd.id_shop = ".$shopId." AND c.is_root_category = 0 AND c.active = 1
        ";
    }

    /**
     * For RemovableInterface
     * @return string
     */
    public function getCurrentIdsSql()
    {
        $prefix = $this->getDbPrefix();
        $shopId = $this->getShopId();
        
        return "
        SELECT CONCAT('p', p.id_product)
        FROM ".$prefix."product AS p
        JOIN ".$prefix."product_lang AS pd ON p.id_product = pd.id_product AND pd.id_shop = ".$shopId."
        JOIN ".$prefix."currency_shop AS cs ON pd.id_shop = cs.id_shop
        JOIN ".$prefix."currency AS c ON cs.id_currency = c.id_currency
        WHERE p.active = 1
        
        UNION
        SELECT CONCAT('c', c.id_category)
        FROM ".$prefix."category AS c
        JOIN ".$prefix."category_lang AS cd ON c.id_category = cd.id_category
        WHERE cd.id_shop = ".$shopId." AND c.is_root_category = 0 AND c.active = 1
        ";
    }
}
