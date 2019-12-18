-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2019 a las 18:27:21
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `lat` decimal(10,8) NOT NULL,
  `lng` decimal(9,8) NOT NULL,
  `kind_food` set('Vegetariano','Mexicano','Mediterráneo','Asiático','Americano','Italiano','Turco','Africano','Gallego','Tradicional') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `adress`, `lat`, `lng`, `kind_food`) VALUES
(1, 'Tequila Cantina Mexicana', 'Carrer Bilbao, 13. 08005, Barcelona', '41.40086400', '2.20624000', 'Mexicano'),
(2, 'Obon', 'Plaça de Maragall, 13. 08027, Barcelona', '41.42063000', '2.18108500', 'Vegetariano,Mexicano,Mediterráneo'),
(3, 'Restaurant L\'Ona', 'Carretera N-II, Km 638.5', '41.49176700', '2.36899800', 'Vegetariano,Mediterráneo'),
(4, 'Sopa Boronat', 'Carrer Roc i Boronat, 114. 08018, Barcelona', '41.40234300', '2.19530100', 'Vegetariano'),
(5, 'Restaurante Julián', 'Carrer Llacuna, 92, 08018, Barcelona', '41.40282200', '2.19696200', 'Mediterráneo,Tradicional'),
(6, 'Mammamia', 'Carrer de Pallars, 230. 08005, Barcelona', '41.40269300', '2.20005500', 'Italiano'),
(7, 'Nanaya', 'Avinguda Diagonal, 173. 08018, Barcelona', '41.40494600', '2.19456200', 'Asiático'),
(8, 'Nomi Doner Kebab', 'Carrer dels Escultors Claperós, 40. 08018, Barcelona', '41.40658500', '2.18899500', 'Turco'),
(9, 'Timesburg Poblenou', 'Carrer de Pujades, 168. 08005, Barcelona', '41.40076400', '2.19971800', 'Americano'),
(10, 'Spice BCN Amigo', 'Carrer d\'Amigó, 39. 08021, Barcelona', '41.39539500', '2.14423600', 'Africano'),
(11, 'Pulpería Can Lampazas', 'Avinguda del Paral·lel, 159. 08004, Barcelona', '41.37481800', '2.15684700', 'Gallego,Tradicional');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
