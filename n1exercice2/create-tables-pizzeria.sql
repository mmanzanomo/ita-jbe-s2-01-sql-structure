-- Thu Mar 16 00:40:09 2023
-- Model: pizzeria    Version: 1.0


-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `pizzeria` ;


-- -----------------------------------------------------
-- Table `pizzeria`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`provincias` (
  `id_provincia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`localidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`localidades` (
  `id_localidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fk_provincias` INT NOT NULL,
  PRIMARY KEY (`id_localidad`),
  INDEX `fk_localidades_provincias1_idx` (`fk_provincias` ASC) VISIBLE,
  CONSTRAINT `fk_localidades_provincias1`
    FOREIGN KEY (`fk_provincias`)
    REFERENCES `pizzeria`.`provincias` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`direcciones` (
  `id_direccion` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NOT NULL,
  `cp` VARCHAR(45) NOT NULL,
  `fk_localidades` INT NOT NULL,
  PRIMARY KEY (`id_direccion`),
  INDEX `fk_direcciones_localidades1_idx` (`fk_localidades` ASC) VISIBLE,
  CONSTRAINT `fk_direcciones_localidades1`
    FOREIGN KEY (`fk_localidades`)
    REFERENCES `pizzeria`.`localidades` (`id_localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`establecimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`establecimientos` (
  `id_establecimiento` INT NOT NULL AUTO_INCREMENT,
  `fk_direcciones` INT NOT NULL,
  PRIMARY KEY (`id_establecimiento`),
  INDEX `fk_establecimientos_direcciones1_idx` (`fk_direcciones` ASC) VISIBLE,
  CONSTRAINT `fk_establecimientos_direcciones1`
    FOREIGN KEY (`fk_direcciones`)
    REFERENCES `pizzeria`.`direcciones` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(9) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `es_repartidor` TINYINT NULL,
  `fk_establecimientos` INT NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `fk_empleados_establecimientos_idx` (`fk_establecimientos` ASC) VISIBLE,
  CONSTRAINT `fk_empleados_establecimientos`
    FOREIGN KEY (`fk_establecimientos`)
    REFERENCES `pizzeria`.`establecimientos` (`id_establecimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `telefono` VARCHAR(20) NULL,
  `fk_direcciones` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_clientes_direcciones_idx` (`fk_direcciones` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_direcciones`
    FOREIGN KEY (`fk_direcciones`)
    REFERENCES `pizzeria`.`direcciones` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `fecha_pedido` DATETIME NOT NULL,
  `a_domicilio` TINYINT NOT NULL,
  `precio_total` DOUBLE NOT NULL,
  `n_hamburguesas` INT NOT NULL,
  `n_bebidas` INT NOT NULL,
  `n_pizzas` INT NOT NULL,
  `hora_entrega` DATETIME NULL,
  `fk_clientes` INT NOT NULL,
  `fk_empleado_repartidor` INT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedidos_clientes1_idx` (`fk_clientes` ASC) VISIBLE,
  INDEX `fk_pedidos_empleados1_idx` (`fk_empleado_repartidor` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`fk_clientes`)
    REFERENCES `pizzeria`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_empleados1`
    FOREIGN KEY (`fk_empleado_repartidor`)
    REFERENCES `pizzeria`.`empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categorias` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`productos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `tipo` ENUM("PIZZA", "BEBIDA", "HAMBURGUESA") NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  `imagen` BLOB NOT NULL,
  `precio` DOUBLE NOT NULL,
  `fk_categorias` INT NULL,
  `fk_establecimientos` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_productos_categorias1_idx` (`fk_categorias` ASC) VISIBLE,
  INDEX `fk_productos_establecimientos1_idx` (`fk_establecimientos` ASC) VISIBLE,
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`fk_categorias`)
    REFERENCES `pizzeria`.`categorias` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_establecimientos1`
    FOREIGN KEY (`fk_establecimientos`)
    REFERENCES `pizzeria`.`establecimientos` (`id_establecimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedidos_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`detalle_pedido` (
  `id_detalle_pedido` INT NOT NULL,
  `fk_productos` INT NOT NULL,
  `fk_pedidos` INT NOT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  INDEX `fk_detalle_pedido_pedidos1_idx` (`fk_pedidos` ASC) VISIBLE,
  INDEX `fk_detalle_pedido_productos1_idx` (`fk_productos` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_pedido_productos1`
    FOREIGN KEY (`fk_productos`)
    REFERENCES `pizzeria`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_pedido_pedidos1`
    FOREIGN KEY (`fk_pedidos`)
    REFERENCES `pizzeria`.`pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

