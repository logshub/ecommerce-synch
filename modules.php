<?php

use Logshub\EcommerceSynch\Module\Registrar;
use Logshub\EcommerceSynch\Module;

Registrar::registerInput(new Module\Input\OsCommerce2());
Registrar::registerInput(new Module\Input\OpenCart());
Registrar::registerInput(new Module\Input\PrestaShop());
Registrar::registerInput(new Module\Input\WooCommerce());
Registrar::registerInput(new Module\Input\Sylius());
Registrar::registerInput(new Module\Input\Magento1());
Registrar::registerInput(new Module\Input\Magento2());

Registrar::registerOutput(new Module\Output\LogsHubSearch());
