<?php
namespace App\Tests;

use Silex\WebTestCase;

class CursosTest extends WebTestcase {

  /**
   * [$id_ultimo_curso ID Utilizado para testar o Ultimo Curso]
   * @var [type]
   */
  private $id_ultimo_curso;

  /**
   * [getIDUltimoCurso Getter]
   * @return [type] [description]
   */
  public function getIDUltimoCurso() {
    return $this->id_ultimo_curso;
  }

  /**
   * [setIDUltimoCurso Setter]
   */
  public function setIDUltimoCurso($id_ultimo_curso) {
    $this->id_ultimo_curso = $id_ultimo_curso;
  }

  /**
  * [setUp description]
  */
  public function setUp() {
    parent::setUp();
  }

  /**
  * [createApplication description]
  * @return [type] [description]
  */
  public function createApplication() {
    $app = require __DIR__ . '/../app/Configs/Bootstrap.php';
    return $app;
  }

  /**
   * [Verifica se a rota está funcionando]
   * @return [type] [description]
   */
  public function testDeveVerificarSeAAPIDeCursosEstaOnline() {
    $client = $this->createClient();
    $client->request('GET', '/cursos/');
    $this->assertTrue($client->getResponse()->isOk());
    $response = json_decode($client->getResponse()->getContent());
    $this->assertEquals('funcionando', $response->status);
  }

  public function deveNegarOTokenErrado() {
  }

  public function deveValidarOTokenERetornar200() {
  }

  public function deveNegarTokenVazio() {
  }

  public function testDeveRetornarTodosOsRegistros() {
    $client = $this->createClient();
    $client->request('GET', "/cursos/getcursos");
    $response = json_decode($client->getResponse()->getContent());
    $this->assertTrue($client->getResponse()->isOk());
    $this->assertTrue(count($response) > 10);
  }

  public function testDeveRetornar5Registros() {
    $client = $this->createClient();
    $client->request('GET', "/cursos/getcursos/5");
    $response = json_decode($client->getResponse()->getContent());
    $this->assertTrue($client->getResponse()->isOk());
    $this->assertTrue(count($response) == 5);
  }

  public function testDeveRetornar10Registros() {
    $client = $this->createClient();
    $client->request('GET', "/cursos/getcursos/10");
    $response = json_decode($client->getResponse()->getContent());
    $this->assertTrue($client->getResponse()->isOk());
    $this->assertTrue(count($response) == 10);
  }

  public function testDeveRetornarApenasUmRegistro() {
    $client = $this->createClient();
    $client->request('GET', "/cursos/getcursos/1");
    $response = json_decode($client->getResponse()->getContent());
    $this->assertTrue($client->getResponse()->isOk());
    $this->assertTrue(count($response) == 1);
  }

  public function testDeveRetornarORegistroViaID() {
    $client = $this->createClient();
    $client->request('GET', "/cursos/getcursobyid/10");
    $response = json_decode($client->getResponse()->getContent());
    $this->assertTrue($client->getResponse()->isOk());
    $this->assertEquals(10, $response->id_curso);
    $this->assertEquals("Be MEAN: MongoDB", $response->nome_curso);
    $this->assertEquals("https://www.youtube.com/playlist?list=PL77JVjKTJT2gXHb9FEokJsPEcoOmyF1pY", $response->url_curso);
  }

  public function testRetornarUmaExceptionCasoNaoInformemOIDDoGetCursoByID() {
    $client = $this->createClient();
    $client->request('GET', "/cursos/getcursobyid");
    $this->assertFalse($client->getResponse()->isOk());
    $response = json_decode($client->getResponse()->getContent());
    $this->assertEquals(500, $response->status);
    $this->assertEquals("ID do curso não informada", $response->msg);
  }

  public function deveInserirUmRegistroERetornarAIDDoMesmo() {
    $postArray = array(
      'id_categoria' => 3,
      'descricao' => 'Descanse em paz Carry Fisher',
      'url_curso' => 'http://manodoceu.com.br'
    );

    $client = $this->createClient();
    $client->request('POST', "/cursos/setcurso", $postArray);
    $response = json_decode($client->getResponse()->getContent());
    var_dump($response); die();
  }


  public function deveDeletarORegistroCriado() {
  }

  public function devePegarOSkelDoBulkInsertDaAPI() {
  }

  public function deveSetar10RegistrosViaBulkInsertNaApi() {
  }

}
