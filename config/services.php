<?php

declare(strict_types=1);

namespace App\Config;

use Symfony\Component\DependencyInjection\Loader\Configurator\ContainerConfigurator;

return function (ContainerConfigurator $containerConfigurator): void {
    $servicesConfigurator = $containerConfigurator
        ->services()
        ->defaults()
        ->autowire()
        ->autoconfigure();

    $servicesConfigurator
        ->load('Steevanb\\DevOps\\', '../src/')
        ->exclude('../src/Kernel.php');
};
