<?php
namespace Logshub\EcommerceSynch\File;

use Logshub\EcommerceSynch\Exception;

class ImportsLog extends CsvWriter
{
    /**
     * @var array
     */
    protected $lastRow;

    public function writeAllIds(\PDOStatement $stmt)
    {
        $rowToSave = [];
        $result = $stmt->execute();
        $rows = $stmt->fetchAll(\PDO::FETCH_NUM);
        foreach ($rows as $row){
            $rowToSave[] = $row[0];
        }
        $rowToSave[] = time();

        parent::writeRows([$rowToSave]);

        return $rowToSave;
    }

    /**
     * @return int
     */
    public function getLastImportDate()
    {
        $lastRow = $this->getLastRow();

        return (int)$lastRow[count($lastRow)-1];
    }

    /**
     * @todo mechanism to remove old logs (first lines of file)
     * @todo not needed to read everything, could be slow on huge stores
     */
    public function readAll()
    {
        if (!\file_exists($this->filePath)){
            return [];
        }
        if (($handle = \fopen($this->filePath, "r")) === false) {
            throw new Exception('Unable to read CSV file');
        }
        $rows = [];
        while ($csvLine = \fgetcsv($handle, 0, $this->csvSeparator)) {
            $rows[] = $csvLine;
        }
        \fclose($handle);

        return $rows;
    }

    public function getLastRow()
    {
        if (!empty($this->lastRow)){
            return $this->lastRow;
        }

        $all = $this->readAll();
        if (empty($all)){
            return 0;
        }
        $this->lastRow = $all[count($all)-1];

        return $this->lastRow;
    }
}
