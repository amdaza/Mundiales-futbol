-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2014 a las 01:47:19
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mundials`
--
CREATE DATABASE `mundials` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mundials`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `goals`
--

CREATE TABLE IF NOT EXISTS `goals` (
  `idGoal` int(11) NOT NULL,
  `idMatch` int(11) NOT NULL,
  `minunte` int(11) NOT NULL,
  `player` varchar(50) NOT NULL,
  `goal` int(11) NOT NULL,
  `local` tinyint(1) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`idGoal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `idMatch` int(11) NOT NULL,
  `localTeam` varchar(10) NOT NULL,
  `visitTeam` varchar(10) NOT NULL,
  `localGoals` int(11) NOT NULL,
  `visitGoals` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `idMundial` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`idMatch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mundials`
--

CREATE TABLE IF NOT EXISTS `mundials` (
  `idMundial` int(11) NOT NULL AUTO_INCREMENT,
  `year` year(4) NOT NULL,
  `organizer` varchar(50) NOT NULL,
  PRIMARY KEY (`idMundial`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `mundials`
--

INSERT INTO `mundials` (`idMundial`, `year`, `organizer`) VALUES
(1, 2014, 'Brazil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `idPlayer` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `idsquads` int(11) NOT NULL,
  `postion` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `squads`
--

CREATE TABLE IF NOT EXISTS `squads` (
  `country` int(10) NOT NULL,
  `idSquad` int(11) NOT NULL,
  `idMundial` int(11) NOT NULL,
  PRIMARY KEY (`idSquad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
