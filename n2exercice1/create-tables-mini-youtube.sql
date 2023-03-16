-- Thu Mar 16 13:08:13 2023
-- Model: mini youtube    Version: 1.0


-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `youtube` ;


-- -----------------------------------------------------
-- Table `youtube`.`canales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`canales` (
  `id_canal` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripción` VARCHAR(200) NULL,
  `fecha_creación` DATETIME NOT NULL,
  PRIMARY KEY (`id_canal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`usuarios` (
  `id_usuario` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `país` VARCHAR(45) NOT NULL,
  `cp` VARCHAR(45) NOT NULL,
  `fk_canal` INT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuarios_canales1_idx` (`fk_canal` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_canales1`
    FOREIGN KEY (`fk_canal`)
    REFERENCES `youtube`.`canales` (`id_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`videos` (
  `id_video` INT NOT NULL,
  `título` VARCHAR(45) NOT NULL,
  `descripción` VARCHAR(200) NULL,
  `tamaño` FLOAT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `duración` TIME NOT NULL,
  `thumbnail` BLOB NULL,
  `reproducciones` INT NOT NULL,
  `likes` INT NOT NULL,
  `dislikes` INT NOT NULL,
  `fecha_publicación` DATETIME NOT NULL,
  `fk_usuario` INT NOT NULL,
  PRIMARY KEY (`id_video`),
  INDEX `fk_videos_usuarios_idx` (`fk_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_videos_usuarios`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `youtube`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`etiquetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`etiquetas` (
  `id_etiqueta` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_etiqueta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video_etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video_etiqueta` (
  `etiquetas_id_etiqueta` INT NOT NULL,
  `videos_id_video` INT NOT NULL,
  PRIMARY KEY (`etiquetas_id_etiqueta`, `videos_id_video`),
  INDEX `fk_etiquetas_has_videos_videos1_idx` (`videos_id_video` ASC) VISIBLE,
  INDEX `fk_etiquetas_has_videos_etiquetas1_idx` (`etiquetas_id_etiqueta` ASC) VISIBLE,
  CONSTRAINT `fk_etiquetas_has_videos_etiquetas1`
    FOREIGN KEY (`etiquetas_id_etiqueta`)
    REFERENCES `youtube`.`etiquetas` (`id_etiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_etiquetas_has_videos_videos1`
    FOREIGN KEY (`videos_id_video`)
    REFERENCES `youtube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`suscripciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`suscripciones` (
  `usuarios_id_usuario` INT NOT NULL,
  `videos_id_video` INT NOT NULL,
  `valoración` ENUM('LIKE', 'DISLIKE') NULL,
  `fecha_suscripción` DATETIME NOT NULL,
  `fecha_valoración` DATETIME NULL,
  PRIMARY KEY (`usuarios_id_usuario`, `videos_id_video`),
  INDEX `fk_usuarios_has_videos_videos1_idx` (`videos_id_video` ASC) VISIBLE,
  INDEX `fk_usuarios_has_videos_usuarios1_idx` (`usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_videos_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `youtube`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_videos_videos1`
    FOREIGN KEY (`videos_id_video`)
    REFERENCES `youtube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`lista_reproducción`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`lista_reproducción` (
  `id_lista` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_creación` DATETIME NOT NULL,
  `es_privada` TINYINT NOT NULL,
  `fk_usuario` INT NOT NULL,
  PRIMARY KEY (`id_lista`),
  INDEX `fk_lista_reproducción_usuarios1_idx` (`fk_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_lista_reproducción_usuarios1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `youtube`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`lista_reproducción_has_videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`lista_reproducción_has_videos` (
  `lista_reproducción_id_lista` INT NOT NULL,
  `videos_id_video` INT NOT NULL,
  PRIMARY KEY (`lista_reproducción_id_lista`, `videos_id_video`),
  INDEX `fk_lista_reproducción_has_videos_videos1_idx` (`videos_id_video` ASC) VISIBLE,
  INDEX `fk_lista_reproducción_has_videos_lista_reproducción1_idx` (`lista_reproducción_id_lista` ASC) VISIBLE,
  CONSTRAINT `fk_lista_reproducción_has_videos_lista_reproducción1`
    FOREIGN KEY (`lista_reproducción_id_lista`)
    REFERENCES `youtube`.`lista_reproducción` (`id_lista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_reproducción_has_videos_videos1`
    FOREIGN KEY (`videos_id_video`)
    REFERENCES `youtube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comentarios` (
  `fk_usuario` INT NOT NULL,
  `fk_video` INT NOT NULL,
  `comentario` TEXT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`fk_usuario`, `fk_video`),
  INDEX `fk_usuarios_has_videos_videos2_idx` (`fk_video` ASC) VISIBLE,
  INDEX `fk_usuarios_has_videos_usuarios2_idx` (`fk_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_videos_usuarios2`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `youtube`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_videos_videos2`
    FOREIGN KEY (`fk_video`)
    REFERENCES `youtube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`usuarios_valoración_comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`usuarios_valoración_comentarios` (
  `usuarios_id_usuario` INT NOT NULL,
  `comentarios_fk_usuario` INT NOT NULL,
  `comentarios_fk_video` INT NOT NULL,
  `valoración` ENUM('like', 'dislike') NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`usuarios_id_usuario`, `comentarios_fk_usuario`, `comentarios_fk_video`),
  INDEX `fk_usuarios_has_comentarios_comentarios1_idx` (`comentarios_fk_usuario` ASC, `comentarios_fk_video` ASC) VISIBLE,
  INDEX `fk_usuarios_has_comentarios_usuarios1_idx` (`usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_comentarios_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `youtube`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_comentarios_comentarios1`
    FOREIGN KEY (`comentarios_fk_usuario` , `comentarios_fk_video`)
    REFERENCES `youtube`.`comentarios` (`fk_usuario` , `fk_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

