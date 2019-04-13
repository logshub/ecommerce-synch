<?php
namespace Logshub\EcommerceSearch\Module\Input;

abstract class ModuleAbstract
{
    /**
     * @var \Logshub\EcommerceSearch\Config\File
     */
    protected $config;

    /**
     * @var array
     */
    protected static $modules;

    /**
     * Returns SQL that will return result with proper structure
     * @return string
     */
    public abstract function getProductsSql();

    /**
     * Returns SQL that will return result with proper structure
     * @return string
     */
    public abstract function getCategoriesSql();

    /**
     * @return string
     */
    public abstract function getName();

    public function setConfig(\Logshub\EcommerceSearch\Config\File $config)
    {
        $this->config = $config;
    }

    public static function all(\Logshub\EcommerceSearch\Config\File $config)
    {
        if (!empty(self::$modules)){
            return self::$modules;
        }
        self::$modules = [
            new OsCommerce2($config),
        ];

        return self::$modules;
    }

    public static function get(\Logshub\EcommerceSearch\Config\File $config, $name = null)
    {
        return [
            new OsCommerce2($config),
        ];
    }
}