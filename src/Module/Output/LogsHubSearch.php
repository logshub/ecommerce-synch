<?php
namespace Logshub\EcommerceSynch\Module\Output;

use Symfony\Component\Process\Process;
use Logshub\EcommerceSynch\Exception;

class LogsHubSearch extends ModuleAbstract
{
    public function getName()
    {
        return 'logshub-search';
    }

    public function push($csvPath, $isCategoriesPush = false)
    {
        $clientPath = $this->config->getRootAbsolutePath() . 'vendor/bin/logshub-search';
        $cmdArray = [
            'php', $clientPath, 'index:csv',
            '--config', $this->config->getFilePath(),
            '--csv', $csvPath,
            '--domain', $this->config->getApiDomain(),
            '--csv-separator', ';'
        ];
        if ($isCategoriesPush) {
            $cmdArray = array_merge($cmdArray, ['--categories']);
        }
        
        $process = new Process($cmdArray);
        $process->run();
        if (!$process->isSuccessful()) {
            throw new Exception('Synchronization error '.$process->getErrorOutput().'Command: ' . \implode(' ', $cmdArray));
        }

        return $process->getOutput();
    }
}
