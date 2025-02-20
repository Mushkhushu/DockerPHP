<?php
require 'vendor/autoload.php';

$app = \Slim\Factory\AppFactory::create();

// Définir une route de base pour tester
$app->get('/', function ($request, $response, $args) {
    $response->getBody()->write("Hello, Slim Framework!");
    return $response;
});

$app->run();
