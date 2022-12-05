/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `mercadinho` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `mercadinho`;

CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`idcategoria`, `nomeCategoria`) VALUES
	(1, 'Hortifruti'),
	(2, 'Higiene Pessoal'),
	(3, 'Açougue'),
	(4, 'Padaria'),
	(5, 'Limpeza'),
	(6, 'Eletronicos'),
	(7, 'Bebidas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `cliente` (
  `idclientes` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(45) NOT NULL,
  `cpfCliente` varchar(45) NOT NULL,
  PRIMARY KEY (`idclientes`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idclientes`, `nomeCliente`, `cpfCliente`) VALUES
	(1, 'Celso Werner', '03656359954'),
	(2, 'Joao Silva', '1234567999'),
	(3, 'Ana Silveira', '22233344456');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `funcionario` (
  `idFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `matriculaFuncionario` varchar(45) NOT NULL,
  `nomeFuncionario` varchar(45) NOT NULL,
  `senhaFuncionario` varchar(45) NOT NULL,
  `tipoFuncionario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`idFuncionario`, `matriculaFuncionario`, `nomeFuncionario`, `senhaFuncionario`, `tipoFuncionario`) VALUES
	(1, '2', 'Joao Pedrao', '12345', '2'),
	(2, '1', 'admin', 'admin', '1'),
	(3, '3', 'celso', '12345', '1');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nomeMarca` varchar(45) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`idMarca`, `nomeMarca`) VALUES
	(1, 'Coca Cola'),
	(2, 'Omo '),
	(3, 'Lenovo'),
	(4, 'Samsung'),
	(5, 'Lg'),
	(6, 'Alambique');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nomeProduto` varchar(45) NOT NULL,
  `valorProduto` float NOT NULL,
  `idMarca` int(2) DEFAULT NULL,
  `idCategoria` int(2) DEFAULT NULL,
  `quantidadeProduto` int(4) NOT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `idProdutos_UNIQUE` (`idProduto`),
  KEY `idMarca_idx` (`idMarca`),
  KEY `idCategoria_idx` (`idCategoria`),
  CONSTRAINT `idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `idMarca` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`idProduto`, `nomeProduto`, `valorProduto`, `idMarca`, `idCategoria`, `quantidadeProduto`) VALUES
	(1, 'Omo MultiAção', 50, 2, 5, 10),
	(2, 'Televisor 50 pol.', 2500, 5, 6, 0),
	(3, 'Coca Cola 2 L', 7, 1, 7, 0),
	(4, 'Sprite', 5, 1, 7, 0),
	(5, 'Alcool Gel', 11, 6, 5, 0);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
