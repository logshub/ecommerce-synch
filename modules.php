<?php

use Logshub\EcommerceSearch\Module\Registrar;
use Logshub\EcommerceSearch\Module;

Registrar::registerInput(new Module\Input\OsCommerce2());
Registrar::registerOutput(new Module\Output\LogsHubSearch());
