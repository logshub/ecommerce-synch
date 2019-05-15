<?php
declare(strict_types=1);

use Logshub\EcommerceSynch\Module;

/**
 * This test assumes that database exists and testdatabase.sql is loaded
 */
final class SqlTest extends \PHPUnit\Framework\TestCase
{
    public function testOpenCartModuleQueries()
    {
        $this->checkModule('opencart', 'oc_', 19, 38, 57);
        $this->checkModule('opencart', 'oc_', 19, 1, 57, '2011-07-16 02:00:00');
        $this->checkModule('opencart', 'oc_', 1, 0, 57, '2011-09-30 01:07:22');
    }
    public function testOsCommerceModuleQueries()
    {
        $this->checkModule('oscommerce2', 'osc_', 28, 21, 49);
        $this->checkModule('oscommerce2', 'osc_', 0, 0, 49, '2011-09-30 01:07:22');
    }
    public function testPrestashopModuleQueries()
    {
        $this->checkModule('prestashop', 'newprefix_', 18, 9, 27);
        $this->checkModule('prestashop', 'newprefix_', 1, 1, 27, '2019-04-24 10:30:00');
    }
    public function testSyliusModuleQueries()
    {
        $this->checkModule('sylius', 'sylius_', 56, 6, 62);
        $this->checkModule('sylius', 'sylius_', 30, 3, 62, '2019-04-19 22:45:09');
    }
    public function testWooCommerceModuleQueries()
    {
        $this->checkModule('woocommerce', 'wp_', 12, 3, 15);
        $this->checkModule('woocommerce', 'wp_', 1, 3, 15, '2019-04-20 15:41:00');
    }
    public function testMagento1ModuleQueries()
    {
        $this->checkModule('magento1', '', 67, 28, 95);
        $this->checkModule('magento1', '', 3, 3, 95, '2014-03-08 08:57:00');
    }
    public function testMagento2ModuleQueries()
    {
        $this->checkModule('magento2', '', 67, 28, 95);
        $this->checkModule('magento2', '', 3, 3, 95, '2014-03-08 08:57:00');
    }

    private function checkModule($moduleName, $dbPrefix, $expectedProducts, $expectedCategories, $expectedTotalAllIds, $lastImportDate = null)
    {
        if ($lastImportDate){
            $lastImportDate = \DateTime::createFromFormat('Y-m-d H:i:s', $lastImportDate);
        }
        $conf = $this->getConfig($moduleName, $dbPrefix);
        $module = Module\Registrar::getInput($conf);
        $synchronizer = new \Logshub\EcommerceSynch\Synchronizer($conf);
        $module->beforeProductsCsv($synchronizer->getDbConnection());
        try {
            $stmt = $synchronizer->execSQL($module->getProductsSql($lastImportDate));
            $this->checkStatement($stmt, $expectedProducts+1); // +1 because sqls always returns header row
    
            $stmt = $synchronizer->execSQL($module->getCategoriesSql($lastImportDate));
            $this->checkStatement($stmt, $expectedCategories+1);

            $stmt = $synchronizer->execSQL($module->getCurrentIdsSql());
            $this->checkStatement($stmt, $expectedTotalAllIds);
        } catch (\PDOException $e){
            // no tests for wrong DB connection
            foreach (['No route to host', 'Access denied'] as $err){
                if (!strpos($e->getMessage(), $err)){
                    throw $e;
                }
            }
        }
    }

    private function checkStatement(\PDOStatement $stmt, $expectedCounter, $callback = null)
    {
        $counter = 0;
        $stmt->execute();
        $rows = $stmt->fetchAll(\PDO::FETCH_NUM);
        foreach ($rows as $row) {
            if (\is_callable($callback)) {
                \call_user_func($callback, $counter, $row);
            }
            ++$counter;
        }

        $this->assertEquals($expectedCounter, $counter);
    }

    private function getConfig($module, $dbPrefix)
    {
        $configBase = [
            'db_driver' => "mysql",
            'db_host' => "192.168.1.141",
            'db_user' => "oscommerce",
            'db_pass' => "password",
            'db_name' => "testdatabase",
            'check_update_dates' => 1,
            'prestashop_shop_id' => "1",
            'sylius_locale' => "en_US",
            'magento_store_id' => 0,
        ];
        $conf = new \Logshub\EcommerceSynch\File\Config(dirname(__FILE__) . '/../config.example.ini');
        $conf->setInput(array_merge($configBase, [
            'module' => $module,
            'db_prefix' => $dbPrefix,
        ]));

        return $conf;
    }
}
