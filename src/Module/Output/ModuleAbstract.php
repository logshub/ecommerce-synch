<?php
namespace Logshub\EcommerceSynch\Module\Output;

abstract class ModuleAbstract
{
    /**
     * @var \Logshub\EcommerceSynch\File\Config
     */
    protected $config;
    
    /**
     * @return string name of output module (configuration value must match)
     */
    abstract public function getName();
    /**
     * Push documents into remote system
     * @return string output of command
     */
    abstract public function push($csvPath, $isCategoriesPush = false);
    /**
     * Removes documents by given ids
     * @return int number of removed documents
     */
    abstract public function remove($ids);

    /**
     * @param \Logshub\EcommerceSynch\File\Config $config
     */
    public function setConfig(\Logshub\EcommerceSynch\File\Config $config)
    {
        $this->config = $config;
    }
}
