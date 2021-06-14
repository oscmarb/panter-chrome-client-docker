<?php

require __DIR__ . '/vendor/autoload.php';

$url = getopt('a:')['a'];

$client = Symfony\Component\Panther\Client::createChromeClient(null, [
    '--headless',
    '--disable-dev-shm-usage',
    '--no-sandbox',
]);

var_dump($client->get($url));
