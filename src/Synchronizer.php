<?php
namespace Logshub\EcommerceSynch;

class Synchronizer
{
    /**
     * @var \Logshub\EcommerceSynch\File\Config
     */
    protected $config;
    /**
     * @var \PDO
     */
    protected $db;
    /**
     * @var Module\Input\ModuleAbstract
     */
    protected $inputModule;
    /**
     * @var Module\Output\ModuleAbstract
     */
    protected $outputModule;
    /**
     * @var \Logshub\EcommerceSynch\File\ImportsLog
     */
    protected $importLog;

    public function __construct(\Logshub\EcommerceSynch\File\Config $config)
    {
        $this->config = $config;
    }

    /**
     * @return string command raw output
     */
    public function pushIntoIndex($csvPath, $isCategoriesPush = false)
    {
        $output = $this->getOutputModule();

        return $output->push($csvPath, $isCategoriesPush);
    }

    /**
     * @return string Full path to CSV file
     * @throws Exception
     */
    public function dumpCategoriesCsv()
    {
        $lastImportDate = null;
        if ($this->config->getCheckUpdateDates()){
            $lastImportDate = $this->getImportLog()->getLastImportDate();
        }
        $input = $this->getInputModule();
        $sql = $input->getCategoriesSql($lastImportDate);
        $filePath = $input->getDumpFilePath(false);

        if ($this->config->getGenerateCsvByDatabase()){
            $sql .= $input->getDumpToCsvSqlPostfix($filePath);
            $this->execSQL($sql);
            // TODO: read CSV file, call callback for every row, and then save
        } else {
            $stmt = $this->execSQL($sql);
            $csvWriter = new \Logshub\EcommerceSynch\File\CsvWriter($filePath);
            $csvWriter->write($stmt, $input->getCategoryCsvRowCallback());
        }

        return $filePath;
    }

    /**
     * @todo use "Eventable" interface that indicate whether module supports generating by database
     * for not no events supported in this case
     * @return string Full path to CSV file
     * @throws Exception
     */
    public function dumpProductsCsv()
    {
        $lastImportDate = null;
        if ($this->config->getCheckUpdateDates()){
            $lastImportDate = $this->getImportLog()->getLastImportDate();
        }
        $input = $this->getInputModule();
        $sql = $input->getProductsSql($lastImportDate);
        $filePath = $input->getDumpFilePath(true);

        if ($this->config->getGenerateCsvByDatabase()){
            $sql .= $input->getDumpToCsvSqlPostfix($filePath);
            $this->execSQL($sql);
            // TODO: read CSV file, call callback for every row, and then save
        } else {
            $stmt = $this->execSQL($sql);
            $csvWriter = new \Logshub\EcommerceSynch\File\CsvWriter($filePath);
            $csvWriter->write($stmt, $input->getProductCsvRowCallback());
        }

        return $filePath;
    }

    /**
     * @todo refactor as mothod should not save
     * @return array of current IDs (products + categories) by SQL statement
     */
    public function getCurrentIds()
    {
        $input = $this->getInputModule();
        $sql = $input->getCurrentIdsSql();

        $stmt = $this->execSQL($sql);
        $importLog = $this->getImportLog();

        return $importLog->writeAllIds($stmt);
    }

    /**
     * @todo current ids is saved into log file before DELETE action - in case of failure
     * it will not be executed more
     * @return array of dropped IDs
     */
    public function dropRemoved()
    {
        $input = $this->getInputModule();
        if (!$input instanceof Module\Input\RemovableInterface){
            return [];
        }
         // from previously saved file
        $previousIds = $this->getPreviousIds();
        // from SQL query
        $currentIds = $this->getCurrentIds();
        if (empty($previousIds)){
            return [];
        }
        
        // elements that exists in the previous import and does not exists not
        $idsToRemove = array_diff($previousIds, $currentIds);
        $this->getOutputModule()->remove($idsToRemove);

        return $idsToRemove;
    }

    protected function getPreviousIds()
    {
        $importLog = $this->getImportLog();
        $lastRow = $importLog->getLastRow();
        array_pop($lastRow); // last element is timestamp

        return $lastRow;
    }

    /**
     * @var Module\Input\ModuleAbstract
     */
    protected function getInputModule()
    {
        if ($this->inputModule){
            return $this->inputModule;
        }

        $this->inputModule = Module\Registrar::getInput($this->config);

        return $this->inputModule;
    }

    /**
     * @var Module\Output\ModuleAbstract
     */
    protected function getOutputModule()
    {
        if ($this->outputModule){
            return $this->outputModule;
        }

        $this->outputModule = Module\Registrar::getOutput($this->config);

        return $this->outputModule;
    }

    /**
     * @return \PDOStatement
     */
    protected function execSQL($sql)
    {
        $stmt = $this->getDbConnection()->query($sql);
        $err = $this->getDbConnection()->errorInfo();
        if ($err[0] != '00000'){
            throw new Exception('Unable to execute: ' . $err[0] . ' ' . $err[2]);
        }

        return $stmt;
    }

    /**
     * @throws \PDOException
     */
    protected function getDbConnection()
    {
        if ($this->db){
            return $this->db;
        }

        $driver = $this->config->getInput('db_driver');
        $host = $this->config->getInput('db_host');
        $name = $this->config->getInput('db_name');
        $dsn = $driver.':host='.$host.';dbname='.$name.';charset=utf8mb4';
        $username = $this->config->getInput('db_user');
        $password = $this->config->getInput('db_pass');

        $this->db = new \PDO($dsn, $username, $password);

        return $this->db;
    }

    protected function getImportLog()
    {
        if (!empty($this->importLog)){
            return $this->importLog;
        }
        $logPath = $this->getInputModule()->getImportsLogFilePath();

        $this->importLog = new \Logshub\EcommerceSynch\File\ImportsLog($logPath);

        return $this->importLog;
    }
}
