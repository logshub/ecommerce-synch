<?php
declare(strict_types=1);

use Logshub\EcommerceSynch\Module;

final class InputModuleTest extends \PHPUnit\Framework\TestCase
{
    public function testModules()
    {
        $modules = Module\Registrar::getInputModules();
        foreach ($modules as $module) {
            $module->setConfig($this->getConfig());
            $this->assertInstanceOf(Module\Input\ModuleAbstract::class, $module);
            $this->assertEquals(true, is_string($module->getProductsSql()));
            $this->assertEquals(true, is_string($module->getCategoriesSql()));
        }
    }

    public function testSingleModule()
    {
        $module = Module\Registrar::getInput($this->getConfig());
        $this->assertInstanceOf(Module\Input\ModuleAbstract::class, $module);
        $this->assertInstanceOf(Module\Input\OsCommerce2::class, $module);

        $this->assertEquals(true, is_string($module->getProductsSql()));
        $this->assertEquals(true, is_string($module->getCategoriesSql()));
    }

    private function getConfig()
    {
        return new \Logshub\EcommerceSynch\File\Config(dirname(__FILE__) . '/../config.example.ini');
    }
}
