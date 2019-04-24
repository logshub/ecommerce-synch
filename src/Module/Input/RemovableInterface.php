<?php
namespace Logshub\EcommerceSynch\Module\Input;

/**
 * Interface indicates whether input module could remove old documents
 * that exist in previous export and does not exist in current one.
 */
interface RemovableInterface
{
    /**
     * Returns SQL with all the tracked IDs of documents
     * @return string
     */
    public function getCurrentIdsSql();
}
