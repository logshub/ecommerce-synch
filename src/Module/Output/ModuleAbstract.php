<?php
namespace Logshub\EcommerceSynch\Module\Output;

abstract class ModuleAbstract
{
    /**
     * @var \Logshub\EcommerceSynch\Config\File
     */
    protected $config;
    
    /**
     * @return string
     */
    public abstract function getName();

    public abstract function push($csvPath, $isCategoriesPush = false);

    public function setConfig(\Logshub\EcommerceSynch\Config\File $config)
    {
        $this->config = $config;
    }
}