<?php
namespace Logshub\EcommerceSynch\Module;

use \Logshub\EcommerceSynch\Synchronizer;

class Registrar
{
    /**
     * @var array
     */
    protected static $inputModules = [];
    /**
     * @var array
     */
    protected static $outputModules = [];

    public static function registerInput(Input\ModuleAbstract $module)
    {
        if (!$module instanceof Input\ModuleAbstract) {
            throw new \Logshub\EcommerceSynch\Exception('module registration error - wrong instance');
        }
        self::$inputModules[] = $module;
    }

    public static function registerOutput(Output\ModuleAbstract $module)
    {
        if (!$module instanceof Output\ModuleAbstract) {
            throw new \Logshub\EcommerceSynch\Exception('module registration error - wrong instance');
        }
        self::$outputModules[] = $module;
    }

    public static function getOutput(\Logshub\EcommerceSynch\File\Config $config)
    {
        $name = $config->getOutputModule();
        foreach (self::$outputModules as $module) {
            if ($module->getName() === $name) {
                $logger = Synchronizer::getLogger($config);
                $logger->info('used output module: ' . $name);
                $module->setConfig($config);
                $module->setLogger($logger);
                return $module;
            }
        }

        throw new \Logshub\EcommerceSynch\Exception('Unable to get output module');
    }

    public static function getInput(\Logshub\EcommerceSynch\File\Config $config)
    {
        $name = $config->getInputModule();
        foreach (self::$inputModules as $module) {
            if ($module->getName() === $name) {
                $logger = Synchronizer::getLogger($config);
                $logger->info('used input module: ' . $name);
                $module->setConfig($config);
                $module->setLogger($logger);
                return $module;
            }
        }

        throw new \Logshub\EcommerceSynch\Exception('Unable to get input module');
    }

    public static function getOutputModules()
    {
        return self::$outputModules;
    }

    public static function getInputModules()
    {
        return self::$inputModules;
    }
}
