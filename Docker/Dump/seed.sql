-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "cursos" --------------------------
CREATE DATABASE IF NOT EXISTS `cursos` CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cursos`;
-- ---------------------------------------------------------


-- CREATE TABLE "categorias" -------------------------------
CREATE TABLE IF NOT EXISTS `categorias` (
	`id_categoria` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`descricao` Text NOT NULL,
	`url_img` Text NOT NULL,
	`url_header` Text NULL,
	`slug` VarChar( 100 ) NOT NULL,
	`cor_hex` VarChar( 20 ) NOT NULL COMMENT 'Cor tema da categoria',
	`id_usuario` Int( 11 ) NOT NULL,
	`created` DateTime NULL,
	`modified` DateTime NULL,
	PRIMARY KEY ( `id_categoria` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 15;
-- ---------------------------------------------------------


-- CREATE TABLE "contatos" ---------------------------------
CREATE TABLE IF NOT EXISTS `contatos` (
	`id_mensagem` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`nome` VarChar( 60 ) NOT NULL,
	`email` VarChar( 60 ) NULL,
	`telefone` VarChar( 45 ) NULL,
	`website` VarChar( 45 ) NULL,
	`mensagem` Text NOT NULL,
	PRIMARY KEY ( `id_mensagem` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 73;
-- ---------------------------------------------------------


-- CREATE TABLE "cursos" -----------------------------------
CREATE TABLE IF NOT EXISTS `cursos` (
	`id_curso` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`nome_curso` VarChar( 60 ) NOT NULL,
	`descricao` Text NOT NULL,
	`url_curso` Text NOT NULL,
	`url_img` Text NULL,
	`url_header_img` Text NULL,
	`autor` VarChar( 60 ) NULL,
	`slug` VarChar( 100 ) NOT NULL,
	`id_categoria` Int( 11 ) NOT NULL,
	`id_modo_aprendizado` Int( 11 ) NOT NULL,
	`id_usuario` Int( 11 ) NOT NULL,
	`possui_cert` TinyInt( 4 ) NOT NULL DEFAULT '0' COMMENT '1 -- SIM
0 -- NAO',
	`requer_cadastro` TinyInt( 4 ) NOT NULL DEFAULT '0' COMMENT '1 -- SIM
0 -- NÃO',
	`created` DateTime NULL,
	`modified` DateTime NULL,
	PRIMARY KEY ( `id_curso` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 14;
-- ---------------------------------------------------------


-- CREATE TABLE "cursos_has_tags" --------------------------
CREATE TABLE IF NOT EXISTS `cursos_has_tags` (
	`cursos_id_curso` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`tags_id_tag` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `cursos_id_curso`, `tags_id_tag` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "modos" ------------------------------------
CREATE TABLE IF NOT EXISTS `modos` (
	`id_modo_aprendizado` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`descricao` VarChar( 45 ) NOT NULL,
	`slug` VarChar( 100 ) NOT NULL,
	`created` DateTime NULL,
	`modified` DateTime NULL,
	PRIMARY KEY ( `id_modo_aprendizado` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- CREATE TABLE "sugestoes" --------------------------------
CREATE TABLE IF NOT EXISTS `sugestoes` (
	`id_sugestao` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`nome` VarChar( 45 ) NOT NULL,
	`descricao` Text NOT NULL,
	`url_curso` Text NOT NULL,
	`autor` VarChar( 60 ) NULL,
	`id_categoria` Int( 11 ) NULL,
	`id_modo_aprendizado` Int( 11 ) NOT NULL,
	`categoria_outro` VarChar( 100 ) NULL,
	`possui_cert` TinyInt( 4 ) NOT NULL,
	`requer_cadastro` TinyInt( 4 ) NOT NULL,
	`created` DateTime NULL,
	`modified` DateTime NULL,
	PRIMARY KEY ( `id_sugestao` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "tags" -------------------------------------
CREATE TABLE IF NOT EXISTS `tags` (
	`id_tag` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`slug` Text NULL,
	PRIMARY KEY ( `id_tag` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "users" ------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
	`id_usuario` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`nome` VarChar( 45 ) NOT NULL,
	`username` VarChar( 45 ) NOT NULL,
	`email` VarChar( 45 ) NOT NULL,
	`password` VarChar( 100 ) NOT NULL,
	`id_funcao` Int( 11 ) NULL,
	`created` DateTime NULL,
	`modified` DateTime NULL,
	PRIMARY KEY ( `id_usuario` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ---------------------------------------------------------


-- Dump data of "categorias" -------------------------------
DELETE FROM  `categorias`;
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '1', 'NodeJS', 'https://www.echosteg.com/images/blog/standard/nodejs_logo.png', 'http://softwareengineeringdaily.com/wp-content/uploads/2015/08/nodejs_logo_green.jpg', 'nodejs', '#92c431', '1', '2016-09-03 03:39:45', '2016-12-18 21:07:55' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '2', 'AngularJS', 'https://www.mxcursos.com/blog/wp-content/uploads/2016/06/AngularJS.png', NULL, 'angularjs', '#8c2e27', '1', '2016-09-04 23:18:31', '2016-09-04 23:18:57' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '3', 'Python', 'http://orig12.deviantart.net/6902/f/2015/044/2/5/numa_flat_python_wallpaper_by_charlie_henson-d8htz7i.png', NULL, 'python', '#c0411b', '1', '2016-11-06 02:14:26', '2016-11-06 02:15:17' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '4', 'PHP', 'https://upload.wikimedia.org/wikipedia/commons/c/c1/PHP_Logo.png', NULL, 'php', '#3a5489', '1', '2016-11-06 02:17:16', '2016-11-06 02:17:50' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '5', 'Javascript', 'https://www.bram.us/wordpress/wp-content/uploads/2016/06/javascript-logo-banner.jpg', NULL, 'javascript', '#c8ad1b', '1', '2016-11-06 02:18:35', '2016-11-06 02:18:56' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '6', 'Phonegap Cordova', 'http://brightflock.com/sites/default/files/phongap_blog.png', NULL, 'phonegap-cordova', '#293541', '1', '2016-11-06 02:20:48', '2016-11-06 02:21:34' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '7', 'Ionic Framework', 'http://tableless.com.br/wp-content/uploads/2015/02/ionic-logo-tableless.gif', NULL, 'ionic-framework', '#154db1', '1', '2016-11-06 02:22:45', '2016-11-06 02:22:59' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '8', 'Android', 'https://timedotcom.files.wordpress.com/2016/01/biztech-illos-android2.jpg?quality=85&w=1100', NULL, 'android', '#0d572b', '1', '2016-11-06 02:25:10', '2016-11-06 02:25:23' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '9', 'Java', 'http://static.wixstatic.com/media/0b2492_05f8575675664df0a2e27df32018c621~mv2.jpg', NULL, 'java', '#e4281e', '1', '2016-11-06 02:26:15', '2016-11-06 02:26:25' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '10', 'HTML5 CSS3', 'https://encontros.matehackers.org/uploads/project/logo/44/html5-css3.png', NULL, 'html5-css3', '#005aae', '1', '2016-11-06 02:28:36', '2016-11-06 02:29:55' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '11', 'C++', 'http://pcoutinho.com/wp-content/uploads/2014/09/cpp-logo.png', NULL, 'cplusplus', '#4575b0', '1', '2016-11-06 02:31:53', '2016-11-06 02:32:14' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '12', 'Linux ', 'https://d13yacurqjgara.cloudfront.net/users/595800/screenshots/1702094/linux_1x.png', NULL, 'linux', '#ca7934', '1', '2016-11-06 02:33:18', '2016-11-06 02:33:31' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '13', 'Golang', 'https://golang.org/doc/gopher/appenginegophercolor.jpg', NULL, 'golang', '#6ad7e5', '1', '2016-11-07 15:20:32', '2016-11-07 15:20:32' );
INSERT INTO `categorias`(`id_categoria`,`descricao`,`url_img`,`url_header`,`slug`,`cor_hex`,`id_usuario`,`created`,`modified`) VALUES ( '14', 'MongoDB', 'http://www.circulo.ceplan.udesc.br/circulo/wp-content/uploads/2016/09/0001494_search-engine-powered-by-mongodb.jpeg', NULL, 'mongodb', '#75a156', '1', '2016-11-07 15:24:07', '2016-11-07 15:24:07' );
-- ---------------------------------------------------------


-- Dump data of "cursos" -----------------------------------
DELETE FROM `cursos`;
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '1', 'Curso de NodeJS', 'O curso completo de Node JS possui 28 video aulas, no curso você irá aprender a usar o Node JS em aplicações web substituindo o uso do php e trazendo mais dinamica para suas aplicações.
Mais em: http://hugocursos.com.br/nodejs.php ', 'https://www.youtube.com/playlist?list=PLxNM4ef1Bpxgxa-Bgt9leCE1euHC14WI9', '', '', 'Hugo Vasconcelos', 'curso-de-nodejs', '1', '1', '1', '0', '0', '2016-11-06 02:00:05', '2016-12-18 21:34:07' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '2', 'Node.js', 'Vamos mostrar por meio de diversos exemplos como o Node.js funciona e quais são os aspectos importantes em termos de escalabilidade e performance.', 'https://www.youtube.com/playlist?list=PLQCmSnNFVYnTFo60Bt972f8HA4Td7WKwq', 'https://www.visualstudio.com/wp-content/uploads/2016/06/Nodejs-2-562x309@2x-op.png', NULL, 'Rodrigo Branas', 'nodejs', '1', '1', '1', '0', '0', '2016-11-06 02:04:31', '2016-11-06 02:04:31' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '3', 'Curso de Node.js', 'Curso básico de NodeJS via Youtube', 'https://www.youtube.com/watch?v=TAZaYjk7klo&list=PLy-SYgu4iQ-FeUsSv0cWsKFdNjoa-MnsR', 'http://s.profissionaisti.com.br/wp-content/uploads/2012/08/nodejs.png', NULL, 'tp developer', 'curso-de-nodejs', '1', '1', '1', '0', '0', '2016-11-06 02:07:24', '2016-11-06 02:07:24' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '4', 'Curso de POO PHP (Programação Orientada a Objetos)', 'Curso completo de Programação Orientada a Objetos (POO) com a linguagem PHP. Aborda os principais conceitos como Classes, Objetos, instanciamento, abstração, encapsulamento, herança, polimorfismo e muito mais. Criado pelo professor Gustavo Guanabara para o Curso em Vídeo, explica todos os conceitos de POO de uma maneira simples, objetiva e divertida.', 'https://www.youtube.com/playlist?list=PLHz_AreHm4dmGuLII3tsvryMMD7VgcT7x', 'http://www.cursoemvideo.com/wp-content/uploads/2014/08/curso-gratis-php.jpg', NULL, 'Gustavo Guanabara (Curso em Video)', 'curso-de-poo-php-programao-orientada-a-objetos', '4', '1', '1', '0', '0', '2016-11-07 15:11:40', '2016-11-07 15:11:40' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '5', 'Curso de PHP para Iniciantes', 'No Curso Grátis de PHP para Iniciantes, você vai aprender os primeiros passos para criar sites que utilizem a tecnologia PHP incorporada. Para isso, aprenderá como instalar um servidor, criar scripts básicos, interatividade com formulários e acesso a bancos de dados simples. No final, vai aprender como colocar seu site no ar utilizando um servidor profissional de hospedagem. Acompanhe as aulas semanalmente pelo site http://cursoemvideo.com/course/curso-php-iniciante/', 'http://www.cursoemvideo.com/course/curso-php-iniciante/', 'http://www.cursoemvideo.com/wp-content/uploads/2014/08/curso-gratis-php.jpg', NULL, 'Gustavo Guanabara (Curso em Video)', 'curso-de-php-para-iniciantes', '4', '1', '1', '1', '1', '2016-11-07 15:13:38', '2016-11-07 15:13:38' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '6', 'Be MEAN: Angular1', 'Curso de AngularJS feito pela Webschool.io', 'https://www.youtube.com/playlist?list=PL77JVjKTJT2hfviaP9JV_ZyJWSD4je7Df', 'https://yellowpencil.com/assets/blog/banners/banner-angularjs.jpg', NULL, 'Webschool.io', 'be-mean-angular1', '2', '1', '1', '0', '0', '2016-11-07 15:16:50', '2016-11-07 15:16:50' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '7', 'Be MEAN: Node.js', 'Curso de NodeJS, sobre MEAN Fullstack ministrado pela Webschool.io', 'https://www.youtube.com/playlist?list=PL77JVjKTJT2hP_lxL88oDo2rJvOskpGfJ', 'http://www.tutsowl.com/img/nodejs_square.png', NULL, 'Webschool.io', 'be-mean-nodejs', '1', '1', '1', '0', '0', '2016-11-07 15:18:45', '2016-11-07 15:18:45' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '9', 'Curso de Go/Golang', 'Curso de Go', 'https://www.youtube.com/playlist?list=PLXFk6ROPeWoAvLMyJ_PPfu8oF0-N_NgEI', 'https://golang.org/doc/gopher/appenginegophercolor.jpg', NULL, 'Eu Programador', 'curso-de-gogolang', '13', '1', '1', '0', '0', '2016-11-07 15:21:56', '2016-11-07 15:21:56' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '10', 'Be MEAN: MongoDB', 'Curso de MongoDB, parte do treinamento MEAN Full Stack ', 'https://www.youtube.com/playlist?list=PL77JVjKTJT2gXHb9FEokJsPEcoOmyF1pY', 'http://www.circulo.ceplan.udesc.br/circulo/wp-content/uploads/2016/09/0001494_search-engine-powered-by-mongodb.jpeg', NULL, 'Webschool.io', 'be-mean-mongodb', '14', '1', '1', '0', '0', '2016-11-07 15:25:06', '2016-11-07 15:26:51' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '11', 'Aulas Python - Ignorância Zero', 'Aulas de Python do Canal Ignorância Zero, do básico ao avançado. ', 'https://www.youtube.com/watch?v=lJjR906426o&list=PLfCKf0-awunOu2WyLe2pSD2fXUo795xRe', '', NULL, 'Ignorância Zero', 'aulas-python-ignorncia-zero', '3', '1', '1', '0', '0', '2016-12-09 13:48:11', '2016-12-09 13:48:11' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '12', 'OOPHP 7 2016', 'Playlist de PHP7', 'https://www.youtube.com/playlist?list=PL_OD25EBevLMGlWW133tfQf-P9nNIomxn', 'https://kinsta.com/wp-content/uploads/2016/11/php-7.1.0.png', NULL, 'Desenvolvedor PHP', 'oophp-7-2016', '4', '1', '1', '0', '0', '2016-12-13 11:23:07', '2016-12-13 11:23:07' );
INSERT INTO `cursos`(`id_curso`,`nome_curso`,`descricao`,`url_curso`,`url_img`,`url_header_img`,`autor`,`slug`,`id_categoria`,`id_modo_aprendizado`,`id_usuario`,`possui_cert`,`requer_cadastro`,`created`,`modified`) VALUES ( '13', 'Curso Loja Virtual Completo', 'Playlist de criação de Loja Virtual com PHP ', 'https://www.youtube.com/playlist?list=PL_OD25EBevLP2-1XT6fzHCJM7XV1bsMcW', 'http://phpenthusiast.com/theme/assets/images/homepage/phpenthusiast_bg.jpg', NULL, 'Desenvolvedor PHP', 'curso-loja-virtual-completo', '4', '1', '1', '0', '0', '2016-12-13 11:24:17', '2016-12-13 11:24:17' );
-- ---------------------------------------------------------

-- Dump data of "modos" ------------------------------------
DELETE FROM `modos`;
INSERT INTO `modos`(`id_modo_aprendizado`,`descricao`,`slug`,`created`,`modified`) VALUES ( '1', 'Video', 'video', '2016-11-06 01:57:58', '2016-11-06 01:57:58' );

-- Dump data of "users" ------------------------------------
INSERT INTO `users`(`id_usuario`,`nome`,`username`,`email`,`password`,`id_funcao`,`created`,`modified`) VALUES ( '1', 'Admin', 'admin', 'teste@teste.com', '46e0b4dd01755bc6873317f29ea731bac9eijhk34hk3909b774a4f786287498576f41917f', NULL, NULL, '2016-11-06 01:53:49' );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_cursos_categorias1_idx" ----------------
CREATE INDEX `fk_cursos_categorias1_idx` USING BTREE ON `cursos`( `id_categoria` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_cursos_modos1_idx" ---------------------
CREATE INDEX `fk_cursos_modos1_idx` USING BTREE ON `cursos`( `id_modo_aprendizado` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_cursos_has_tags_cursos1_idx" -----------
CREATE INDEX `fk_cursos_has_tags_cursos1_idx` USING BTREE ON `cursos_has_tags`( `cursos_id_curso` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_cursos_has_tags_tags1_idx" -------------
CREATE INDEX `fk_cursos_has_tags_tags1_idx` USING BTREE ON `cursos_has_tags`( `tags_id_tag` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_sugestoes_categorias1_idx" -------------
CREATE INDEX `fk_sugestoes_categorias1_idx` USING BTREE ON `sugestoes`( `id_categoria` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_sugestoes_modos1_idx" ------------------
CREATE INDEX `fk_sugestoes_modos1_idx` USING BTREE ON `sugestoes`( `id_modo_aprendizado` );
-- ---------------------------------------------------------


-- CREATE LINK "fk_cursos_categorias1" ---------------------
ALTER TABLE `cursos`
	ADD CONSTRAINT `fk_cursos_categorias1` FOREIGN KEY ( `id_categoria` )
	REFERENCES `categorias`( `id_categoria` )
	ON DELETE No Action
	ON UPDATE No Action;
-- ---------------------------------------------------------


-- CREATE LINK "fk_cursos_modos1" --------------------------
ALTER TABLE `cursos`
	ADD CONSTRAINT `fk_cursos_modos1` FOREIGN KEY ( `id_modo_aprendizado` )
	REFERENCES `modos`( `id_modo_aprendizado` )
	ON DELETE No Action
	ON UPDATE No Action;
-- ---------------------------------------------------------


-- CREATE LINK "fk_cursos_has_tags_cursos1" ----------------
ALTER TABLE `cursos_has_tags`
	ADD CONSTRAINT `fk_cursos_has_tags_cursos1` FOREIGN KEY ( `cursos_id_curso` )
	REFERENCES `cursos`( `id_curso` )
	ON DELETE No Action
	ON UPDATE No Action;
-- ---------------------------------------------------------


-- CREATE LINK "fk_cursos_has_tags_tags1" ------------------
ALTER TABLE `cursos_has_tags`
	ADD CONSTRAINT `fk_cursos_has_tags_tags1` FOREIGN KEY ( `tags_id_tag` )
	REFERENCES `tags`( `id_tag` )
	ON DELETE No Action
	ON UPDATE No Action;
-- ---------------------------------------------------------


-- CREATE LINK "fk_sugestoes_categorias1" ------------------
ALTER TABLE `sugestoes`
	ADD CONSTRAINT `fk_sugestoes_categorias1` FOREIGN KEY ( `id_categoria` )
	REFERENCES `categorias`( `id_categoria` )
	ON DELETE No Action
	ON UPDATE No Action;
-- ---------------------------------------------------------


-- CREATE LINK "fk_sugestoes_modos1" -----------------------
ALTER TABLE `sugestoes`
	ADD CONSTRAINT `fk_sugestoes_modos1` FOREIGN KEY ( `id_modo_aprendizado` )
	REFERENCES `modos`( `id_modo_aprendizado` )
	ON DELETE No Action
	ON UPDATE No Action;
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------
