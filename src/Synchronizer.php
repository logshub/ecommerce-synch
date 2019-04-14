<?php
namespace Logshub\EcommerceSynch;

class Synchronizer
{
    /**
     * @var \Logshub\EcommerceSynch\Config\File
     */
    protected $config;
    /**
     * @var \PDO
     */
    protected $db;

    protected $inputModule;
    protected $outputModule;

    public function __construct(\Logshub\EcommerceSynch\Config\File $config)
    {
        $this->config = $config;
    }

    public function pushIntoIndex($csvPath, $isCategoriesPush = false)
    {
        $output = $this->getOutputModule();

        return $output->push($csvPath, $isCategoriesPush);
    }

    /**
     * @todo refactor
     * @return string Full path to CSV file
     * @throws Exception
     */
    public function dumpCategoriesCsv()
    {
        $input = $this->getInputModule();
        $sql = $input->getCategoriesSql();
        $filePath = $input->getDumpFilePath(false);

        if ($this->config->getGenerateCsvByDatabase()){
            $sql .= $input->getDumpToCsvSqlPostfix($filePath);
            $this->getDbConnection()->exec($sql);

            $err = $this->getDbConnection()->errorInfo();
            if ($err[0] != '00000'){
                throw new Exception('Unable to dump products CSV: ' . $err[0] . ' ' . $err[2]);
            }
        } else {
            $stmt = $this->getDbConnection()->query($sql);
            $err = $this->getDbConnection()->errorInfo();
            if ($err[0] != '00000'){
                throw new Exception('Unable to dump products CSV: ' . $err[0] . ' ' . $err[2]);
            }
            $csvWriter = new \Logshub\EcommerceSynch\Csv\Writer($filePath);
            $csvWriter->write($stmt);
        }

        return $filePath;
    }

    /**
     * @todo refactor
     * @return string Full path to CSV file
     * @throws Exception
     */
    public function dumpProductsCsv()
    {
        $input = $this->getInputModule();
        $sql = $input->getProductsSql();
        $filePath = $input->getDumpFilePath(true);

        if ($this->config->getGenerateCsvByDatabase()){
            $sql .= $input->getDumpToCsvSqlPostfix($filePath);
            $this->getDbConnection()->exec($sql);

            $err = $this->getDbConnection()->errorInfo();
            if ($err[0] != '00000'){
                throw new Exception('Unable to dump products CSV: ' . $err[0] . ' ' . $err[2]);
            }
        } else {
            $stmt = $this->getDbConnection()->query($sql);
            $err = $this->getDbConnection()->errorInfo();
            if ($err[0] != '00000'){
                throw new Exception('Unable to dump products CSV: ' . $err[0] . ' ' . $err[2]);
            }
            $csvWriter = new \Logshub\EcommerceSynch\Csv\Writer($filePath);
            $csvWriter->write($stmt);
        }

        return $filePath;
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

    protected function getOutputModule()
    {
        if ($this->outputModule){
            return $this->outputModule;
        }

        $this->outputModule = Module\Registrar::getOutput($this->config);

        return $this->outputModule;
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
}
