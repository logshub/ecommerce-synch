<?php
namespace Logshub\EcommerceSynch\Module;

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
        if (!$module instanceof Input\ModuleAbstract){
            throw new \Logshub\EcommerceSynch\Exception('module registration error - wrong instance');
        }
        self::$inputModules[] = $module;
    }

    public static function registerOutput(Output\ModuleAbstract $module)
    {
        if (!$module instanceof Output\ModuleAbstract){
            throw new \Logshub\EcommerceSynch\Exception('module registration error - wrong instance');
        }
        self::$outputModules[] = $module;
    }

    public static function getOutput(\Logshub\EcommerceSynch\Config\File $config)
    {
        $name = $config->getOutputModule();
        foreach (self::$outputModules as $module){
            if ($module->getName() === $name){
                $module->setConfig($config);
                return $module;
            }
        }

        throw new \Logshub\EcommerceSynch\Exception('Unable to get output module');
    }

    public static function getInput(\Logshub\EcommerceSynch\Config\File $config)
    {
        $name = $config->getInputModule();
        foreach (self::$inputModules as $module){
            if ($module->getName() === $name){
                $module->setConfig($config);
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