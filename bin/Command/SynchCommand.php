<?php
namespace Logshub\EcommerceSearch\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputOption;

class SynchCommand extends Command
{
    /**
     * @var \Logshub\EcommerceSearch\Config\File
     */
    protected $config;
    
    protected function configure()
    {
        $this->setName("synch")
            ->setDescription("Synchronize ecommerce products and categories with logshub.com search service")
            ->addOption('config', 'c', InputOption::VALUE_REQUIRED, 'Path to INI file with logshub configuration', null);
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $output->writeln('synch');
    }
}