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
        $module = Module\Registrar::getOutput($this->getConfig());
        $this->assertInstanceOf(Module\Output\ModuleAbstract::class, $module);
        $this->assertInstanceOf(Module\Output\LogsHubSearch::class, $module);

        $this->expectException(\Logshub\EcommerceSynch\Exception::class);
        $module->push('non-existing-csv-file');
    }

    private function getConfig()
    {
        return new \Logshub\EcommerceSynch\File\Config(dirname(__FILE__) . '/../config.example.ini');
    }
}
