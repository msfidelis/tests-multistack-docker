<?php
$app->mount("/", new App\Controllers\IndexController());
$app->mount("/api",new App\Controllers\ApiController());
$app->mount("/cursos",new App\Controllers\CursosController());
