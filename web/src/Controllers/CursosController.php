<?php
namespace App\Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;
use Silex\ControllerCollection;

use App\Models\CursosModel;

/**
 * Classe controladora dos Cursos da API
 */
class CursosController implements ControllerProviderInterface {

	public function connect(Application $app) {
		$index = $app['controllers_factory'];

		/**
		 * Verifica se o controller está funcionando
		 */
		$index->get('/', function() use ($app) {
			return $app->json(['status' =>
			'funcionando']);
		});

		/**
		 * [$num Numero de registros que vão ser retornados da API]
		 * @var [type]
		 */
		$index->get("/getcursos/{num}", function ($num) use ($app) {
			$cursos = (new CursosModel())->getCursos($num);
			return $app->json($cursos);
		})->value('num', null);

		/**
		 * [$curso description]
		 * @var [type]
		 */
		$index->get("/getcursobyid/{id}", function ($id) use ($app) {
			$curso = (new CursosModel())->getCursoByID($id);
			return $app->json($curso);
		});

		return $index;
	}
}
