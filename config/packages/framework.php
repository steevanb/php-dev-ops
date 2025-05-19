<?php

declare(strict_types=1);

use Symfony\Config\{
    Framework\SessionConfig,
    FrameworkConfig
};

return static function (FrameworkConfig $config): void {
    /** @var SessionConfig $session */
    $session = $config->session();
    $session->enabled(false);
};
