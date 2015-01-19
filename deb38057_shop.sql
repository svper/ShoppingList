-- phpMyAdmin SQL Dump
-- version 4.3.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Gegenereerd op: 20 jan 2015 om 00:30
-- Serverversie: 5.5.34-MariaDB-cll-lve
-- PHP-versie: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `deb38057_shop`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ListItem`
--

CREATE TABLE IF NOT EXISTS `ListItem` (
  `Id` int(50) NOT NULL,
  `ShopId` int(50) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `Quantity` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `ListItem`
--

INSERT INTO `ListItem` (`Id`, `ShopId`, `Description`, `Quantity`) VALUES
(1, 2, 'Pindanoten', '2 zakken'),
(2, 2, 'Eieren', '10');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Shop`
--

CREATE TABLE IF NOT EXISTS `Shop` (
  `Id` int(50) NOT NULL,
  `Name` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Shop`
--

INSERT INTO `Shop` (`Id`, `Name`) VALUES
(1, 'Algemeen'),
(2, 'Delhaize'),
(3, 'Aldi'),
(4, 'Colruyt'),
(5, 'Ikea'),
(6, 'Decathlon');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `ListItem`
--
ALTER TABLE `ListItem`
  ADD PRIMARY KEY (`Id`);

--
-- Indexen voor tabel `Shop`
--
ALTER TABLE `Shop`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `ListItem`
--
ALTER TABLE `ListItem`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `Shop`
--
ALTER TABLE `Shop`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
