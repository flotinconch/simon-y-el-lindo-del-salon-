-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2022 a las 22:53:03
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_ejem`
--
CREATE DATABASE IF NOT EXISTS `db_ejem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_ejem`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `spConsultUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultUser` (IN `_code` INT(5))  BEGIN

SELECT code,name,lastName,password FROM `user` WHERE code = _code;


END$$

DROP PROCEDURE IF EXISTS `spDeleteUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteUser` (IN `_code` INT(5))  BEGIN

DELETE FROM `user` WHERE CODE = _code;

END$$

DROP PROCEDURE IF EXISTS `spInsertUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertUser` (IN `_name` VARCHAR(25), IN `_lastName` VARCHAR(25), IN `_user` VARCHAR(25), IN `_password` VARCHAR(25))  BEGIN

INSERT INTO user(NAME, LASTNAME, USER, PASSWORD) VALUES (_name, _lastName, _user, _password);

END$$

DROP PROCEDURE IF EXISTS `spSearchAllUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSearchAllUser` ()  BEGIN

SELECT CODE, NAME, LASTNAME, USER, PASSWORD FROM user;

END$$

DROP PROCEDURE IF EXISTS `spUpdateUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateUser` (IN `_code` INT(5), IN `_name` VARCHAR(25), IN `_lastName` VARCHAR(25), IN `_user` VARCHAR(25), IN `_password` VARCHAR(25))  BEGIN

UPDATE user SET NAME = _name,
LASTNAME = _lastName,
USER = _user,
PASSWORD = _password
WHERE CODE = _code ;	

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `code` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `user` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`code`, `name`, `lastName`, `user`, `password`) VALUES
(58, 'David', 'Noreña', 'user', 'pass'),
(60, 'david', 'a', 'sdfsfdf', 'sfdfssffsdfsd'),
(61, 'Calamardo ', 'Perez', 'fui', '23');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
