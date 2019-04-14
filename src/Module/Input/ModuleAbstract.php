<?php
namespace Logshub\EcommerceSynch\Module\Input;

abstract class ModuleAbstract
{
    /**
     * @var \Logshub\EcommerceSynch\Config\File
     */
    protected $config;

    /**
     * @var array
     */
    protected static $modules;
    /**
     * @var int
     */
    protected $filenameTimestamp;

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

    public function setConfig(\Logshub\EcommerceSynch\Config\File $config)
    {
        $this->config = $config;
    }

    public function getDbPrefix()
    {
        return $this->config->getInput('db_prefix');
    }

    public function getDumpFilePath($isProductsDump)
    {
        if (!$this->filenameTimestamp){
            $this->filenameTimestamp = time();
        }
        return $this->config->getCsvDumpPath() .(
            $isProductsDump ?
            'products_'.$this->filenameTimestamp.'.csv' :
            'categories_'.$this->filenameTimestamp.'.csv');
    }

    public function getDumpToCsvSqlPostfix($path)
    {
        return "
        INTO OUTFILE '".$path."'
        FIELDS TERMINATED BY ';'
        ENCLOSED BY '\"'
        LINES TERMINATED BY '\n';
        ";
    }

    /**
     * @return callable|null
     */
    public function getProductCsvRowCallback()
    {
        // eg. [$this, 'onCsvRow']
        return null;
    }

    /**
     * @return callable|null
     */
    public function getCategoryCsvRowCallback()
    {
        // eg. [$this, 'onCsvRow']
        return null;
    }
}