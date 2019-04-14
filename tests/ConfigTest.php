<?php
declare(strict_types=1);

final class ConfigTest extends \PHPUnit\Framework\TestCase
{
    public function testConfig()
    {
        $path = dirname(__FILE__) . '/../config.example.ini';
        $config = new \Logshub\EcommerceSynch\Config\File($path);
        
        $this->assertEquals(false, $config->getGenerateCsvByDatabase());
        $this->assertEquals('/tmp/', $config->getCsvDumpPath());
        $this->assertEquals('logshub-search', $config->getOutputModule());
        $this->assertEquals('oscommerce2', $config->getInputModule());
        $this->assertEquals('mysql', $config->getInput('db_driver'));
        $this->assertEquals('127.0.0.1', $config->getInput('db_host'));
        $this->assertEquals('.', $config->getInput('db_user'));
        $this->assertEquals('..', $config->getInput('db_pass'));
        $this->assertEquals('...', $config->getInput('db_name'));
        $this->assertEquals('osc_', $config->getInput('db_prefix'));
    }
}