<?php

namespace App\Models;

use App\System\Model;

/**
 * Model da tabela Cursos
 * @email msfidelis01@gmail.com
 * @author Matheus Fidelis
 */
class CursosModel extends Model {

  private $table = 'cursos';

  /**
   * Retorna todos os cursos da tabela
   * @param  [type] $quantidade [description]
   * @return [type]             [description]
   */
  public function getCursos($quantidade = null) {
    $query = $this->newQuery();
    $query->select(['cu.id_curso', 'cu.nome_curso',
      'cu.url_curso', 'cu.id_categoria', 'ca.descricao AS nome_categoria'])
        ->from($this->table, 'cu')
        ->innerJoin('cu','categorias','ca','ca.id_categoria = cu.id_categoria');

    if ($quantidade) {
      $query->setMaxResults((int) $quantidade);
    }

    return $this->execute($query);
  }

  /**
   * [getCursoByID description]
   * @param  [type] $id [description]
   * @return [type]     [description]
   */
  public function getCursoByID($id) {
    $query = $this->newQuery();
    $query->select(['id_curso', 'nome_curso', 'url_curso'])
      ->from($this->table)
      ->where("id_curso = {$id}")
      ->setMaxResults(1);

    $result = $this->execute($query);
    if (!$result) {
      throw new \Exception("Nenhum curso encontrado", 1);
    } else {
      return $result[0];
    }
  }

  /**
   * [getCursoByNome description]
   * @return [type] [description]
   */
  public function getCursoByNome() {

  }

  /**
   * [getCursoBySlug description]
   * @return [type] [description]
   */
  public function getCursoBySlug() {

  }
}
