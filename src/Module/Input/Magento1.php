<?php
namespace Logshub\EcommerceSynch\Module\Input;

class Magento1 extends ModuleAbstract
{
    /**
     * code => ID
     * @var array
     */
    protected $entityTypes = [];
    /**
     * code => ID
     * @var array
     */
    protected $attributes = [];

    public function getName()
    {
        return 'magento1';
    }

    /**
     * Returns ID of store
     */
    public function getStoreId()
    {
        return (int) $this->config->getInput('magento_store_id');
    }

    /**
     * selecting meta data
     */
    public function beforeProductsCsv(\PDO $db)
    {
        $this->prepareEavEntityTypes($db);
        $this->prepareAttributes($db);
    }

    /**
     * @todo price tax excluded?
     * @todo url slug
     */
    public function getProductsSql(\DateTime $time = null)
    {
        $prefix = $this->getDbPrefix();
        $storeId = $this->getStoreId();
        $etId = $this->getProductEntityTypeId();
        $aNameId = $this->getProductAttributeId('name'); // 71
        $aStatusId = $this->getProductAttributeId('status'); // 96
        $aImgId = $this->getProductAttributeId('thumbnail'); // 87
        $aPriceId = $this->getProductAttributeId('price'); // 75

        $etCatId = $this->getCategoryEntityTypeId();
        $aCatNameId = $this->getCategoryAttributeId('name'); // 41

        $sql = "
        SELECT 'id', 'name', 'url', 'url_image', 'price', 'price_old', 'currency', 'description', 'categories', 'sku'
        UNION
        SELECT
            CONCAT('p', p.entity_id),
            tblname.value,
            CONCAT('/catalog/product/view/id/', p.entity_id),
            CONCAT('/media/catalog/product/', tblimg.value),
            tblprice.value,
            0,
            (
                SELECT value
                FROM ".$prefix."core_config_data
                WHERE path = 'currency/options/base' AND scope_id = 0
                LIMIT 1
            ),
            '',
            (
                SELECT CONCAT_WS('|', tblcatname.value)
                FROM ".$prefix."catalog_category_product AS cp
                JOIN ".$prefix."catalog_category_entity AS c ON c.entity_id = cp.category_id
                JOIN ".$prefix."catalog_category_entity_varchar AS tblcatname ON tblcatname.entity_id = cp.category_id AND tblcatname.entity_type_id = ".$etCatId." AND tblcatname.attribute_id = ".$aCatNameId." AND tblcatname.store_id = ".$storeId."
                WHERE cp.product_id = p.entity_id
                LIMIT 1
            ),
            p.sku
        FROM ".$prefix."catalog_product_entity AS p
        JOIN ".$prefix."catalog_product_entity_varchar AS tblname ON tblname.entity_id = p.entity_id AND tblname.entity_type_id = ".$etId." AND tblname.attribute_id = ".$aNameId." AND tblname.store_id = ".$storeId."
        JOIN ".$prefix."catalog_product_entity_int AS tblstatus ON tblstatus.entity_id = p.entity_id AND tblstatus.entity_type_id = ".$etId." AND tblstatus.attribute_id = ".$aStatusId." AND tblstatus.store_id = ".$storeId."
        JOIN ".$prefix."catalog_product_entity_decimal AS tblprice ON tblprice.entity_id = p.entity_id AND tblprice.entity_type_id = ".$etId." AND tblprice.attribute_id = ".$aPriceId." AND tblprice.store_id = ".$storeId."
        LEFT JOIN ".$prefix."catalog_product_entity_varchar AS tblimg ON tblimg.entity_id = p.entity_id AND tblimg.entity_type_id = ".$etId." AND tblimg.attribute_id = ".$aImgId." AND tblimg.store_id = ".$storeId."
        WHERE tblstatus.value = 1
        ";

        if (!empty($time)) {
            $formatedDate = $time->format('Y-m-d H:i:s');
            $sql .= " AND p.updated_at >= '".$formatedDate."' ";
        }

        $sql .= ' GROUP BY p.entity_id';

        return $sql;
    }

    /**
     * @todo image
     */
    public function getCategoriesSql(\DateTime $time = null)
    {
        $prefix = $this->getDbPrefix();
        $storeId = $this->getStoreId();
        $etId = $this->getCategoryEntityTypeId();

        $aNameId = $this->getCategoryAttributeId('name'); // 41
        $aActiveId = $this->getCategoryAttributeId('is_active'); // 42

        $sql = "
        SELECT 'id', 'name', 'url', 'url_image'
        UNION
        SELECT
            CONCAT('c', c.entity_id),
            CONCAT_WS(', ', tblname.value),
            CONCAT('/catalog/category/view/id/', c.entity_id),
            ''
        FROM ".$prefix."catalog_category_entity AS c
        JOIN ".$prefix."catalog_category_entity_varchar AS tblname ON tblname.entity_id = c.entity_id AND tblname.entity_type_id = ".$etId." AND tblname.attribute_id = ".$aNameId." AND tblname.store_id = ".$storeId."
        JOIN ".$prefix."catalog_category_entity_int AS tblstatus ON tblstatus.entity_id = c.entity_id AND tblstatus.entity_type_id = ".$etId." AND tblstatus.attribute_id = ".$aActiveId." AND tblstatus.store_id = ".$storeId."
        WHERE tblstatus.value = 1
        ";

        if (!empty($time)) {
            $formatedDate = $time->format('Y-m-d H:i:s');
            $sql .= " AND c.updated_at >= '".$formatedDate."' ";
        }

        $sql .= ' GROUP BY c.entity_id';

        return $sql;
    }

    /**
     * @return string
     */
    public function getCurrentIdsSql()
    {
        $prefix = $this->getDbPrefix();
        $storeId = $this->getStoreId();
        $etId = $this->getProductEntityTypeId();
        $aStatusId = $this->getProductAttributeId('status'); // 96

        $etCatId = $this->getCategoryEntityTypeId();
        $aCatActiveId = $this->getCategoryAttributeId('is_active'); // 42
        
        return "
        SELECT CONCAT('p', p.entity_id)
        FROM ".$prefix."catalog_product_entity AS p
        JOIN ".$prefix."catalog_product_entity_int AS tblstatus ON tblstatus.entity_id = p.entity_id AND tblstatus.entity_type_id = ".$etId." AND tblstatus.attribute_id = ".$aStatusId." AND tblstatus.store_id = ".$storeId."
        WHERE tblstatus.value = 1
        
        UNION
        SELECT CONCAT('c', c.entity_id)
        FROM ".$prefix."catalog_category_entity AS c
        JOIN ".$prefix."catalog_category_entity_int AS tblstatus ON tblstatus.entity_id = c.entity_id AND tblstatus.entity_type_id = ".$etCatId." AND tblstatus.attribute_id = ".$aCatActiveId." AND tblstatus.store_id = ".$storeId."
        WHERE tblstatus.value = 1
        ";
    }

    protected function prepareEavEntityTypes(\PDO $db)
    {
        if (!empty($this->entityTypes)){
            return;
        }
        $prefix = $this->getDbPrefix();
        $stmt = $db->query('SELECT entity_type_id, entity_type_code FROM '.$prefix.'eav_entity_type WHERE entity_type_code IN("catalog_product", "catalog_category");');
        $stmt->execute();
        foreach ($stmt->fetchAll(\PDO::FETCH_ASSOC) as $row) {
            $this->entityTypes[$row['entity_type_code']] = (int) $row['entity_type_id'];
        }
    }

    protected function prepareAttributes(\PDO $db)
    {
        if (!empty($this->attributes)){
            return;
        }
        $prefix = $this->getDbPrefix();
        $sql = '
        SELECT a.attribute_id, a.entity_type_id, a.attribute_code, a.backend_type
        FROM '.$prefix.'eav_attribute AS a
        JOIN '.$prefix.'eav_entity_type AS et USING(entity_type_id)
        WHERE entity_type_code IN("catalog_product", "catalog_category");
        ';
        $stmt = $db->query($sql);
        $stmt->execute();
        foreach ($stmt->fetchAll(\PDO::FETCH_ASSOC) as $row) {
            $this->attributes[$row['entity_type_id']][$row['attribute_code']] = (int)$row['attribute_id'];
        }
    }

    /**
     * @return int
     */
    protected function getProductAttributeId($attributeCode)
    {
        $entityTypeId = $this->getProductEntityTypeId();

        return !empty($this->attributes[$entityTypeId][$attributeCode]) ? (int)$this->attributes[$entityTypeId][$attributeCode] : 0;
    }

    /**
     * @return int
     */
    protected function getCategoryAttributeId($attributeCode)
    {
        $entityTypeId = $this->getCategoryEntityTypeId();
        
        return !empty($this->attributes[$entityTypeId][$attributeCode]) ? (int)$this->attributes[$entityTypeId][$attributeCode] : 0;
    }

    /**
     * @return int
     */
    protected function getAttributeId($entityTypeId, $attributeCode)
    {
        return !empty($this->attributes[$entityTypeId][$attributeCode]) ? (int)$this->attributes[$entityTypeId][$attributeCode] : 0;
    }

    /**
     * @return int
     */
    protected function getProductEntityTypeId()
    {
        return !empty($this->entityTypes['catalog_product']) ? (int)$this->entityTypes['catalog_product'] : 0;
    }

    /**
     * @return int
     */
    protected function getCategoryEntityTypeId()
    {
        return !empty($this->entityTypes['catalog_category']) ? (int)$this->entityTypes['catalog_category'] : 0;
    }
}
