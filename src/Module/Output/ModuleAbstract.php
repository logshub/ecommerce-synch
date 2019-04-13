<?php
namespace Logshub\EcommerceSearch\Module\Output;

abstract class ModuleAbstract
{
    /**
     * @return string
     */
    public abstract function getName();

    public abstract function push();
}