-- MySQL Script generated by MySQL Workbench
-- seg 18 out 2021 07:27:38
-- Model: GClinic    Version: 0.1

-- Modelagem do banco de dados GClinic.

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projectmanager
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `projectmanager` ;

-- -----------------------------------------------------
-- Schema projectmanager
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projectmanager` ;
USE `projectmanager` ;

-- -----------------------------------------------------
-- Table `projectmanager`.`Projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectmanager`.`Projects` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projectmanager`.`Activities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectmanager`.`Activities` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_project` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `finished` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_Activities_to_Projects` (`id_project` ASC),
  CONSTRAINT `fk_Activities_to_Projects`
    FOREIGN KEY (`id_project`)
    REFERENCES `projectmanager`.`Projects` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
