<?php

use Logshub\EcommerceSynch\Module\Registrar;
use Logshub\EcommerceSynch\Module;

Registrar::registerInput(new Module\Input\OsCommerce2());
Registrar::registerOutput(new Module\Output\LogsHubSearch());
