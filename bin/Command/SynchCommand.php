<?php
namespace Logshub\EcommerceSynch\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputOption;

class SynchCommand extends Command
{
    protected function configure()
    {
        $this->setName("synch")
            ->setDescription("Synchronize ecommerce products and categories with logshub.com search service")
            ->addOption('config', 'c', InputOption::VALUE_REQUIRED, 'Path to INI file with logshub configuration', null);
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $config = new \Logshub\EcommerceSynch\File\Config($input->getOption('config'));
        $synchronizer = new \Logshub\EcommerceSynch\Synchronizer($config);

        $csvProductsPath = $synchronizer->dumpProductsCsv();
        $output->writeln('Products CSV path: ' . $csvProductsPath);
        $prodResult = $synchronizer->pushIntoIndex($csvProductsPath);
        $output->writeln('Result: ' . $prodResult);

        $csvCategoriesPath = $synchronizer->dumpCategoriesCsv();
        $output->writeln('Categories CSV path: ' . $csvCategoriesPath);
        $catResult = $synchronizer->pushIntoIndex($csvCategoriesPath, true);
        $output->writeln('Result: ' . $catResult);

        // categories + products
        $droppedIds = $synchronizer->dropRemoved();
        $output->writeln('Dropped total: ' . count($droppedIds));
        foreach ($droppedIds as $droppedId){
            $output->writeln('Dropped: #' . $droppedId);
        }
    }
}