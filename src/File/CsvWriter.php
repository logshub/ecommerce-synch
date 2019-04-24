<?php
namespace Logshub\EcommerceSynch\File;

use Logshub\EcommerceSynch\Exception;

class CsvWriter
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
     * @return array of written IDs
     * @throws Exception
     */
    public function write(\PDOStatement $stmt, $callback)
    {
        $this->validate();
        if (($handle = \fopen($this->filePath, "wb")) === false) {
            throw new Exception('Unable to write CSV file');
        }
        $ids = [];
        $result = $stmt->execute();
        $rows = $stmt->fetchAll(\PDO::FETCH_NUM);
        foreach ($rows as $row) {
            if (\is_callable($callback)) {
                $row = \call_user_func($callback, $row);
            }
            \fputcsv($handle, $row, $this->csvSeparator);
            $ids[] = $row[0];
        }
        \fclose($handle);

        return $ids;
    }

    /**
     * @throws Exception
     */
    public function writeRows($rows)
    {
        $this->validate();
        if (($handle = \fopen($this->filePath, "a")) === false) {
            throw new Exception('Unable to write CSV file');
        }
        foreach ($rows as $row) {
            \fputcsv($handle, $row, $this->csvSeparator);
        }
        \fclose($handle);
    }
}
