-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2014 a las 04:14:30
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mundiales`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id_event` int(10) NOT NULL,
  `match_number` int(30) NOT NULL,
  `type` varchar(40) NOT NULL,
  `player` varchar(50) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id_event`),
  KEY `match_number` (`match_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matches`
--

DROP TABLE IF EXISTS `matches`;
CREATE TABLE IF NOT EXISTS `matches` (
  `match_number` int(30) NOT NULL,
  `location` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` varchar(25) NOT NULL,
  `home_team` varchar(3) NOT NULL,
  `away_team` varchar(3) NOT NULL,
  `goal_home` int(10) NOT NULL,
  `goal_away` int(10) NOT NULL,
  `winner` varchar(30) NOT NULL,
  PRIMARY KEY (`match_number`),
  KEY `home_team` (`home_team`,`away_team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `fifa_code` varchar(3) NOT NULL,
  `country` varchar(25) NOT NULL,
  `group_id` int(10) NOT NULL,
  PRIMARY KEY (`fifa_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `teams`
--

INSERT INTO `teams` (`fifa_code`, `country`, `group_id`) VALUES
('bra', 'brazil', 1),
('sdf', 'sfa', 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
