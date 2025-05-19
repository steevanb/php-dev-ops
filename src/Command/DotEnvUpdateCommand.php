<?php

declare(strict_types=1);

namespace Steevanb\DevOps\Command;

use Symfony\Component\Console\Command\Command;

class DotEnvUpdateCommand extends Command implements ShowCommandInListInterface
{
    public static function getDefaultName(): ?string
    {
        return 'dot-env:update';
    }

    public function getDescription(): string
    {
        return 'Update .env files from .env.dist';
    }
}
