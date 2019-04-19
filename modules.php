<?php

use Logshub\EcommerceSynch\Module\Registrar;
use Logshub\EcommerceSynch\Module;

Registrar::registerInput(new Module\Input\OsCommerce2());
Registrar::registerInput(new Module\Input\OpenCart());
Registrar::registerInput(new Module\Input\PrestaShop());

Registrar::registerOutput(new Module\Output\LogsHubSearch());
