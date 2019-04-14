<?php
namespace Logshub\EcommerceSynch\Csv;

use Logshub\EcommerceSynch\Exception;

class Writer
{
    protected $filePath;
    protected $csvSeparator;

    /**
     * @throws Exception
     */
    public function __construct($filePath, $csvSeparator = ';')
    {
        $this->filePath = $filePath;
        $this->csvSeparator = $csvSeparator;
        $this->validate();
    }

    /**
     * @return bool
     * @throws Exception
     */
    public function validate()
    {
        if (!\is_writeable(\dirname($this->filePath))) {
            throw new Exception('CSV file is not writable');
        }

        return true;
    }

    /**
     * @throws Exception
     */
    public function write(\PDOStatement $stmt)
    {
        $this->validate();
        if (($handle = \fopen($this->filePath, "wb")) === false) {
            throw new Exception('Unable to write CSV file');
        }
        $result = $stmt->execute();
        $rows = $stmt->fetchAll(\PDO::FETCH_NUM);
        foreach ($rows as $row) {
            \fputcsv($handle, $row, $this->csvSeparator);
        }
        \fclose($handle);
    }
}
