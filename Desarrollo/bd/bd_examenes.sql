-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb_examen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb_examen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb_examen` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci ;
-- -----------------------------------------------------
-- Schema bd_crud
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_crud
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb_examen` ;

-- -----------------------------------------------------
-- Table `mydb_examen`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_examen`.`categorias` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(255) NULL,
  `titulo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_examen`.`examenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_examen`.`examenes` (
  `idexamen` INT NOT NULL,
  `activo` BIGINT(1) NOT NULL,
  `descripcion` VARCHAR(255) NULL,
  `numeroPreguntas` VARCHAR(45) NULL,
  `puntosMaximos` VARCHAR(45) NULL,
  `titulo` VARCHAR(100) NULL,
  `categoria_idcategoria` INT NULL,
  PRIMARY KEY (`idexamen`),
  INDEX `categoria_idcategoria_idx` (`categoria_idcategoria` ASC) VISIBLE,
  CONSTRAINT `categoria_idcategoria`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `mydb_examen`.`categorias` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb_examen`.`preguntas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_examen`.`preguntas` (
  `idpreguntas` INT NOT NULL,
  `contenido` VARCHAR(5000) NULL,
  `imagen` VARCHAR(255) NULL,
  `opcion1` VARCHAR(255) NULL,
  `opcion2` VARCHAR(255) NULL,
  `opcion3` VARCHAR(255) NULL,
  `opcion4` VARCHAR(255) NULL,
  `respuesta` VARCHAR(255) NULL,
  `examen_idexamen` INT NULL,
  PRIMARY KEY (`idpreguntas`),
  INDEX `examen_idexamen_idx` (`examen_idexamen` ASC) VISIBLE,
  CONSTRAINT `examen_idexamen`
    FOREIGN KEY (`examen_idexamen`)
    REFERENCES `mydb_examen`.`examenes` (`idexamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `bd_crud` ;

-- -----------------------------------------------------
-- Table `bd_crud`.`estudiantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_crud`.`estudiantes` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK_ks74get5br3cnt3bugfama4b4` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
