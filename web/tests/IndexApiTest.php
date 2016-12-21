<?php

namespace App\Tests;

use Silex\WebTestCase;

/**
 * Testes do Index da API
 */
class IndexApiTest extends WebTestCase {

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
     * Testa se a API está online
     * @return [type] [description]
     */
    public function testApiOnline() {
        $client = $this->createClient();
        $client->request('GET', '/');
        $response = json_decode($client->getResponse()->getContent());
        $this->assertTrue($client->getResponse()->isOk());
        $this->assertEquals('funcionando', $response->status);
    }

}
