CREATE TABLE `Autor` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(50) NOT NULL,
	`correoElectronico` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Categoria` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Etiqueta` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Contenido` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`titulo` varchar(50) NOT NULL,
	`texto` TEXT NOT NULL,
	`fechaPublicacion` DATE NOT NULL,
	`autor` INT NOT NULL,
	`categoria` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ContenidoEtiqueta` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`contenido` INT NOT NULL,
	`etiqueta` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Contenido` ADD CONSTRAINT `Contenido_fk0` FOREIGN KEY (`autor`) REFERENCES `Autor`(`id`);

ALTER TABLE `Contenido` ADD CONSTRAINT `Contenido_fk1` FOREIGN KEY (`categoria`) REFERENCES `Categoria`(`id`);

ALTER TABLE `ContenidoEtiqueta` ADD CONSTRAINT `ContenidoEtiqueta_fk0` FOREIGN KEY (`contenido`) REFERENCES `Contenido`(`id`);

ALTER TABLE `ContenidoEtiqueta` ADD CONSTRAINT `ContenidoEtiqueta_fk1` FOREIGN KEY (`etiqueta`) REFERENCES `Etiqueta`(`id`);






