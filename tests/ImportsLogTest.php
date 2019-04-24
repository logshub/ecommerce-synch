<?php
declare(strict_types=1);

final class ImportsLogTest extends \PHPUnit\Framework\TestCase
{
    public function testFile()
    {
        $path = dirname(__FILE__) . '/testimportslog.csv';
        $importsLog = new \Logshub\EcommerceSynch\File\ImportsLog($path);
        $all = $importsLog->readAll();
        $lastRow = $importsLog->getLastRow(); // p2;p3;p5;p6;p7;2019-04-24T09:02:44+02:00

        $lastImport = $importsLog->getLastImportDate();
        
        $this->assertEquals(2, count($all));
        $this->assertEquals(6, count($all[1]));
        $this->assertEquals(6, count($lastRow));
        $this->assertEquals('p2', $lastRow[0]);
        $this->assertEquals('p7', $lastRow[4]);
        $this->assertEquals('2019-04-24T09:02:44+02:00', $lastImport->format(\DateTime::ATOM));
    }
}
