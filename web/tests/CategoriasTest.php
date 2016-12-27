<?php
namespace App\Tests;

use Silex\WebTestCase;

class CategoriasTest extends WebTestcase {

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

  public function deveNegarOTokenErrado() {
  }

  public function deveValidarOTokenERetornar200() {
  }

  public function deveNegarTokenVazio() {
  }

  /**
   * [Verifica se a rota está funcionando]
   * @return [type] [description]
   */
  public function testDeveVerificarSeAAPIDeCategoriasEstaOnline() {
    $client = $this->createClient();
    $client->request('GET', '/categorias/');
    $this->assertTrue($client->getResponse()->isOk());
    $response = json_decode($client->getResponse()->getContent());
    $this->assertEquals('funcionando', $response->status);
  }

  public function deveRetornarTodasAsInformacoesDaCategoria() {
  }

  public function deveRetornar5RegistrosDeCategoria() {
  }

  public function deveRetornar10RegistrosDeCategoria() {
  }

  public function deveRetornarApenasUmRegistroDaCategoria() {
  }

  public function deveRetornarORegistroViaIDInformadoPeloID() {
  }

  public function deveInserirUmaCategoriaERetornaroIDDaMesma() {
  }

  public function deveRetornarExceptionPorTentarBuscarIDVazio() {
  }

  public function deveDeletarACategoriaInformadaPeloID() {
  }

  public function deveNegarODeleteDaCategoriaCasoNaoTenhaIDInformado() {
  }

}
