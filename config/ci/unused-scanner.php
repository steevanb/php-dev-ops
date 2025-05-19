<?php

declare(strict_types=1);

$projectPath = __DIR__ . '/../..';

return [
    'composerJsonPath' => $projectPath . '/composer.json',
    'vendorPath' => $projectPath . '/vendor',
    'scanDirectories' => [
        $projectPath . '/bin',
        $projectPath . '/config',
        $projectPath . '/src'
    ],
    'skipPackages' => [
        'symfony/runtime',
        'symfony/flex',
        'symfony/dotenv'
    ],
    'requireDev' => false
];
