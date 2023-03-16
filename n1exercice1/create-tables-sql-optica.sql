-- Tue Mar 14 22:09:49 2023
-- Model: Óptica    Version: 1.0


-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`direcciones` (
  `id_direccion` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(60) NOT NULL,
  `numero` VARCHAR(6) NOT NULL,
  `piso` VARCHAR(6) NULL,
  `puerta` VARCHAR(6) NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `cp` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_direccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveedores` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `nif` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion_id` INT NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  INDEX `fk_proveedor_direccion_idx` (`direccion_id` ASC) VISIBLE,
  CONSTRAINT `fk_proveedor_direccion`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `optica`.`direcciones` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marcas` (
  `id_marca` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `proveedor_id` INT NULL,
  PRIMARY KEY (`id_marca`),
  INDEX `fk_marcas_proveedores_idx` (`proveedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_marcas_proveedores`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `optica`.`proveedores` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`gafas` (
  `id_gafas` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(45) NOT NULL,
  `montura` ENUM("flotante", "pasta", "metalica") NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_cristales` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `graduacion_izq` VARCHAR(45) NOT NULL,
  `graduacion_der` VARCHAR(45) NOT NULL,
  `marca_id` INT NOT NULL,
  PRIMARY KEY (`id_gafas`),
  INDEX `fk_gafas_marcas_idx` (`marca_id` ASC) VISIBLE,
  CONSTRAINT `fk_gafas_marcas`
    FOREIGN KEY (`marca_id`)
    REFERENCES `optica`.`marcas` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `fecha_registro` DATETIME NOT NULL,
  `direccion_id` INT NOT NULL,
  `recomendado_por_cliente_id` INT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_clientes_direccion_idx` (`direccion_id` ASC) VISIBLE,
  INDEX `fk_clientes_clientes_idx` (`recomendado_por_cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_direccion`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `optica`.`direcciones` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_clientes`
    FOREIGN KEY (`recomendado_por_cliente_id`)
    REFERENCES `optica`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `empleado_id` INT NOT NULL,
  `gafas_id` INT NOT NULL,
  `fecha_pedido` DATE NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedidos_clientes_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_pedidos_empleado_idx` (`empleado_id` ASC) VISIBLE,
  INDEX `fk_pedidos_gafas_idx` (`gafas_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_clientes`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `optica`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_empleado`
    FOREIGN KEY (`empleado_id`)
    REFERENCES `optica`.`empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_gafas`
    FOREIGN KEY (`gafas_id`)
    REFERENCES `optica`.`gafas` (`id_gafas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

