<?php
namespace Logshub\EcommerceSearch\Module\Output;

abstract class ModuleAbstract
{
    /**
     * @var \Logshub\EcommerceSearch\Config\File
     */
    protected $config;
    
    /**
     * @return string
     */
    public abstract function getName();

    public abstract function push($csvPath, $isCategoriesPush = false);

    public function setConfig(\Logshub\EcommerceSearch\Config\File $config)
    {
        $this->config = $config;
    }
}