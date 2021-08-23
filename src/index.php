<?php declare(strict_types=1);

require __DIR__ . '/vendor/autoload.php';

return function ($event) {
    // var_dump($event);

    return \json_encode([
        'message' => 'Hello ' . ($event['name'] ?? 'world'),
    ]);
};
