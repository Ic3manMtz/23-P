CREATE TABLE `Producto` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(50) NOT NULL,
	`descripcion` TEXT NOT NULL,
	`precio` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Orden` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`fecha` DATETIME NOT NULL,
	`mesa` INT NOT NULL,
	`total` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `OrdenProducto` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`producto` INT NOT NULL,
	`orden` INT NOT NULL,
	`cantidad` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `OrdenProducto` ADD CONSTRAINT `OrdenProducto_fk0` FOREIGN KEY (`producto`) REFERENCES `Producto`(`id`);

ALTER TABLE `OrdenProducto` ADD CONSTRAINT `OrdenProducto_fk1` FOREIGN KEY (`orden`) REFERENCES `Orden`(`id`);




