-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Machine: 127.0.0.1
-- Gegenereerd op: 28 jan 2015 om 03:32
-- Serverversie: 5.6.17
-- PHP-versie: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `deb38057_shop`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `listitem`
--

CREATE TABLE IF NOT EXISTS `listitem` (
  `Id` int(50) NOT NULL AUTO_INCREMENT,
  `ShopId` int(50) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `Quantity` varchar(250) DEFAULT NULL,
  `Done` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Gegevens worden geëxporteerd voor tabel `listitem`
--

INSERT INTO `listitem` (`Id`, `ShopId`, `Description`, `Quantity`, `Done`) VALUES
(6, 1, 'Testje', NULL, b'1');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `Id` int(50) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Gegevens worden geëxporteerd voor tabel `shop`
--

INSERT INTO `shop` (`Id`, `Name`) VALUES
(1, 'Algemeen'),
(2, 'Delhaize'),
(3, 'Aldi'),
(4, 'Colruyt'),
(5, 'Ikea'),
(6, 'Decathlon');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
