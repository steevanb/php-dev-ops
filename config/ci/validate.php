<?php

declare(strict_types=1);

use Steevanb\ParallelProcess\{
    Console\Application\ParallelProcessesApplication,
    Process\Process
};
use Symfony\Component\Console\Input\ArgvInput;

$projectPath = dirname(__DIR__, 2);

/** @var string $composerHome */
$composerHome = $_SERVER['COMPOSER_HOME'];
require $composerHome . '/vendor/autoload.php';

(new ParallelProcessesApplication())
    ->addProcess(new Process([$projectPath . '/bin/ci/composer-normalize']))
    ->addProcess(new Process([$projectPath . '/bin/ci/composer-require-checker']))
    ->addProcess(new Process([$projectPath . '/bin/ci/composer-validate']))
    ->addProcess(new Process([$projectPath . '/bin/ci/phpcs']))
    ->addProcess(new Process([$projectPath . '/bin/ci/phpdd']))
    ->addProcess(new Process([$projectPath . '/bin/ci/phpstan']))
    ->addProcess(new Process([$projectPath . '/bin/ci/shellcheck']))
    ->addProcess(new Process([$projectPath . '/bin/ci/unused-scanner']))
    ->run(new ArgvInput($argv));
