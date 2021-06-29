-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hospital_dbms
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hospital_dbms` ;

-- -----------------------------------------------------
-- Schema hospital_dbms
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital_dbms` DEFAULT CHARACTER SET latin1 ;
USE `hospital_dbms` ;

-- -----------------------------------------------------
-- Table `hospital_dbms`.`pharmacy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital_dbms`.`pharmacy` ;

CREATE TABLE IF NOT EXISTS `hospital_dbms`.`pharmacy` (
  `Patient_Id` INT(11) NOT NULL,
  `Drugs_Dispensed` VARCHAR(500) NULL DEFAULT NULL,
  `Drug_Bills` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Patient_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hospital_dbms`.`account_office`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital_dbms`.`account_office` ;

CREATE TABLE IF NOT EXISTS `hospital_dbms`.`account_office` (
  `Patient_Id` INT(11) NOT NULL,
  `Mode_of_Payment` VARCHAR(45) NULL DEFAULT NULL,
  `Payment_reference` VARCHAR(45) NULL DEFAULT NULL,
  `Amount Paid` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Patient_Id`),
  CONSTRAINT `fk_account_office_pharmacy1`
    FOREIGN KEY (`Patient_Id`)
    REFERENCES `hospital_dbms`.`pharmacy` (`Patient_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hospital_dbms`.`consultancy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital_dbms`.`consultancy` ;

CREATE TABLE IF NOT EXISTS `hospital_dbms`.`consultancy` (
  `Patient_Id` INT(11) NOT NULL,
  `Patient_Report` LONGTEXT NULL DEFAULT NULL,
  `Doctor's_Diagnose` LONGTEXT NULL DEFAULT NULL,
  `Doctor's_Prescription` LONGTEXT NULL DEFAULT NULL,
  `Lab_Results` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Patient_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hospital_dbms`.`triage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital_dbms`.`triage` ;

CREATE TABLE IF NOT EXISTS `hospital_dbms`.`triage` (
  `Patient_Id` INT(11) NOT NULL,
  `Temperature` VARCHAR(10) NULL DEFAULT NULL,
  `Blood_Pressure` VARCHAR(10) NULL DEFAULT NULL,
  `Weight` VARCHAR(10) NULL DEFAULT NULL,
  `Height` VARCHAR(10) NULL DEFAULT NULL,
  `Sugar_Level` VARCHAR(10) NULL DEFAULT NULL,
  `Oxygen_Level` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`Patient_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hospital_dbms`.`records`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital_dbms`.`records` ;

CREATE TABLE IF NOT EXISTS `hospital_dbms`.`records` (
  `Patient_Id` INT(11) NOT NULL,
  `Name` VARCHAR(100) NULL DEFAULT NULL,
  `Date_of_Birth` DATE NULL DEFAULT NULL,
  `Location` VARCHAR(200) NULL DEFAULT NULL,
  `Occupation` VARCHAR(100) NULL DEFAULT NULL,
  `Marital_Status` VARCHAR(45) NULL DEFAULT NULL,
  `Parity` INT(11) NULL DEFAULT NULL,
  `National_Health_Id` VARCHAR(45) NULL DEFAULT NULL,
  `Emergency_Contact` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Patient_Id`),
  CONSTRAINT `fk_records_triage`
    FOREIGN KEY (`Patient_Id`)
    REFERENCES `hospital_dbms`.`triage` (`Patient_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_records_consultancy1`
    FOREIGN KEY (`Patient_Id`)
    REFERENCES `hospital_dbms`.`consultancy` (`Patient_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_records_pharmacy1`
    FOREIGN KEY (`Patient_Id`)
    REFERENCES `hospital_dbms`.`pharmacy` (`Patient_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hospital_dbms`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital_dbms`.`status` ;

CREATE TABLE IF NOT EXISTS `hospital_dbms`.`status` (
  `Patient_Id` INT(11) NOT NULL,
  `Doctor_Id` INT(11) NULL DEFAULT NULL,
  `Admitted` VARCHAR(45) NULL DEFAULT NULL,
  `Referred` VARCHAR(45) NULL DEFAULT NULL,
  `Discharged` VARCHAR(45) NULL DEFAULT NULL,
  `Dead` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Patient_Id`),
  CONSTRAINT `fk_status_consultancy1`
    FOREIGN KEY (`Patient_Id`)
    REFERENCES `hospital_dbms`.`consultancy` (`Patient_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
