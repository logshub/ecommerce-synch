<?php
namespace Logshub\EcommerceSynch\Module\Input;

use Logshub\EcommerceSynch\Exception;

abstract class ModuleAbstract
{
    /**
     * @var \Logshub\EcommerceSynch\File\Config
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
     * @var \Monolog\Logger
     */
    protected $logger;

    /**
     * Returns SQL that will return result with proper structure
     * @return string
     */
    abstract public function getProductsSql(\DateTime $time = null);

    /**
     * Returns SQL that will return result with proper structure
     * @return string
     */
    abstract public function getCategoriesSql(\DateTime $time = null);

    /**
     * Returns SQL with all the tracked IDs of documents
     * @return string
     */
    abstract public function getCurrentIdsSql();

    /**
     * @return string
     */
    abstract public function getName();

    public function setConfig(\Logshub\EcommerceSynch\File\Config $config)
    {
        $this->config = $config;
    }

    public function setLogger(\Monolog\Logger $logger)
    {
        $this->logger = $logger;
    }

    public function setDbConnection(\Logshub\EcommerceSynch\File\Config $config)
    {
        $this->config = $config;
    }

    public function getDbPrefix()
    {
        $prefix = $this->config->getInput('db_prefix');
        if (!preg_match('/^[a-zA-Z0-9_]*$/', $prefix)) {
            throw new Exception('Database prefix is not valid');
        }
        return $prefix;
    }

    public function getDumpFilePath($isProductsDump)
    {
        if (!$this->filenameTimestamp) {
            $this->filenameTimestamp = time();
        }
        return $this->config->getCsvDumpPath() .(
            $isProductsDump ?
            'products_'.$this->filenameTimestamp.'.csv' :
            'categories_'.$this->filenameTimestamp.'.csv'
        );
    }

    public function getImportsLogFilePath()
    {
        return $this->config->getCsvDumpPath() . 'importslog.csv';
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

    public function beforeProductsCsv(\PDO $db)
    {
        // eg. selecting meta data
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
