<?php
namespace Logshub\EcommerceSearch;

class Synchronizer
{
    /**
     * @var \Logshub\EcommerceSearch\Config\File
     */
    protected $config;
    /**
     * @var \PDO
     */
    protected $db;

    protected $inputModule;
    protected $outputModule;

    public function __construct(\Logshub\EcommerceSearch\Config\File $config)
    {
        $this->config = $config;
    }

    public function pushIntoIndex($csvPath, $isCategoriesPush = false)
    {

    }

    public function dumpCategoriesCsv()
    {
        
    }

    public function dumpProductsCsv()
    {
        $input = $this->getInputModule();
        $sql = $input->getProductsSql();

        if ($this->config->getGenerateCsvByDatabase()){

        } else {
            // TODO: implement
            throw new Exception('NOT IMPLEMENTED YET');
            // $result = $this->getDbConnection()->execute($sql);
            // $stmt = $pdo->query('SELECT name FROM users');
            // while ($row = $stmt->fetch()){
            //     echo $row['name'] . "\n";
            // }
        }
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

        $this->db = new \PDO($dsn, $username, $password, [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ]);

        return $this->db;
    }
}