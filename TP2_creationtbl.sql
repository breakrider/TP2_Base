-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Tp2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Tp2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tp2` DEFAULT CHARACTER SET latin1 ;
USE `Tp2` ;

-- -----------------------------------------------------
-- Table `Tp2`.`tbl_fabricant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_fabricant` (
  `pk_id_fabricant` INT(11) NOT NULL,
  `nom_fabricant` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_id_fabricant`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Tp2`.`tbl_poste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_poste` (
  `pk_id_poste` INT NOT NULL,
  `fk_id_fabricant` INT NOT NULL,
  `desc_poste` VARCHAR(45) NULL,
  `desc_processeur` VARCHAR(45) NULL,
  `nb_ram_mo` VARCHAR(45) NULL,
  `tail_disque_giga` INT NULL,
  PRIMARY KEY (`pk_id_poste`),
  INDEX `fk_tbl_poste_tbl_fabricant1_idx` (`fk_id_fabricant` ASC),
  CONSTRAINT `fk_id_fabricant`
    FOREIGN KEY (`fk_id_fabricant`)
    REFERENCES `Tp2`.`tbl_fabricant` (`pk_id_fabricant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tp2`.`tbl_peripherique`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_peripherique` (
  `pk_id_peripherique` INT NOT NULL,
  `nom_peripherique` VARCHAR(45) NOT NULL,
  `fk_id_poste` INT NOT NULL,
  `fk_id_fabricant` INT NOT NULL,
  PRIMARY KEY (`pk_id_peripherique`),
  INDEX `fk_tbl_peripherique_tbl_fabricant1_idx` (`fk_id_fabricant` ASC),
  INDEX `fk_tbl_peripherique_tbl_poste1_idx` (`fk_id_poste` ASC),
  CONSTRAINT `fk_id_poste1`
    FOREIGN KEY (`fk_id_poste`)
    REFERENCES `Tp2`.`tbl_poste` (`pk_id_poste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_fabricant1`
    FOREIGN KEY (`fk_id_fabricant`)
    REFERENCES `Tp2`.`tbl_fabricant` (`pk_id_fabricant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tp2`.`tbl_editeur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_editeur` (
  `pk_id_editeur` INT NOT NULL,
  `nom_editeur` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pk_id_editeur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tp2`.`tbl_logiciel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_logiciel` (
  `pk_id_logiciel` INT NOT NULL,
  `nom_logiciel` VARCHAR(45) NOT NULL,
  `nb_licence` INT NULL,
  `fk_id_editeur` INT NOT NULL,
  PRIMARY KEY (`pk_id_logiciel`),
  INDEX `fkt_bl_logiciel_tbl_editeur1_idx` (`fk_id_editeur` ASC),
  CONSTRAINT `fk_tbl_logiciel_1`
    FOREIGN KEY (`fk_id_editeur`)
    REFERENCES `Tp2`.`tbl_editeur` (`pk_id_editeur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tp2`.`tbl_poste_has_tbl_logiciel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_poste_has_tbl_logiciel` (
  `fk_tbl_poste_id_poste` INT NOT NULL,
  `fk_tbl_logiciel_id_logiciel` INT NOT NULL,
  INDEX `fk_tbl_poste_has_tbl_logiciel_tbl_poste1_idx` (`fk_tbl_poste_id_poste` ASC),
  INDEX `fk_tbl_poste_has_tbl_logiciel_tbl_logiciel1_idx` (`fk_tbl_logiciel_id_logiciel` ASC),
  PRIMARY KEY (`fk_tbl_poste_id_poste`, `fk_tbl_logiciel_id_logiciel`),
  CONSTRAINT `fk_tbl_poste_id_poste_1`
    FOREIGN KEY (`fk_tbl_poste_id_poste`)
    REFERENCES `Tp2`.`tbl_poste` (`pk_id_poste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_logiciel_id_logiciel_1`
    FOREIGN KEY (`fk_tbl_logiciel_id_logiciel`)
    REFERENCES `Tp2`.`tbl_logiciel` (`pk_id_logiciel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tp2`.`tbl_local`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_local` (
  `pk_id_local` INT NOT NULL,
  `nom_local` VARCHAR(45) NULL,
  PRIMARY KEY (`pk_id_local`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tp2`.`tbl_usager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_usager` (
  `pk_id_usager` INT NOT NULL,
  `nom_usager` VARCHAR(45) NULL,
  `prenom_usager` VARCHAR(45) NULL,
  `telephone_usager` INT NULL,
  `fk_tbl_local_id_local` INT NOT NULL,
  PRIMARY KEY (`pk_id_usager`),
  INDEX `fk_tbl_usager_tbl_local1_idx` (`fk_tbl_local_id_local` ASC),
  CONSTRAINT `fk_tbl_local_id_local1`
    FOREIGN KEY (`fk_tbl_local_id_local`)
    REFERENCES `Tp2`.`tbl_local` (`pk_id_local`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tp2`.`tbl_poste_has_tbl_usager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tp2`.`tbl_poste_has_tbl_usager` (
  `fk_tbl_poste_id_poste` INT NOT NULL,
  `fk_tbl_usager_id_usager` INT NOT NULL,
  PRIMARY KEY (`fk_tbl_poste_id_poste`, `fk_tbl_usager_id_usager`),
  INDEX `fk_tbl_poste_has_tbl_usager_tbl_usager_id_usager1_idx` (`fk_tbl_usager_id_usager` ASC),
  INDEX `fk_tbl_poste_has_tbl_usager_tbl_poste_id_poste1_idx` (`fk_tbl_poste_id_poste` ASC),
  CONSTRAINT `fk_tbl_poste_id_poste1`
    FOREIGN KEY (`fk_tbl_poste_id_poste`)
    REFERENCES `Tp2`.`tbl_poste` (`pk_id_poste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_usager_id_usager1`
    FOREIGN KEY (`fk_tbl_usager_id_usager`)
    REFERENCES `Tp2`.`tbl_usager` (`pk_id_usager`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
