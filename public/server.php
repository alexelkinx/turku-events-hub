<?php

require_once __DIR__ . '/../backend/vendor/autoload.php';
require_once __DIR__ . '/../backend/config/config.php';

use Server\http\{Request, ErrorResponse};
use Server\Repos\{MovieRepo, EventRepo, TheatreRepo, ConcertRepo, SportRepo, UserRepo};
use Server\Actions\{FindMovies, FindAllEvents, FindConcertById, FindTheatres, FindConcerts, FindSports, FindMovieById, FindTheatreById, FindSportById, FindTopEvents, FindUser, LogIn, LogOut, RegistrateNewUser};

$request = new Request($_GET, $_SERVER, file_get_contents('php://input'));

try {
    $path = $request->path();
} catch (\Exception $e) {
    (new ErrorResponse($e->getMessage()))->send();
    return;
}

try {
    $method = $request->method();
} catch (\Exception $e) {
    (new ErrorResponse($e->getMessage()))->send();
    return;
}

try {
    $pdo = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8', DB_USER, DB_PASS);
} catch (\PDOException $e) {
    throw new RuntimeException('Failed to connect to database: ' . $e->getMessage());
}

// Define the available routes and corresponding actions
$routes = [
    'GET' => [
        '/account' => new FindUser(new UserRepo($pdo)),
        '/logout' => new LogOut(),
        '/top' => new FindTopEvents(new EventRepo($pdo)),
        '/all' => new FindAllEvents(new EventRepo($pdo)),
        '/movies' => new FindMovies(new MovieRepo($pdo)),
        '/movie' => new FindMovieById(new MovieRepo($pdo)),
        '/theatres' => new FindTheatres(new TheatreRepo($pdo)),
        '/theatre' => new FindTheatreById(new TheatreRepo($pdo)),
        '/concerts' => new FindConcerts(new ConcertRepo($pdo)),
        '/concert' => new FindConcertById(new ConcertRepo($pdo)),
        '/sports' => new FindSports(new SportRepo($pdo)),
        '/sport' => new FindSportById(new SportRepo($pdo)),
    ],
    'POST' => [
        '/registration' => new RegistrateNewUser(new UserRepo($pdo)),
        '/login' => new LogIn(new UserRepo($pdo)),
    ]
];

// Check if the requested path is valid
if (!array_key_exists($path, $routes[$method])) {
    (new ErrorResponse('Not found'))->send();
    return;
}

// Check if the requested method exists
if (!array_key_exists($method, $routes)) {
    (new ErrorResponse('Not found'))->send();
    return;
}

// Get the action associated with the requested route
$action = $routes[$method][$path];

try {
    // Handle the request using the action
    $response = $action->handle($request);
} catch (\Exception $e) {
    (new ErrorResponse($e->getMessage()))->send();
}

$response->send();
