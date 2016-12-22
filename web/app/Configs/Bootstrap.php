<?php
require __DIR__ . "/../../vendor/autoload.php";

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\DBAL\Query\QueryBuilder;
use App\Classes\Configs\Config;
use App\System\Model;

Request::enableHttpMethodParameterOverride();

//Seta a Static de Config
$jsonFile = __DIR__ . "/Config.json";
$jsonContent = file_get_contents($jsonFile);
Config::$config = (object) json_decode($jsonContent);

$app = new Application();
$app['debug'] = Config::$config->env->debugmode;

/**
 * [$error Vai customizar a devolução de erros das Exceptions em formato JSON]
 */
$app->error(function (\Exception $e, Request $request, $code) use ($app) {
    $error = array("msg" => $e->getMessage(), 'status' => $code);
    return $app->json($error, $code);
});


//Configura o Twig. Mover isso para o config.json
$app->register(new Silex\Provider\TwigServiceProvider(), array(
  "twig.path" => __DIR__ . "../../src/Views",
  "twig.form.templates"=>array('form_div_layout.html.twig',"form/form_div_layout.twig"),
  'twig.options' => array('cache' => '../../tmp/twig', 'strict_variables' => false)
  )
);

/**
 * Configurações do Banco de Dados
 */
$app->register(new Silex\Provider\DoctrineServiceProvider(), array(
    'db.options' => array(
      'driver'    => Config::$config->db->driver,
      'host'      => Config::$config->db->host,
      'dbname'    => Config::$config->db->schema,
      'user'      => Config::$config->db->user,
      'password'  => Config::$config->db->password,
      'charset'  => Config::$config->db->charset
    ),
));

//Instancia um QueryBuilder genérico. Será utilizado na classe Model
Model::$db = $app['db'];
Model::$query = new QueryBuilder($app['db']);

require __DIR__ . "/Routes.php";
return $app;
