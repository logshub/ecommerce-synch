<?php
namespace Logshub\EcommerceSynch\File;

use Logshub\EcommerceSynch\Exception;

class Config extends \Logshub\SearchClient\Config\File
{
    /**
     * @var array
     */
    protected $input;
    /**
     * @var array
     */
    protected $output;
    /**
     * @var array
     */
    protected $synch;
    /**
     * @var array
     */
    protected $log;

    /**
     * @var string
     */
    protected $apidomain;

    public function load()
    {
        $config = \parse_ini_file($this->filePath, true);
        if (empty($config['serviceid']) || empty($config['location']) || empty($config['apihash']) || empty($config['apisecret'])) {
            throw new Exception('Config file does not contain required keys. See documentation.');
        }

        $this->serviceId = $config['serviceid'];
        $this->location = $config['location'];
        $this->apiHash = $config['apihash'];
        $this->apiSecret = $config['apisecret'];
        if (!empty($config['pub_key'])) {
            $this->pubKey = $config['pub_key'];
        }
        if (!empty($config['apidomain'])) {
            $this->apidomain = $config['apidomain'];
        }

        if (empty($config['output']) || empty($config['input']) || empty($config['synch'])) {
            throw new Exception('Configuration is not valid');
        }

        $this->input = $config['input'];
        $this->output = $config['output'];
        $this->synch = $config['synch'];
        $this->log = $config['log'];
    }

    public function setInput(array $input)
    {
        $this->input = $input;
    }

    public function setOutput(array $output)
    {
        $this->output = $output;
    }
    
    public function getInputModule()
    {
        return $this->getSectionOption('input', 'module', '');
    }

    public function getOutputModule()
    {
        return $this->getSectionOption('output', 'module', 'logshub-search');
    }

    public function getOutputTimeout()
    {
        return (int)$this->getSectionOption('output', 'timeout', 3600);
    }

    public function getLogFile()
    {
        return $this->getSectionOption('log', 'file', '/tmp/ecommerce-synch.log');
    }

    public function getLogLevel()
    {
        $level = $this->getSectionOption('log', 'level', 'INFO');
        if (!\in_array($level, ['DEBUG','INFO','NOTICE','WARNING','ERROR'])){
            throw new Exception('Wrong log.level configuration');
        }

        return $level;
    }

    public function getGenerateCsvByDatabase()
    {
        return (bool) $this->getSectionOption('synch', 'generate_csv_by_database', false);
    }

    public function getInput($key)
    {
        return $this->getSectionOption('input', $key, '');
    }

    public function getCheckUpdateDates()
    {
        return (bool)$this->getInput('check_update_dates');
    }

    public function getCsvDumpPath()
    {
        $path = $this->getGenerateCsvByDatabase() ?
            $this->getSectionOption('synch', 'dump_csv_by_db_directory', '') :
            $this->getSectionOption('synch', 'dump_csv_by_php_directory', '');

        if (!\preg_match('/^[a-zA-Z\/_-]+$/', $path)) {
            throw new Exception('CSV dump directory is not valid');
        }

        return \substr($path, -1) !== '/' ? $path.'/' : $path;
    }

    public function getApiDomain()
    {
        return $this->apidomain ? $this->apidomain : 'apisearch.logshub.com';
    }

    public function getFilePath()
    {
        return $this->filePath;
    }

    /**
     * @return string
     */
    public function getOutputOption($key)
    {
        return $this->getSectionOption('output', $key);
    }

    public function getRootAbsolutePath()
    {
        $paths = [
            // if it is in project
            \dirname(\dirname(\dirname(__FILE__))) . '/',
            // if it is loaded by composer
            \dirname(\dirname(\dirname(\dirname(\dirname(\dirname(__FILE__)))))) . '/',
        ];
        foreach ($paths as $path) {
            if (\file_exists($path . 'vendor/')) {
                return $path;
            }
        }

        throw new Exception('Unable to determine root path');
    }

    protected function getSectionOption($section, $key, $default = null)
    {
        return !empty($this->$section[$key]) ?
            $this->$section[$key] :
            $default;
    }
}
