
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Base de datos: `edbm`
DROP DATABASE IF EXISTS `edbm`;
CREATE DATABASE `edbm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `edbm`;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `departamento`
CREATE TABLE `departamento` (
    `id` int(11) NOT NULL,
    `nombre` varchar(100) NOT NULL,
    `descripcion` text NOT NULL,
    `presupuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Truncar tablas antes de insertar `departamento`
TRUNCATE TABLE `departamento`;

-- Inserción de datos para la tabla `departamento`
INSERT INTO `departamento` (`id`, `nombre`, `descripcion`, `presupuesto`) VALUES
(1, 'Legal', 'In congue.', 9864866),
(2, 'Engineering', 'Praesent blandit.', 1906538),
(3, 'Training', 'Aliquam non mauris. Morbi non lectus.', 8815561),
(4, 'Marketing', 'Morbi non quam nec dui luctus rutrum.', 4976507),
(5, 'Services', 'Vestibulum ante ipsum.', 8910195);
-- --------------------------------------------------------
-- Estructura de tabla para la tabla `empleado`
CREATE TABLE `empleado` (
    `id` int(11) NOT NULL,
    `nombre` varchar(100) NOT NULL,
    `ap_paterno` varchar(50) NOT NULL,
    `ap_materno` varchar(50) NOT NULL,
    `fecha_nacimiento` date NOT NULL,
    `direccion` varchar(100) NOT NULL,
    `fecha_alta` date NOT NULL,
    `fecha_baja` date DEFAULT NULL,
    `salario` float NOT NULL,
    `puesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Truncar tablas antes de insertar `empleado`
TRUNCATE TABLE `empleado`;

-- Inserción de datos para la tabla `empleado`
INSERT INTO `empleado` (`id`, `nombre`, `ap_paterno`, `ap_materno`, `fecha_nacimiento`, `direccion`, `fecha_alta`, `fecha_baja`, `salario`, `puesto`) VALUES
(1, 'Hernando', 'Georgeou', 'Lawrenz', '1981-10-07', '353 Duke Alley', '2020-10-05', '2020-09-25', 1, 1),
(2, 'Demetri', 'Bernaldo', 'Harryman', '2000-04-12', '5 Jenna Alley', '2022-08-28', '2022-08-14', 1, 2),
(3, 'Joann', 'Backshill', 'Gartrell', '1972-12-19', '02656 Onsgard Avenue', '2020-01-26', '2020-03-15', 1, 3),
(4, 'Helaine', 'Leavens', 'Rathborne', '1992-03-18', '40584 Darwin Lane', '2021-02-11', '2023-02-21', 1, 4),
(5, 'Tammy', 'Lehrle', 'Leggott', '2004-05-20', '2 Green Ridge Drive', '2023-08-03', '2021-11-07', 1, 5),
(6, 'Tammy', 'Blazic', 'Jukes', '2001-05-22', '41938 Homewood Center', '2022-11-07', '2020-07-02', 1, 6),
(7, 'Lanette', 'Apple', 'Gerhardt', '1971-08-18', '1 6th Alley', '2022-06-18', '2021-11-01', 1, 7),
(8, 'Bailey', 'Oakshott', 'Brennan', '1977-10-29', '2973 Di Loreto Place', '2022-09-22', '2022-09-09', 1, 8),
(9, 'Shirlene', 'Blucher', 'Hasel', '2000-02-26', '76 Loomis Junction', '2020-11-08', '2022-09-17', 1, 9),
(10, 'Jerry', 'Longbone', 'Youster', '1982-12-07', '75980 Bluestem Drive', '2022-08-03', '2022-01-28', 1, 10),
(11, 'Sheilakathryn', 'Smeeton', 'Farleigh', '2003-06-13', '125 Grim Drive', '2020-07-01', '2023-04-08', 1, 11),
(12, 'Sadye', 'Ashton', 'Novic', '1984-02-27', '0889 Gerald Street', '2022-06-18', '2022-11-16', 1, 12),
(13, 'Felicle', 'Kinge', 'Airton', '1988-06-03', '1 Burrows Drive', '2022-11-30', '2022-07-18', 1, 13),
(14, 'Janet', 'Golda', 'Hryniewicki', '1989-02-27', '9665 Maywood Junction', '2022-01-23', '2020-04-25', 1, 14),
(15, 'Cort', 'Mordey', 'Erwin', '2001-09-30', '14072 Forster Crossing', '2020-07-01', '2021-05-03', 1, 15),
(16, 'Vanny', 'Stimpson', 'Bassilashvili', '1978-07-02', '49 Village Way', '2022-12-25', '2022-12-27', 1, 16),
(17, 'Barnebas', 'Rubinowitch', 'Guerreiro', '1976-02-08', '016 Mandrake Park', '2021-04-25', '2022-08-23', 1, 17),
(18, 'Vi', 'Mundford', 'Bradly', '1990-04-01', '39 Westport Way', '2022-12-17', '2020-10-17', 1, 18),
(19, 'Justen', 'Viles', 'Goldstraw', '1989-05-31', '622 Boyd Junction', '2021-07-22', '2021-10-02', 1, 19),
(20, 'Florian', 'Andreazzi', 'Dwane', '1985-07-06', '18247 Westend Crossing', '2022-02-04', '2020-04-28', 1, 20),
(21, 'Jae', 'Crittal', 'Vescovini', '1987-01-23', '808 John Wall Drive', '2020-02-01', '2022-03-01', 1, 21),
(22, 'Reynold', 'Bryant', 'Madgewick', '1978-12-31', '424 Washington Drive', '2021-10-07', '2022-02-04', 1, 22),
(23, 'Lou', 'Castro', 'Bigby', '1977-08-30', '39394 Ridgeway Alley', '2020-02-15', '2020-02-12', 1, 23),
(24, 'Star', 'Klug', 'Faveryear', '1999-04-30', '688 Pankratz Terrace', '2022-10-19', '2021-12-12', 1, 24),
(25, 'Barde', 'Shawyer', 'Tarbin', '1979-11-19', '63 Portage Way', '2020-08-20', '2020-07-26', 1, 25),
(26, 'Madeline', 'Ranby', 'Summons', '2001-01-03', '3 Eagle Crest Park', '2022-10-01', '2022-02-08', 1, 26),
(27, 'Prince', 'Mularkey', 'Egarr', '1972-11-23', '60 Lukken Trail', '2022-06-22', '2021-04-14', 1, 27),
(28, 'Ferne', 'Massei', 'Edwins', '1976-09-23', '54 Jana Parkway', '2021-08-06', '2021-02-20', 1, 28),
(29, 'Jerrylee', 'Korfmann', 'Swinnard', '2005-02-27', '3965 Gale Crossing', '2020-12-27', '2023-08-17', 1, 29),
(30, 'Rhetta', 'Wegman', 'Trassler', '2001-06-03', '4918 5th Place', '2023-01-20', '2023-08-01', 1, 30),
(31, 'Spence', 'Dranfield', 'Dumbar', '1993-05-19', '56887 Lien Court', '2021-05-06', '2022-05-24', 1, 31),
(32, 'Mortimer', 'Latey', 'Rakestraw', '1986-02-12', '703 Sutherland Hill', '2022-11-14', '2020-01-07', 1, 32),
(33, 'Mallissa', 'Huntingdon', 'Prin', '1988-05-09', '0691 Novick Parkway', '2020-08-19', '2020-10-23', 1, 33),
(34, 'Genevieve', 'Franzini', 'Mayhou', '1997-12-15', '2896 South Crossing', '2020-01-02', '2023-08-25', 1, 34),
(35, 'Carlo', 'Dur', 'Elderfield', '1980-07-04', '86 Twin Pines Court', '2022-10-24', '2022-01-06', 1, 35),
(36, 'Eldon', 'Grosier', 'Jimmes', '1981-08-15', '623 Surrey Alley', '2022-02-18', '2020-03-16', 1, 36),
(37, 'Reynolds', 'Daniau', 'Tofanini', '1980-05-09', '701 Namekagon Lane', '2023-06-13', '2020-07-10', 1, 37),
(38, 'Libbie', 'Galea', 'Isson', '2003-10-10', '78 Forster Court', '2020-01-11', '2020-03-03', 1, 38),
(39, 'Hester', 'Biasioni', 'Oats', '1992-03-08', '018 Sycamore Center', '2023-07-18', '2021-08-04', 1, 39),
(40, 'Christyna', 'Maxwaile', 'Grabiec', '1975-12-18', '57131 Sherman Plaza', '2022-09-05', '2022-09-07', 1, 40),
(41, 'Ben', 'deKnevet', 'Clifft', '1983-01-10', '78853 Garrison Parkway', '2021-02-15', '2020-07-24', 1, 41),
(42, 'Larine', 'Stuchbury', 'Vanshin', '2002-09-30', '9494 Cambridge Way', '2021-10-22', '2021-05-11', 1, 42),
(43, 'Ernestus', 'Hollingdale', 'Loton', '1992-07-03', '7 Dennis Parkway', '2021-09-19', '2020-04-10', 1, 43),
(44, 'Seumas', 'Varnals', 'Alwen', '1984-09-12', '5 Garrison Street', '2023-06-19', '2020-06-27', 1, 44),
(45, 'Britteny', 'Lawther', 'Biggen', '1992-02-26', '545 Waywood Lane', '2021-02-02', '2023-05-12', 1, 45),
(46, 'Meg', 'Domenc', 'Eggins', '2002-04-12', '582 Corben Court', '2021-02-21', '2022-09-02', 1, 46),
(47, 'Lenee', 'Dormon', 'Pohls', '1980-01-11', '80 Truax Way', '2021-10-03', '2021-06-07', 1, 47),
(48, 'Elyssa', 'Hasel', 'Schubert', '1989-08-08', '19 Fulton Road', '2022-08-27', '2021-04-20', 1, 48),
(49, 'Stafani', 'Hugnet', 'Ludlom', '1978-03-30', '7 Haas Point', '2021-08-16', '2020-02-18', 1, 49),
(50, 'Fredrick', 'Danilishin', 'Leigh', '1974-12-06', '8 Tennyson Center', '2021-11-28', '2022-04-19', 1, 50),
(51, 'Hermy', 'Jurges', 'Eldritt', '1993-05-21', '77664 Sachtjen Court', '2020-05-29', '2023-01-30', 1, 51),
(52, 'Catina', 'Pease', 'Lynock', '2004-12-15', '274 Atwood Hill', '2022-09-23', '2021-06-17', 1, 52),
(53, 'Keary', 'Beagan', 'Patmore', '2000-08-31', '5 Mcguire Park', '2021-04-02', '2020-03-06', 1, 53),
(54, 'Anjanette', 'Gimbrett', 'Hardistry', '1985-01-13', '78 Heffernan Park', '2020-08-08', '2023-06-24', 1, 54),
(55, 'Court', 'Simenon', 'Buckley', '1982-07-28', '4 Norway Maple Lane', '2020-11-23', '2022-10-13', 1, 55),
(56, 'Ami', 'Stutard', 'Camell', '2003-07-04', '24699 Oak Valley Court', '2023-08-29', '2020-01-02', 1, 56),
(57, 'Carrol', 'Narraway', 'Dummett', '1970-09-26', '8 Stephen Park', '2020-03-14', '2021-12-19', 1, 57),
(58, 'Dore', 'Beccera', 'Dracey', '1997-02-20', '71 Londonderry Drive', '2020-03-05', '2020-05-14', 1, 58),
(59, 'Bevon', 'Grzelczyk', 'Twinbourne', '1986-01-27', '8391 Vermont Street', '2023-07-31', '2020-10-25', 1, 59),
(60, 'Cyrill', 'Tipple', 'Bortolutti', '2003-01-06', '1 West Plaza', '2022-09-06', '2020-05-21', 1, 60),
(61, 'Jorge', 'Martinez', 'Buenrostro', '1996-05-09', 'Emiliano Zapata 39, Santa Anita', '2023-10-09', NULL, 123456, 4);
-- --------------------------------------------------------
-- Estructura de tabla para la tabla `empleadoproyecto`
CREATE TABLE `empleadoproyecto` (
    `id` int(11) NOT NULL,
    `empleado` int(11) NOT NULL,
    `proyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Truncar tablas antes de insertar `empleadoproyecto`
TRUNCATE TABLE `empleadoproyecto`;

-- Inserción de datos para la tabla `empleadoproyecto`
INSERT INTO `empleadoproyecto` (`id`, `empleado`, `proyecto`) VALUES
(1, 1, 1),
(2, 7, 2),
(3, 8, 3),
(4, 10, 6),
(5, 11, 14),
(6, 26, 15),
(7, 27, 17),
(8, 35, 18),
(9, 40, 20),
(10, 41, 26),
(11, 44, 28),
(12, 52, 34),
(13, 54, 45),
(14, 57, 47),
(15, 58, 48),
(16, 59, 50),
(17, 2, 4),
(18, 3, 8),
(19, 12, 13),
(20, 19, 24),
(21, 24, 32),
(22, 25, 33),
(23, 29, 35),
(24, 37, 38),
(25, 42, 39),
(26, 47, 54),
(27, 49, 57),
(28, 49, 58),
(29, 9, 7),
(30, 13, 19),
(31, 16, 27),
(32, 20, 31),
(33, 22, 42),
(34, 34, 44),
(35, 36, 49),
(36, 39, 52),
(37, 45, 7),
(38, 48, 19),
(39, 50, 27),
(40, 5, 5),
(41, 15, 9),
(42, 17, 12),
(43, 23, 23),
(44, 32, 25),
(45, 46, 29),
(46, 55, 37),
(47, 56, 41),
(48, 17, 43),
(49, 2, 51),
(50, 32, 56),
(51, 55, 59),
(52, 56, 60),
(53, 4, 10),
(54, 6, 11),
(55, 14, 16),
(56, 18, 21),
(57, 21, 22),
(58, 28, 30),
(59, 30, 36),
(60, 31, 40),
(61, 33, 46),
(62, 38, 53),
(63, 43, 55),
(64, 51, 11),
(65, 53, 30),
(66, 60, 36);
-- --------------------------------------------------------
-- Estructura de tabla para la tabla `perfil`
CREATE TABLE `perfil` (
    `id` int(11) NOT NULL,
    `empleado` int(11) NOT NULL,
    `rol` int(11) NOT NULL,
    `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Truncar tablas antes de insertar `perfil`
TRUNCATE TABLE `perfil`;

-- Inserción de datos para la tabla `perfil`
INSERT INTO `perfil` (`id`, `empleado`, `rol`, `usuario`) VALUES
(1, 61, 0, 1);
-- --------------------------------------------------------
-- Estructura de tabla para la tabla `proyecto`
CREATE TABLE `proyecto` (
    `id` int(11) NOT NULL,
    `descripcion` text NOT NULL,
    `fecha_inicio` date NOT NULL,
    `fecha_fin` date NOT NULL,
    `presupuesto` float NOT NULL,
    `departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Truncar tablas antes de insertar `proyecto`
TRUNCATE TABLE `proyecto`;

-- Inserción de datos para la tabla `proyecto`
INSERT INTO `proyecto` (`id`, `descripcion`, `fecha_inicio`, `fecha_fin`, `presupuesto`, `departamento`) VALUES
(1, 'Vestibulum ante ipsum primis in .', '2020-09-11', '2023-06-18', 171524, 1),
(2, 'Praesent blandit lacinia erat.', '2021-06-22', '2024-05-15', 41174.8, 1),
(3, 'Quisque id justo sit amet sapien dignilum.', '2020-03-29', '2020-04-16', 156832, 1),
(4, 'Etiam pretium iaculis justo.', '2023-07-01', '2022-11-17', 169021, 2),
(5, 'Etiam pretium iaculis justo.', '2021-08-17', '2021-09-09', 156864, 4),
(6, 'Pellentesque ultrices mattis odio.', '2022-12-04', '2022-11-10', 108774, 1),
(7, 'Nullam varius.', '2020-04-02', '2021-07-29', 42609.3, 3),
(8, 'In hac habitasse platea dictumst.', '2021-08-08', '2023-09-22', 157802, 2),
(9, 'Aenean lectus.', '2021-08-05', '2021-11-24', 196154, 4),
(10, 'Nam dui.', '2020-12-23', '2020-05-06', 73314.3, 5),
(11, 'Morbi sem mauris, laoreet nar sed, nisl.', '2021-08-27', '2022-10-07', 144092, 5),
(12, 'Vestibulum rutrum rutrum neque.', '2022-09-08', '2023-07-18', 111380, 4),
(13, 'Duis at velit eu est congue elementum.', '2022-09-09', '2023-01-24', 43139.7, 2),
(14, 'Phasellus id sapien in sapien iaculis congue.', '2020-11-13', '2024-07-19', 161785, 1),
(15, 'Etiam vel augue.', '2021-11-29', '2023-04-20', 70836, 1),
(16, 'Integer non velit.', '2023-03-27', '2024-01-31', 195080, 5),
(17, 'In congue.', '2022-11-05', '2022-10-17', 158949, 1),
(18, 'Vestibulum quam sapien, variun, ante.', '2023-04-28', '2021-09-18', 126910, 1),
(19, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2022-03-20', '2021-01-02', 86403.4, 3),
(20, 'Cum sociis natoque penatibus et magnis diur ridiculus mus.', '2022-03-24', '2020-07-12', 191206, 1),
(21, 'Quisque erat eros, viverra eget, cor rutrum, nulla.', '2020-07-11', '2022-11-19', 179341, 5),
(22, 'Cras in purus eu magna vulputate luctus.', '2022-09-27', '2020-07-03', 74532.4, 5),
(23, 'Morbi ut odio.', '2021-06-13', '2023-03-28', 80573.4, 4),
(24, 'Morbi quis tortor id nulla ultrices aliquet.', '2020-10-25', '2022-03-28', 199552, 2),
(25, 'In sagittis dui vel nisl.', '2022-04-24', '2021-08-25', 146626, 4),
(26, 'Nullam molestie nibh in lectus.', '2020-02-29', '2023-09-01', 185954, 1),
(27, 'Vivamus vel nulla eget eros elementum pellentesque.', '2022-05-08', '2022-05-13', 151594, 3),
(28, 'Praesent lectus.', '2020-03-09', '2024-04-24', 72122.2, 1),
(29, 'Morbi non quam nec dui luctus rutrum.', '2020-07-19', '2021-06-14', 82714.4, 4),
(30, 'Maecenas tincidunt lacus at velit.', '2020-04-05', '2024-02-27', 46059.7, 5),
(31, 'Nulla ut erat id mauris vulputate elementum.', '2020-04-30', '2023-04-16', 134941, 3),
(32, 'Maecenas ut massa quis augue luctus tincidunt.', '2020-02-05', '2023-10-23', 114124, 2),
(33, 'Suspendisse accumsan tortor quis turpis.', '2020-10-31', '2023-03-12', 154857, 2),
(34, 'Praesent lectus.', '2021-02-16', '2023-05-24', 116121, 1),
(35, 'Vivamus vestibulum sagittis sapien.', '2022-04-21', '2022-07-15', 20201.8, 2),
(36, 'Aenean fermentum.', '2022-02-16', '2023-12-04', 117548, 5),
(37, 'Nulla justo.', '2022-06-11', '2024-02-06', 68867.5, 4),
(38, 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2020-08-13', '2020-08-31', 61598.7, 2),
(39, 'Praesent blandit lacinia erat.', '2022-05-10', '2020-02-29', 34006.4, 2),
(40, 'Curabitur convallis.', '2022-02-09', '2022-05-15', 73718.5, 5),
(41, 'Aliquam quis turpis eget elit sodales scelerisque.', '2021-12-06', '2021-01-13', 95437.8, 4),
(42, 'Mauris lacinia sapien quis libero.', '2023-04-24', '2020-07-30', 80747.2, 3),
(43, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2021-02-23', '2022-03-21', 15430, 4),
(44, 'In eleifend quam a odio.', '2020-12-25', '2020-10-25', 170037, 3),
(45, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullla.', '2022-05-11', '2020-09-13', 120110, 1),
(46, 'Vivamus vel nulla eget eros elementum pellentesque.', '2023-02-20', '2022-05-10', 177395, 5),
(47, 'Vivamus in felis eu sapien cursus vestibulum.', '2020-09-14', '2020-07-20', 188569, 1),
(48, 'Suspendisse potenti.', '2022-12-28', '2020-02-01', 110026, 1),
(49, 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2021-05-13', '2024-02-11', 57691.1, 3),
(50, 'Nulla facilisi.', '2021-07-24', '2023-06-03', 93653.2, 1),
(51, 'Donec quis orci eget orci vehicula condimentum.', '2023-01-23', '2020-07-09', 164139, 4),
(52, 'Etiam faucibus cursus urna.', '2022-10-25', '2023-07-31', 80815.8, 3),
(53, 'Mauris ullamcorper purus sit amet nulla.', '2021-12-12', '2021-05-20', 170363, 5),
(54, 'Nulla ut erat id mauris vulputate elementum.', '2021-12-12', '2021-03-29', 167453, 2),
(55, 'Etiam justo.', '2021-10-19', '2023-10-23', 97120.4, 5),
(56, 'Vestibulum ante ipsum primis in faucibus , Mauris viverra diam vitae quam.', '2020-11-25', '2022-03-25', 173402, 4),
(57, 'Maecenas tristique, est et tempus magna, ac consequat metus sapien ut nunc.', '2022-10-16', '2022-04-27', 17427.3, 2),
(58, 'Proin at turpis a pede posuere nonummy.', '2023-03-20', '2022-11-25', 172363, 2),
(59, 'Vestibulum ante ipsum primis in  Duis faucibus accumsan odio.', '2020-07-21', '2023-10-05', 54752.8, 4),
(60, 'Nulla tellus.', '2020-08-03', '2020-02-02', 43907.8, 4);
-- --------------------------------------------------------
-- Estructura de tabla para la tabla `puesto`
CREATE TABLE `puesto` (
    `id` int(11) NOT NULL,
    `nombre` varchar(100) NOT NULL,
    `descripcion` text NOT NULL,
    `salario_base` float NOT NULL,
    `departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Truncar tablas antes de insertar `puesto`
TRUNCATE TABLE `puesto`;

-- Inserción de datos para la tabla `puesto`
INSERT INTO `puesto` (`id`, `nombre`, `descripcion`, `salario_base`, `departamento`) VALUES
(1, 'Research Associate', 'Proin eu mi.', 67018.9, 1),
(2, 'Safety Technician II', 'Donec quis orci .', 84306.7, 2),
(3, 'Office Assistant I', 'Vivamus tortor.', 50203, 4),
(4, 'Developer III', 'Vestibulum ac est lacinia.', 32462.6, 1),
(5, 'Analog Circuit Design manager', 'Mauris sit amet eros.', 9940.36, 5),
(6, 'Analyst Programmer', 'Etiam faucibus cursus urna.', 11167.6, 5),
(7, 'Quality Control Specialist', 'Aliquam erat volutpat.', 35388.2, 1),
(8, 'General Manager', 'Vivamus vel nulla eget eros elementum.', 352145, 2),
(9, 'Automation Specialist III', 'Integer ac leo.', 99225.4, 4),
(10, 'Pharmacist', 'Integer pede justo, lacinia eget.', 35553.7, 5),
(11, 'Staff Accountant I', 'Curabitur in libero ut.', 39835.7, 5),
(12, 'Technical Writer', 'Aenean lectus.', 83773, 1),
(13, 'Geologist III', 'Proin eu mi.', 52619.3, 5),
(14, 'Recruiting Manager', 'Pellentesque at nulla.', 47500.8, 1),
(15, 'Civil Engineer', 'Fusce congue, diam id ornare.', 10287.4, 3),
(16, 'Senior Sales Associate', 'Ut tellus.', 98149.5, 5),
(17, 'Geologist III', 'Fusce posuere felis sed lacus.', 27692.2, 5),
(18, 'Help Desk Technician', 'Nulla justo.', 82965.9, 3),
(19, 'Database Administrator I', 'In tempor, turpis nec.', 97637.3, 4),
(20, 'Geologist I', 'Maecenas rhoncus aliquam lacus.', 64432.6, 3),
(21, 'Software Engineer I', 'In sagittis dui vel nisl.', 57749.5, 4),
(22, 'Geological Engineer', 'Aliquam non mauris.', 69428.1, 3),
(23, 'Professor', 'Nam dui.', 87769.6, 4),
(24, 'Analyst Programmer', 'Vestibulum ac est lacinia.', 27789.8, 3),
(25, 'Paralegal', 'Vestibulum rutrum rutrum neque.', 20850.3, 1),
(26, 'Programmer III', 'Vestibulum ante ipsum primis in.', 85361, 2),
(27, 'VP Quality Control', 'Aliquam non mauris.', 73750, 1),
(28, 'Senior Editor', 'Mauris lacinia sapien quis libero.', 56535.1, 3),
(29, 'Nurse Practicioner', 'Integer tincidunt ante vel ipsum.', 71016.5, 1),
(30, 'Data Coordinator', 'In hac habitasse platea dictumst.', 21204.5, 5),
(31, 'Physical Therapy Assistant', 'Donec vitae nisi.', 95618.7, 2),
(32, 'Electrical Engineer', 'Vestibulum ante ipsum primi.', 22897.9, 1),
(33, 'Business Systems Development Analyst', 'Curabitur gravida nisi at nibh.', 79263.6, 4),
(34, 'Compensation Analyst', 'Nam nulla.', 90643.8, 2),
(35, 'Pharmacist', 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 388.49, 4),
(36, 'Staff Accountant I', 'Maecenas pulvinar lobortis est.', 12213.5, 3),
(37, 'Senior Financial Analyst', 'Donec quis orci eget orci vehicula condimentum.', 89024.9, 1),
(38, 'Research Assistant I', 'Duis aliquam convallis nunc.', 18609.7, 5),
(39, 'Software Test Engineer IV', 'Fusce congue, diam id ornare.', 69451.2, 5),
(40, 'Environmental Tech', 'Integer aliquet, massa id lobortis.', 86561.4, 4),
(41, 'Project Manager', 'Vivamus vel nulla eget eros elementum pellentesque.', 23679.5, 3),
(42, 'Associate Professor', 'Vivamus vel nulla eget eros elementum pellentesque.', 33686.2, 3),
(43, 'Financial Analyst', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 39052.3, 3),
(44, 'Systems Administrator IV', 'Duis at velit eu es congue elementum.', 70570.5, 4),
(45, 'Civil Engineer', 'Sed accumsan felis.', 66606.5, 5),
(46, 'Pharmacist', 'Vestibulum ac est lacinia.', 87540.5, 4),
(47, 'Senior Quality Engineer', 'Vesti.', 86983.1, 2),
(48, 'Help Desk Operator', 'Nulla facilisi.', 29647.8, 4),
(49, 'Technical Writer', 'Quisque erat eros,.', 45635.8, 2),
(50, 'Analyst Programmer', 'Vestibulum ac est lacinia.', 24149.9, 5),
(51, 'Physical Therapy Assistant', 'Curabitur in liber.', 33771.3, 3),
(52, 'Data Coordinator', 'Vestibulum ante ipsum primis.', 12710.1, 2),
(53, 'Automation Specialist I', 'Vestibulum qua.', 90730.5, 4),
(54, 'Accountant I', 'Phasellus id sapien in sapien iaculis congue.', 42953.2, 4),
(55, 'Media Manager II', 'In hac habitasse platea dictumst.', 91660.4, 5),
(56, 'General Manager', 'Aliquam quis turpis eget elit sodales scelerisque.', 73620.4, 5),
(57, 'Structural Analysis Engineer', 'Praesent id massa id nisl venenatis lacinia.', 8425.5, 2),
(58, 'Design Engineer', 'Morbi non quam nec dui luctus rutrum.', 20173.4, 3),
(59, 'Professor', 'Praesent lectus.', 53898.9, 2),
(60, 'Electrical Engineer', 'In quis justo.', 52850.8, 5);
-- --------------------------------------------------------
-- Estructura de tabla para la tabla `usuario`
CREATE TABLE `usuario` (
    `id` int(11) NOT NULL,
    `nombre` varchar(100) NOT NULL,
    `correo` varchar(50) NOT NULL,
    `contrasena` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Truncar tablas antes de insertar `usuario`
TRUNCATE TABLE `usuario`;

-- Inserción de datos para la tabla `usuario`
INSERT INTO `usuario` (`id`, `nombre`, `correo`, `contrasena`) VALUES
(1, 'Jorge', 'molap96@gmail.com', '#Contraseña');
-- --------------------------------------------------------

ALTER TABLE `departamento`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `empleado`
    ADD PRIMARY KEY (`id`),
    ADD KEY `Empleado_fk1` (`puesto`);

ALTER TABLE `empleadoproyecto`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fk_empleado` (`empleado`),
    ADD KEY `fk_proyecto` (`proyecto`);

ALTER TABLE `perfil`
    ADD PRIMARY KEY (`id`),
    ADD KEY `Perfil_fk0` (`empleado`),
    ADD KEY `fk_usuario_perfil` (`usuario`);

ALTER TABLE `proyecto`
    ADD PRIMARY KEY (`id`),
    ADD KEY `Proyecto_fk0` (`departamento`);

ALTER TABLE `puesto`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fk_departamento` (`departamento`);

ALTER TABLE `usuario`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `departamento`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `empleado`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

ALTER TABLE `empleadoproyecto`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

ALTER TABLE `perfil`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `proyecto`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

ALTER TABLE `puesto`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

ALTER TABLE `usuario`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `empleado`
    ADD CONSTRAINT `Empleado_fk1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`id`);

ALTER TABLE `empleadoproyecto`
    ADD CONSTRAINT `EmpleadoProyecto_fk0` FOREIGN KEY (`empleado`) REFERENCES `empleado` (`id`),
    ADD CONSTRAINT `EmpleadoProyecto_fk1` FOREIGN KEY (`proyecto`) REFERENCES `proyecto` (`id`),
    ADD CONSTRAINT `fk_empleado` FOREIGN KEY (`empleado`) REFERENCES `empleado` (`id`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_proyecto` FOREIGN KEY (`proyecto`) REFERENCES `proyecto` (`id`) ON DELETE CASCADE;

ALTER TABLE `perfil`
    ADD CONSTRAINT `Perfil_fk0` FOREIGN KEY (`empleado`) REFERENCES `empleado` (`id`),
    ADD CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

ALTER TABLE `proyecto`
    ADD CONSTRAINT `Proyecto_fk0` FOREIGN KEY (`departamento`) REFERENCES `departamento` (`id`);

ALTER TABLE `puesto`
    ADD CONSTRAINT `Puesto_fk0` FOREIGN KEY (`departamento`) REFERENCES `departamento` (`id`),
    ADD CONSTRAINT `fk_departamento` FOREIGN KEY (`departamento`) REFERENCES `departamento` (`id`);
COMMIT;
