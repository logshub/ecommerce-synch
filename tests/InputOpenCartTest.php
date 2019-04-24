<?php
declare(strict_types=1);

use Logshub\EcommerceSynch\Module;

final class InputOpenCartTest extends \PHPUnit\Framework\TestCase
{
    public function testRowConversion()
    {
        $inputOpenCartModule = new Module\Input\OpenCart();
        $newRow = $inputOpenCartModule->onCsvRow([
            3 => '/image/cache/catalog/demo/macbook_1.jpg',
            10 => '228x228'
        ]);
        $this->assertEquals('/image/cache/catalog/demo/macbook_1-228x228.jpg', $newRow[3]);

        $newRow = $inputOpenCartModule->onCsvRow([
            3 => '/image/cache/catalog/demo/macbook_1.jpeg',
            10 => '228x228'
        ]);
        $this->assertEquals('/image/cache/catalog/demo/macbook_1-228x228.jpeg', $newRow[3]);
    }
}
