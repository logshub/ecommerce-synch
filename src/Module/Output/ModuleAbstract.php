<?php
namespace Logshub\EcommerceSynch\Module\Output;

abstract class ModuleAbstract
{
    /**
     * @var \Logshub\EcommerceSynch\Config\File
     */
    protected $config;
    
    /**
     * @return string name of output module (configuration value must match)
     */
    public abstract function getName();
    /**
     * Push documents into remote system
     * @return string output of command
     */
    public abstract function push($csvPath, $isCategoriesPush = false);
    /**
     * Removes documents by given ids
     * @return int number of removed documents
     */
    public abstract function remove($ids);

    /**
     * @param \Logshub\EcommerceSynch\Config\File $config
     */
    public function setConfig(\Logshub\EcommerceSynch\Config\File $config)
    {
        $this->config = $config;
    }
}