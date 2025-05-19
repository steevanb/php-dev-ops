<?php

namespace Steevanb\DevOps\EventListener;

use Symfony\Component\Console\{
    Application,
    ConsoleEvents,
    Event\ConsoleCommandEvent
};
use Steevanb\DevOps\Command\ShowCommandInListInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class CommandsWhiteListListener implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [ConsoleEvents::COMMAND => 'onConsoleCommand'];
    }

    public function onConsoleCommand(ConsoleCommandEvent $event): void
    {
        $application = $event->getCommand()?->getApplication();
        if ($application instanceof Application === false) {
            throw new \Exception('Application not found.');
        }

        foreach ($application->all() as $command) {
            $command->setHidden($command instanceof ShowCommandInListInterface === false);
        }
    }
}
