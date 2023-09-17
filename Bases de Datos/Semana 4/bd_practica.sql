--Creacion de la base Employee DataBase Management
CREATE DATABASE EDBM;

--Usamos la base
USE EDBM;

--Se crea la entidad Empleado
CREATE TABLE `Empleado` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(100) NOT NULL,
	`apellidos` varchar(100) NOT NULL,
	`fecha_nacimiento` DATE NOT NULL,
	`direccion` varchar(100) NOT NULL,
	`fecha_alta` DATE NOT NULL,
	`fecha_baja` DATE NOT NULL,
	`salario` FLOAT NOT NULL,
	`departamento` INT NOT NULL,
	`puesto` INT NOT NULL,
	PRIMARY KEY (`id`)
);

--Se crea la entidad Proyecto
CREATE TABLE `Proyecto` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`descripcion` TEXT NOT NULL,
	`fecha_inicio` DATE NOT NULL,
	`fecha_fin` DATE NOT NULL,
	`presupuesto` FLOAT NOT NULL,
	`departamento` INT NOT NULL,
	PRIMARY KEY (`id`)
);

--Se crea la entidad Departamento
CREATE TABLE `Departamento` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(100) NOT NULL,
	`descripcion` TEXT NOT NULL,
	`presupuesto` INT NOT NULL,
	PRIMARY KEY (`id`)
);

--Se crea la entidad puesto
CREATE TABLE `Puesto` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(100) NOT NULL,
	`descripcion` TEXT NOT NULL,
	`salario_base` FLOAT NOT NULL,
	`departamento` INT NOT NULL,
	PRIMARY KEY (`id`)
);

--Se crea la entidad empleadoProyecto
CREATE TABLE `EmpleadoProyecto` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`empleado` INT NOT NULL,
	`proyecto` INT NOT NULL,
	PRIMARY KEY (`id`)
);

--Se crea la entidad perfil
CREATE TABLE `Perfil` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`empleado` INT NOT NULL,
	`rol` INT NOT NULL,
	PRIMARY KEY (`id`)
);

--Se agrega la FK en empleado para el id del departamento al que pertenece
ALTER TABLE `Empleado` ADD CONSTRAINT `Empleado_fk0` FOREIGN KEY (`departamento`) REFERENCES `Departamento`(`id`);

--Se agrega la FK en empleado para el id de su puesto
ALTER TABLE `Empleado` ADD CONSTRAINT `Empleado_fk1` FOREIGN KEY (`puesto`) REFERENCES `Puesto`(`id`);

--Se agrega la FK en proyecto para saber a que departamento pertenece
ALTER TABLE `Proyecto` ADD CONSTRAINT `Proyecto_fk0` FOREIGN KEY (`departamento`) REFERENCES `Departamento`(`id`);

--Se agrega la FK en puesto para saber a que departamento pertenece
ALTER TABLE `Puesto` ADD CONSTRAINT `Puesto_fk0` FOREIGN KEY (`departamento`) REFERENCES `Departamento`(`id`);

--Se agrega la FK en EmpleadoProyecto para saber que empleado esta en el proyecto
ALTER TABLE `EmpleadoProyecto` ADD CONSTRAINT `EmpleadoProyecto_fk0` FOREIGN KEY (`empleado`) REFERENCES `Empleado`(`id`);

--Se agrega la FK en EmpleadoProyecto para saber que proyecto esta asignado a que empleado
ALTER TABLE `EmpleadoProyecto` ADD CONSTRAINT `EmpleadoProyecto_fk1` FOREIGN KEY (`proyecto`) REFERENCES `Proyecto`(`id`);

--Se agrega la FK en Perfil para el Empleado que tiene ese perfil
ALTER TABLE `Perfil` ADD CONSTRAINT `Perfil_fk0` FOREIGN KEY (`empleado`) REFERENCES `Empleado`(`id`);

--Agrega datos a Departamento
insert into departamento (nombre, descripcion, presupuesto) values 
('Legal', 'In congue.', 9864866), 
('Engineering', 'Praesent blandit.', 1906538),
('Training', 'Aliquam non mauris. Morbi non lectus.', 8815561),
('Marketing', 'Morbi non quam nec dui luctus rutrum.', 4976507),
('Services', 'Vestibulum ante ipsum.', 8910195);

--Agrega datos a Puesto
insert into puesto (nombre, descripcion, salario_base, departamento)values
('Research Associate', 'Proin eu mi.', 67018.9, 1),
('Safety Technician II', 'Donec quis orci .', 84306.7, 2),
('Office Assistant I', 'Vivamus tortor.', 50203, 4),
('Developer III', 'Vestibulum ac est lacinia.', 32462.6, 1),
('Analog Circuit Design manager', 'Mauris sit amet eros.', 9940.36, 5),
('Analyst Programmer', 'Etiam faucibus cursus urna.', 11167.6, 5),
('Quality Control Specialist', 'Aliquam erat volutpat.', 35388.2, 1),
('General Manager', 'Vivamus vel nulla eget eros elementum.', 352145, 2),
('Automation Specialist III', 'Integer ac leo.', 99225.4, 4),
('Pharmacist', 'Integer pede justo, lacinia eget.', 35553.7, 5),
('Staff Accountant I', 'Curabitur in libero ut.', 39835.7, 5),
('Technical Writer', 'Aenean lectus.', 83773, 1),
('Geologist III', 'Proin eu mi.', 52619.3, 5),
('Recruiting Manager', 'Pellentesque at nulla.', 47500.8, 1),
('Civil Engineer', 'Fusce congue, diam id ornare.', 10287.4, 3),
('Senior Sales Associate', 'Ut tellus.', 98149.5, 5),
('Geologist III', 'Fusce posuere felis sed lacus.', 27692.2, 5),
('Help Desk Technician', 'Nulla justo.', 82965.9, 3),
('Database Administrator I', 'In tempor, turpis nec.', 97637.3, 4),
('Geologist I', 'Maecenas rhoncus aliquam lacus.', 64432.6, 3),
('Software Engineer I', 'In sagittis dui vel nisl.', 57749.5, 4),
('Geological Engineer', 'Aliquam non mauris.', 69428.1, 3),
('Professor', 'Nam dui.', 87769.6, 4),
('Analyst Programmer', 'Vestibulum ac est lacinia.', 27789.8, 3),
('Paralegal', 'Vestibulum rutrum rutrum neque.', 20850.3, 1),
('Programmer III', 'Vestibulum ante ipsum primis in.', 85361, 2),
('VP Quality Control', 'Aliquam non mauris.', 73750, 1),
('Senior Editor', 'Mauris lacinia sapien quis libero.', 56535.1, 3),
('Nurse Practicioner', 'Integer tincidunt ante vel ipsum.', 71016.5, 1),
('Data Coordinator', 'In hac habitasse platea dictumst.', 21204.5, 5),
('Physical Therapy Assistant', 'Donec vitae nisi.', 95618.7, 2),
('Electrical Engineer', 'Vestibulum ante ipsum primi.', 22897.9, 1),
('Business Systems Development Analyst', 'Curabitur gravida nisi at nibh.', 79263.6, 4),
('Compensation Analyst', 'Nam nulla.', 90643.8, 2),
('Pharmacist', 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 388.49, 4),
('Staff Accountant I', 'Maecenas pulvinar lobortis est.', 12213.5, 3),
('Senior Financial Analyst', 'Donec quis orci eget orci vehicula condimentum.', 89024.9, 1),
('Research Assistant I', 'Duis aliquam convallis nunc.', 18609.7, 5),
('Software Test Engineer IV', 'Fusce congue, diam id ornare.', 69451.2, 5),
('Environmental Tech', 'Integer aliquet, massa id lobortis.', 86561.4, 4),
('Project Manager', 'Vivamus vel nulla eget eros elementum pellentesque.', 23679.5, 3),
('Associate Professor', 'Vivamus vel nulla eget eros elementum pellentesque.', 33686.2, 3),
('Financial Analyst', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 39052.3, 3),
('Systems Administrator IV', 'Duis at velit eu es congue elementum.', 70570.5, 4),
('Civil Engineer', 'Sed accumsan felis.', 66606.5, 5),
('Pharmacist', 'Vestibulum ac est lacinia.', 87540.5, 4),
('Senior Quality Engineer', 'Vesti.', 86983.1, 2),
('Help Desk Operator', 'Nulla facilisi.', 29647.8, 4),
('Technical Writer', 'Quisque erat eros,.', 45635.8, 2),
('Analyst Programmer', 'Vestibulum ac est lacinia.', 24149.9, 5),
('Physical Therapy Assistant', 'Curabitur in liber.', 33771.3, 3),
('Data Coordinator', 'Vestibulum ante ipsum primis.', 12710.1, 2),
('Automation Specialist I', 'Vestibulum qua.', 90730.5, 4),
('Accountant I', 'Phasellus id sapien in sapien iaculis congue.', 42953.2, 4),
('Media Manager II', 'In hac habitasse platea dictumst.', 91660.4, 5),
('General Manager', 'Aliquam quis turpis eget elit sodales scelerisque.', 73620.4, 5),
('Structural Analysis Engineer', 'Praesent id massa id nisl venenatis lacinia.', 8425.5, 2),
('Design Engineer', 'Morbi non quam nec dui luctus rutrum.', 20173.4, 3),
('Professor', 'Praesent lectus.', 53898.9, 2),
('Electrical Engineer', 'In quis justo.', 52850.8, 5);

--Agrega datos a Empleado
insert into empleado (nombre, apellidos, fecha_nacimiento, direccion, fecha_alta, fecha_baja, salario, departamento, puesto) values 
('Hernando', 'Georgeou', '1981-10-07 16:10:03', '353 Duke Alley', '2020-10-05 03:55:07', '2020-09-25 16:09:42', 1, 1, 1),
('Demetri', 'Bernaldo', '2000-04-12 17:31:56', '5 Jenna Alley', '2022-08-28 07:05:51', '2022-08-14 00:47:36', 1, 2, 2),
('Joann', 'Backshill', '1972-12-19 10:40:15', '02656 Onsgard Avenue', '2020-01-26 18:44:46', '2020-03-15 13:55:23', 1, 2, 3),
('Helaine', 'Leavens', '1992-03-18 10:03:53', '40584 Darwin Lane', '2021-02-11 15:20:27', '2023-02-21 00:17:34', 1, 5, 4),
('Tammy', 'Lehrle', '2004-05-20 23:57:03', '2 Green Ridge Drive', '2023-08-03 05:06:55', '2021-11-07 02:24:19', 1, 4, 5),
('Tammy', 'Blazic', '2001-05-22 18:07:03', '41938 Homewood Center', '2022-11-07 02:51:30', '2020-07-02 21:27:32', 1, 5, 6),
('Lanette', 'Apple', '1971-08-18 09:20:46', '1 6th Alley', '2022-06-18 11:41:02', '2021-11-01 02:56:59', 1, 1, 7),
('Bailey', 'Oakshott', '1977-10-29 14:59:53', '2973 Di Loreto Place', '2022-09-22 00:31:00', '2022-09-09 18:58:20', 1, 1, 8),
('Shirlene', 'Blucher', '2000-02-26 20:17:34', '76 Loomis Junction', '2020-11-08 06:26:30', '2022-09-17 13:25:55', 1, 3, 9),
('Jerry', 'Longbone', '1982-12-07 06:30:09', '75980 Bluestem Drive', '2022-08-03 20:48:19', '2022-01-28 08:27:26', 1, 1, 10),
('Sheilakathryn', 'Smeeton', '2003-06-13 00:10:35', '125 Grim Drive', '2020-07-01 09:12:47', '2023-04-08 05:17:43', 1, 1, 11),
('Sadye', 'Ashton', '1984-02-27 05:17:06', '0889 Gerald Street', '2022-06-18 05:31:37', '2022-11-16 08:46:45', 1, 2, 12),
('Felicle', 'Kinge', '1988-06-03 13:29:41', '1 Burrows Drive', '2022-11-30 13:37:48', '2022-07-18 16:49:25', 1, 3, 13),
('Janet', 'Golda', '1989-02-27 14:59:58', '9665 Maywood Junction', '2022-01-23 15:19:22', '2020-04-25 13:16:48', 1, 5, 14),
('Cort', 'Mordey', '2001-09-30 03:25:09', '14072 Forster Crossing', '2020-07-01 06:06:00', '2021-05-03 06:55:42', 1, 4, 15),
('Vanny', 'Stimpson', '1978-07-02 08:49:40', '49 Village Way', '2022-12-25 08:58:20', '2022-12-27 07:50:41', 1, 3, 16),
('Barnebas', 'Rubinowitch', '1976-02-08 06:00:32', '016 Mandrake Park', '2021-04-25 02:50:25', '2022-08-23 01:00:44', 1, 4, 17),
('Vi', 'Mundford', '1990-04-01 07:50:36', '39 Westport Way', '2022-12-17 00:59:57', '2020-10-17 15:57:17', 1, 5, 18),
('Justen', 'Viles', '1989-05-31 05:34:32', '622 Boyd Junction', '2021-07-22 13:02:04', '2021-10-02 06:20:07', 1, 2, 19),
('Florian', 'Andreazzi', '1985-07-06 17:17:34', '18247 Westend Crossing', '2022-02-04 03:45:24', '2020-04-28 12:01:01', 1, 3, 20),
('Jae', 'Crittal', '1987-01-23 03:26:34', '808 John Wall Drive', '2020-02-01 16:27:19', '2022-03-01 00:54:15', 1, 5, 21),
('Reynold', 'Bryant', '1978-12-31 23:28:58', '424 Washington Drive', '2021-10-07 12:31:54', '2022-02-04 22:48:10', 1, 3, 22),
('Lou', 'Castro', '1977-08-30 17:01:48', '39394 Ridgeway Alley', '2020-02-15 21:50:21', '2020-02-12 15:57:23', 1, 4, 23),
('Star', 'Klug', '1999-04-30 06:45:11', '688 Pankratz Terrace', '2022-10-19 01:26:05', '2021-12-12 14:35:09', 1, 2, 24),
('Barde', 'Shawyer', '1979-11-19 09:42:39', '63 Portage Way', '2020-08-20 13:52:27', '2020-07-26 10:16:40', 1, 2, 25),
('Madeline', 'Ranby', '2001-01-03 23:37:51', '3 Eagle Crest Park', '2022-10-01 09:08:06', '2022-02-08 12:48:40', 1, 1, 26),
('Prince', 'Mularkey', '1972-11-23 06:14:15', '60 Lukken Trail', '2022-06-22 12:55:43', '2021-04-14 03:28:58', 1, 1, 27),
('Ferne', 'Massei', '1976-09-23 23:28:08', '54 Jana Parkway', '2021-08-06 08:18:55', '2021-02-20 20:03:21', 1, 5, 28),
('Jerrylee', 'Korfmann', '2005-02-27 06:15:02', '3965 Gale Crossing', '2020-12-27 19:17:37', '2023-08-17 18:58:55', 1, 2, 29),
('Rhetta', 'Wegman', '2001-06-03 09:06:13', '4918 5th Place', '2023-01-20 00:25:42', '2023-08-01 22:58:40', 1, 5, 30),
('Spence', 'Dranfield', '1993-05-19 23:21:17', '56887 Lien Court', '2021-05-06 03:50:20', '2022-05-24 07:47:16', 1, 5, 31),
('Mortimer', 'Latey', '1986-02-12 23:35:18', '703 Sutherland Hill', '2022-11-14 04:26:54', '2020-01-07 10:37:51', 1, 4, 32),
('Mallissa', 'Huntingdon', '1988-05-09 13:01:58', '0691 Novick Parkway', '2020-08-19 20:15:38', '2020-10-23 19:49:28', 1, 5, 33),
('Genevieve', 'Franzini', '1997-12-15 22:29:15', '2896 South Crossing', '2020-01-02 17:20:07', '2023-08-25 02:31:57', 1, 3, 34),
('Carlo', 'Dur', '1980-07-04 06:54:54', '86 Twin Pines Court', '2022-10-24 14:24:31', '2022-01-06 02:23:06', 1, 1, 35),
('Eldon', 'Grosier', '1981-08-15 08:39:48', '623 Surrey Alley', '2022-02-18 02:23:31', '2020-03-16 12:04:44', 1, 3, 36),
('Reynolds', 'Daniau', '1980-05-09 11:13:56', '701 Namekagon Lane', '2023-06-13 23:35:06', '2020-07-10 18:48:47', 1, 2, 37),
('Libbie', 'Galea', '2003-10-10 21:50:18', '78 Forster Court', '2020-01-11 22:29:39', '2020-03-03 06:31:05', 1, 5, 38),
('Hester', 'Biasioni', '1992-03-08 06:54:21', '018 Sycamore Center', '2023-07-18 22:42:34', '2021-08-04 08:50:46', 1, 3, 39),
('Christyna', 'Maxwaile', '1975-12-18 18:32:53', '57131 Sherman Plaza', '2022-09-05 19:44:30', '2022-09-07 07:42:21', 1, 1, 40),
('Ben', 'deKnevet', '1983-01-10 04:06:25', '78853 Garrison Parkway', '2021-02-15 03:27:56', '2020-07-24 08:02:35', 1, 1, 41),
('Larine', 'Stuchbury', '2002-09-30 17:22:31', '9494 Cambridge Way', '2021-10-22 00:50:40', '2021-05-11 16:33:14', 1, 2, 42),
('Ernestus', 'Hollingdale', '1992-07-03 13:59:40', '7 Dennis Parkway', '2021-09-19 01:30:17', '2020-04-10 22:25:14', 1, 5, 43),
('Seumas', 'Varnals', '1984-09-12 07:58:50', '5 Garrison Street', '2023-06-19 05:25:34', '2020-06-27 12:48:23', 1, 1, 44),
('Britteny', 'Lawther', '1992-02-26 10:00:11', '545 Waywood Lane', '2021-02-02 01:36:27', '2023-05-12 15:06:04', 1, 3, 45),
('Meg', 'Domenc', '2002-04-12 00:48:11', '582 Corben Court', '2021-02-21 08:42:51', '2022-09-02 17:30:11', 1, 4, 46),
('Lenee', 'Dormon', '1980-01-11 09:09:08', '80 Truax Way', '2021-10-03 10:39:56', '2021-06-07 22:40:35', 1, 2, 47),
('Elyssa', 'Hasel', '1989-08-08 15:07:02', '19 Fulton Road', '2022-08-27 11:14:01', '2021-04-20 10:06:57', 1, 3, 48),
('Stafani', 'Hugnet', '1978-03-30 14:28:39', '7 Haas Point', '2021-08-16 23:03:58', '2020-02-18 15:26:57', 1, 2, 49),
('Fredrick', 'Danilishin', '1974-12-06 12:45:35', '8 Tennyson Center', '2021-11-28 12:13:35', '2022-04-19 04:26:12', 1, 3, 50),
('Hermy', 'Jurges', '1993-05-21 07:20:04', '77664 Sachtjen Court', '2020-05-29 06:18:23', '2023-01-30 23:51:25', 1, 5, 51),
('Catina', 'Pease', '2004-12-15 03:08:11', '274 Atwood Hill', '2022-09-23 03:25:41', '2021-06-17 02:02:43', 1, 1, 52),
('Keary', 'Beagan', '2000-08-31 00:44:10', '5 Mcguire Park', '2021-04-02 12:03:10', '2020-03-06 15:17:17', 1, 5, 53),
('Anjanette', 'Gimbrett', '1985-01-13 03:46:21', '78 Heffernan Park', '2020-08-08 07:02:14', '2023-06-24 23:50:36', 1, 1, 54),
('Court', 'Simenon', '1982-07-28 06:19:14', '4 Norway Maple Lane', '2020-11-23 15:52:13', '2022-10-13 16:25:57', 1, 4, 55),
('Ami', 'Stutard', '2003-07-04 06:32:25', '24699 Oak Valley Court', '2023-08-29 22:46:17', '2020-01-02 06:05:03', 1, 4, 56),
('Carrol', 'Narraway', '1970-09-26 15:25:23', '8 Stephen Park', '2020-03-14 08:12:17', '2021-12-19 03:33:22', 1, 1, 57),
('Dore', 'Beccera', '1997-02-20 03:50:53', '71 Londonderry Drive', '2020-03-05 13:13:13', '2020-05-14 09:46:34', 1, 1, 58),
('Bevon', 'Grzelczyk', '1986-01-27 11:26:09', '8391 Vermont Street', '2023-07-31 14:25:04', '2020-10-25 12:45:57', 1, 1, 59),
('Cyrill', 'Tipple', '2003-01-06 02:47:27', '1 West Plaza', '2022-09-06 21:40:14', '2020-05-21 09:25:15', 1, 5, 60);

--Agrega datos a Proyecto
insert into proyecto (descripcion, fecha_inicio, fecha_fin, presupuesto, departamento) values 
('Vestibulum ante ipsum primis in .', '2020-09-11 12:38:01', '2023-06-18 13:37:07', 171524.36, 1),
('Praesent blandit lacinia erat.', '2021-06-22 07:55:07', '2024-05-15 23:14:47', 41174.84, 1),
('Quisque id justo sit amet sapien dignilum.', '2020-03-29 17:02:09', '2020-04-16 10:34:11', 156831.89, 1),
('Etiam pretium iaculis justo.', '2023-07-01 12:52:30', '2022-11-17 01:55:04', 169021.01, 2),
('Etiam pretium iaculis justo.', '2021-08-17 03:45:11', '2021-09-09 15:25:17', 156863.54, 4),
('Pellentesque ultrices mattis odio.', '2022-12-04 07:04:50', '2022-11-10 22:31:48', 108774.28, 1),
('Nullam varius.', '2020-04-02 05:36:15', '2021-07-29 17:17:49', 42609.32, 3),
('In hac habitasse platea dictumst.', '2021-08-08 01:57:53', '2023-09-22 17:23:40', 157802.18, 2),
('Aenean lectus.', '2021-08-05 04:21:07', '2021-11-24 14:33:23', 196153.96, 4),
('Nam dui.', '2020-12-23 13:49:32', '2020-05-06 03:30:56', 73314.28, 5),
('Morbi sem mauris, laoreet nar sed, nisl.', '2021-08-27 20:48:02', '2022-10-07 03:15:56', 144091.67, 5),
('Vestibulum rutrum rutrum neque.', '2022-09-08 17:14:33', '2023-07-18 02:17:13', 111380.4, 4),
('Duis at velit eu est congue elementum.', '2022-09-09 09:04:17', '2023-01-24 23:50:01', 43139.73, 2),
('Phasellus id sapien in sapien iaculis congue.', '2020-11-13 17:06:31', '2024-07-19 16:06:51', 161785.37, 1),
('Etiam vel augue.', '2021-11-29 02:01:05', '2023-04-20 07:50:13', 70836.05, 1),
('Integer non velit.', '2023-03-27 02:48:40', '2024-01-31 19:31:57', 195080.35, 5),
('In congue.', '2022-11-05 13:35:14', '2022-10-17 13:59:24', 158949.1, 1),
('Vestibulum quam sapien, variun, ante.', '2023-04-28 06:25:13', '2021-09-18 21:29:19', 126909.88, 1),
('Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2022-03-20 00:16:33', '2021-01-02 21:38:12', 86403.37, 3),
('Cum sociis natoque penatibus et magnis diur ridiculus mus.', '2022-03-24 12:17:46', '2020-07-12 10:37:59', 191205.93, 1),
('Quisque erat eros, viverra eget, cor rutrum, nulla.', '2020-07-11 08:34:40', '2022-11-19 20:59:21', 179340.68, 5),
('Cras in purus eu magna vulputate luctus.', '2022-09-27 15:11:50', '2020-07-03 08:34:13', 74532.42, 5),
('Morbi ut odio.', '2021-06-13 03:59:57', '2023-03-28 19:09:46', 80573.42, 4),
('Morbi quis tortor id nulla ultrices aliquet.', '2020-10-25 10:18:52', '2022-03-28 00:19:45', 199552.17, 2),
('In sagittis dui vel nisl.', '2022-04-24 08:14:54', '2021-08-25 14:21:33', 146626.4, 4),
('Nullam molestie nibh in lectus.', '2020-02-29 11:53:57', '2023-09-01 13:58:53', 185953.84, 1),
('Vivamus vel nulla eget eros elementum pellentesque.', '2022-05-08 10:41:11', '2022-05-13 18:47:57', 151594.28, 3),
('Praesent lectus.', '2020-03-09 20:06:48', '2024-04-24 11:30:33', 72122.21, 1),
('Morbi non quam nec dui luctus rutrum.', '2020-07-19 03:09:14', '2021-06-14 16:49:02', 82714.4, 4),
('Maecenas tincidunt lacus at velit.', '2020-04-05 14:34:07', '2024-02-27 09:31:25', 46059.72, 5),
('Nulla ut erat id mauris vulputate elementum.', '2020-04-30 02:41:13', '2023-04-16 01:16:18', 134940.52, 3),
('Maecenas ut massa quis augue luctus tincidunt.', '2020-02-05 16:31:43', '2023-10-23 15:49:27', 114124.11, 2),
('Suspendisse accumsan tortor quis turpis.', '2020-10-31 05:39:35', '2023-03-12 16:14:36', 154857.3, 2),
('Praesent lectus.', '2021-02-16 14:11:24', '2023-05-24 18:19:37', 116120.94, 1),
('Vivamus vestibulum sagittis sapien.', '2022-04-21 15:51:20', '2022-07-15 02:40:45', 20201.85, 2),
('Aenean fermentum.', '2022-02-16 12:59:22', '2023-12-04 22:29:17', 117548.48, 5),
('Nulla justo.', '2022-06-11 11:13:44', '2024-02-06 03:38:07', 68867.51, 4),
('In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2020-08-13 12:47:29', '2020-08-31 01:18:20', 61598.71, 2),
('Praesent blandit lacinia erat.', '2022-05-10 22:17:27', '2020-02-29 05:39:28', 34006.37, 2),
('Curabitur convallis.', '2022-02-09 23:55:20', '2022-05-15 21:44:19', 73718.53, 5),
('Aliquam quis turpis eget elit sodales scelerisque.', '2021-12-06 12:50:30', '2021-01-13 22:26:14', 95437.84, 4),
('Mauris lacinia sapien quis libero.', '2023-04-24 00:16:08', '2020-07-30 02:12:31', 80747.2, 3),
('Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2021-02-23 23:25:10', '2022-03-21 09:36:20', 15429.97, 4),
('In eleifend quam a odio.', '2020-12-25 19:40:16', '2020-10-25 13:57:20', 170037.0, 3),
('Nam ultrices, libero non mattis pulvinar, nulla pede ullla.', '2022-05-11 13:46:10', '2020-09-13 05:42:07', 120109.99, 1),
('Vivamus vel nulla eget eros elementum pellentesque.', '2023-02-20 14:48:40', '2022-05-10 22:46:55', 177395.1, 5),
('Vivamus in felis eu sapien cursus vestibulum.', '2020-09-14 12:59:47', '2020-07-20 12:45:58', 188569.29, 1),
('Suspendisse potenti.', '2022-12-28 17:05:26', '2020-02-01 17:39:05', 110026.19, 1),
('In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2021-05-13 10:29:51', '2024-02-11 00:14:24', 57691.05, 3),
('Nulla facilisi.', '2021-07-24 00:16:03', '2023-06-03 07:12:31', 93653.22, 1),
('Donec quis orci eget orci vehicula condimentum.', '2023-01-23 15:40:25', '2020-07-09 16:15:06', 164138.85, 4),
('Etiam faucibus cursus urna.', '2022-10-25 03:10:47', '2023-07-31 19:36:05', 80815.77, 3),
('Mauris ullamcorper purus sit amet nulla.', '2021-12-12 20:53:21', '2021-05-20 05:24:06', 170362.6, 5),
('Nulla ut erat id mauris vulputate elementum.', '2021-12-12 08:33:44', '2021-03-29 19:58:26', 167453.13, 2),
('Etiam justo.', '2021-10-19 20:12:33', '2023-10-23 16:44:58', 97120.43, 5),
('Vestibulum ante ipsum primis in faucibus , Mauris viverra diam vitae quam.', '2020-11-25 09:59:24', '2022-03-25 21:57:07', 173402.22, 4),
('Maecenas tristique, est et tempus magna, ac consequat metus sapien ut nunc.', '2022-10-16 02:00:01', '2022-04-27 20:07:04', 17427.29, 2),
('Proin at turpis a pede posuere nonummy.', '2023-03-20 10:46:42', '2022-11-25 10:51:32', 172363.2, 2),
('Vestibulum ante ipsum primis in  Duis faucibus accumsan odio.', '2020-07-21 02:46:08', '2023-10-05 18:20:04', 54752.83, 4),
('Nulla tellus.', '2020-08-03 06:56:21', '2020-02-02 06:58:49', 43907.84, 4);

--Agrega datos a EmpleadoProyecto
insert into empleadoproyecto (empleado, proyecto) values
(1, 1),(7, 2),(8, 3),(10, 6),(11, 14),(26, 15),(27, 17),(35, 18),(40, 20),(41, 26),
(44, 28),(52, 34),(54, 45),(57, 47),(58, 48),(59, 50),(2, 4),(3, 8),(12, 13),(19, 24),
(24, 32),(25, 33),(29, 35),(37, 38),(42, 39),(47, 54),(49, 57),(49, 58),(9, 7),(13, 19),
(16, 27),(20, 31),(22, 42),(34, 44),(36, 49),(39, 52),(45, 7),(48, 19),(50, 27),(5, 5),
(15, 9),(17, 12),(23, 23),(32, 25),(46, 29),(55, 37),(56, 41),(17, 43),(2, 51),(32, 56),
(55, 59),(56, 60),(4, 10),(6, 11),(14, 16),(18, 21),(21, 22),(28, 30),(30, 36),(31, 40),
(33, 46),(38, 53),(43, 55),(51, 11),(53, 30),(60, 36);

--Restriciones ON DELETE CASCADE 
--Relacion EmpleadoProyecto y Empleado
ALTER TABLE `EmpleadoProyecto` ADD CONSTRAINT `fk_empleado` FOREIGN KEY (`empleado`) REFERENCES `Empleado`(`id`) ON DELETE CASCADE;

--Relacion EmpleadoProyecto y Proyecto
ALTER TABLE `EmpleadoProyecto` ADD CONSTRAINT `fk_proyecto` FOREIGN KEY (`proyecto`) REFERENCES `Proyecto`(`id`) ON DELETE CASCADE;

--Restricciones ON DELETE RESTRICT
--Relacion Puesto y Departamento
ALTER TABLE `Puesto` ADD CONSTRAINT `fk_departamento` FOREIGN KEY (`departamento`) REFERENCES `Departamento`(`id`) ON DELETE RESTRICT;
