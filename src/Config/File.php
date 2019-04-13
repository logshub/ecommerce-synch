<?php
namespace Logshub\EcommerceSearch\Config;

class File extends \Logshub\SearchClient\Config\File
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
        if (!empty($config['pub_key'])){
            $this->pubKey = $config['pub_key'];
        }

        if (empty($config['output']) || empty($config['input']) || empty($config['synch'])){
            throw new \Logshub\EcommerceSearch\Exception('Configuration is not valid');
        }

        $this->input = $config['input'];
        $this->output = $config['output'];
        $this->synch = $config['synch'];
    }

    public function getInputModule()
    {
        return $this->getSectionOption('input', 'module', '');
    }

    public function getOutputModule()
    {
        return $this->getSectionOption('output', 'module', 'logshub-search');
    }

    public function getGenerateCsvByDatabase()
    {
        return (bool) $this->getSectionOption('synch', 'generate_csv_by_database', false);
    }

    public function getInput($key)
    {
        return $this->getSectionOption('input', $key, '');
    }

    public function getCsvDumpPath()
    {
        return $this->getGenerateCsvByDatabase() ?
            $this->getSectionOption('synch', 'dump_csv_by_db_directory', '') :
            $this->getSectionOption('synch', 'dump_csv_by_php_directory', '');
    }

    protected function getSectionOption($section, $key, $default = null)
    {
        return !empty($this->$section[$key]) ?
            $this->$section[$key] :
            $default;
    }
}
