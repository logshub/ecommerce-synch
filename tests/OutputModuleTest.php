<?php
declare(strict_types=1);

use Logshub\EcommerceSynch\Module;

final class OutputModuleTest extends \PHPUnit\Framework\TestCase
{
    public function testModules()
    {
        $modules = Module\Registrar::getOutputModules();
        foreach ($modules as $module) {
            $this->assertInstanceOf(Module\Output\ModuleAbstract::class, $module);
        }
    }

    public function testSingleModule()
    {
        $conf = $this->getConfig();
        $module = Module\Registrar::getOutput($conf);
        $this->assertInstanceOf(Module\Output\ModuleAbstract::class, $module);
        $this->assertInstanceOf(Module\Output\LogsHubSearch::class, $module);

        $this->expectException(\Logshub\EcommerceSynch\Exception::class);
        $module->push('non-existing-csv-file');
    }

    public function testModuleWithWrongExe()
    {
        $conf = $this->getConfig();
        $conf->setOutput([
            'module' => 'logshub-search',
            'logshub_search_client_exe' => 'non-existing',
        ]);
        $module = Module\Registrar::getOutput($conf);

        // Logshub client command not found
        $this->expectException(\Logshub\EcommerceSynch\Exception::class);
        $module->push(\dirname(__FILE__) . '/testimportslog.csv');
    }

    private function getConfig()
    {
        return new \Logshub\EcommerceSynch\File\Config(dirname(__FILE__) . '/../config.example.ini');
    }
}
