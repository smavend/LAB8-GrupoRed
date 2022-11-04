-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GrupoRed
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GrupoRed
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GrupoRed` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema hr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `GrupoRed` ;

-- -----------------------------------------------------
-- Table `GrupoRed`.`heroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrupoRed`.`heroe` (
  `idHeroe` INT NOT NULL AUTO_INCREMENT,
  `idPareja` INT NULL,
  `nombre` VARCHAR(10) NOT NULL,
  `edad` INT(3) NOT NULL,
  `genero` VARCHAR(1) NOT NULL,
  `clase` VARCHAR(50) NOT NULL,
  `nivelInicial` INT(3) NOT NULL,
  `ataque` INT NOT NULL,
  PRIMARY KEY (`idHeroe`),
  INDEX `fk_heroes_heroes_idx` (`idPareja` ASC) VISIBLE,
  CONSTRAINT `fk_heroes_heroes`
    FOREIGN KEY (`idPareja`)
    REFERENCES `GrupoRed`.`heroe` (`idHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrupoRed`.`objeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrupoRed`.`objeto` (
  `idObjeto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  `efectoUso` VARCHAR(200) NOT NULL,
  `peso` FLOAT NOT NULL,
  PRIMARY KEY (`idObjeto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrupoRed`.`invetarioDeHeroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrupoRed`.`invetarioDeHeroe` (
  `idHeroeObjeto` INT NOT NULL AUTO_INCREMENT,
  `idObjeto` INT NOT NULL,
  `idHeroes` INT NOT NULL,
  INDEX `fk_heroes_has_objetos_objetos1_idx` (`idObjeto` ASC) VISIBLE,
  INDEX `fk_heroes_has_objetos_heroes1_idx` (`idHeroes` ASC) VISIBLE,
  PRIMARY KEY (`idHeroeObjeto`),
  CONSTRAINT `fk_heroes_has_objetos_objetos1`
    FOREIGN KEY (`idObjeto`)
    REFERENCES `GrupoRed`.`objeto` (`idObjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_heroes_has_objetos_heroes1`
    FOREIGN KEY (`idHeroes`)
    REFERENCES `GrupoRed`.`heroe` (`idHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrupoRed`.`clase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrupoRed`.`clase` (
  `idClase` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idClase`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrupoRed`.`enemigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrupoRed`.`enemigo` (
  `idEnemigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(10) NOT NULL,
  `ataque` INT NOT NULL,
  `experiencia` INT NOT NULL,
  `probObjeto` FLOAT NOT NULL,
  `genero` VARCHAR(1) NULL,
  `idObjeto` INT NOT NULL,
  `idClase` INT NOT NULL,
  PRIMARY KEY (`idEnemigo`),
  INDEX `fk_enemigo_objeto1_idx` (`idObjeto` ASC) VISIBLE,
  INDEX `fk_enemigo_clase1_idx` (`idClase` ASC) VISIBLE,
  CONSTRAINT `fk_enemigo_objeto1`
    FOREIGN KEY (`idObjeto`)
    REFERENCES `GrupoRed`.`objeto` (`idObjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enemigo_clase1`
    FOREIGN KEY (`idClase`)
    REFERENCES `GrupoRed`.`clase` (`idClase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrupoRed`.`elemento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrupoRed`.`elemento` (
  `idElemento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`idElemento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrupoRed`.`elementoDeClase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrupoRed`.`elementoDeClase` (
  `elemento_idElemento` INT NOT NULL,
  `clase_idClase` INT NOT NULL,
  `porcDano` INT(5) NOT NULL,
  PRIMARY KEY (`elemento_idElemento`, `clase_idClase`),
  INDEX `fk_elemento_has_clase_clase1_idx` (`clase_idClase` ASC) VISIBLE,
  INDEX `fk_elemento_has_clase_elemento1_idx` (`elemento_idElemento` ASC) VISIBLE,
  CONSTRAINT `fk_elemento_has_clase_elemento1`
    FOREIGN KEY (`elemento_idElemento`)
    REFERENCES `GrupoRed`.`elemento` (`idElemento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_elemento_has_clase_clase1`
    FOREIGN KEY (`clase_idClase`)
    REFERENCES `GrupoRed`.`clase` (`idClase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrupoRed`.`hechizo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrupoRed`.`hechizo` (
  `idHechizo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  `potencia` INT(5) NOT NULL,
  `precision` INT(5) NOT NULL,
  `aprendizaje` INT(2) NOT NULL,
  `elemento_idElemento` INT NOT NULL,
  `idHechizoBase` INT NULL,
  PRIMARY KEY (`idHechizo`),
  INDEX `fk_hechizo_elemento1_idx` (`elemento_idElemento` ASC) VISIBLE,
  INDEX `fk_hechizo_hechizo1_idx` (`idHechizoBase` ASC) VISIBLE,
  CONSTRAINT `fk_hechizo_elemento1`
    FOREIGN KEY (`elemento_idElemento`)
    REFERENCES `GrupoRed`.`elemento` (`idElemento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hechizo_hechizo1`
    FOREIGN KEY (`idHechizoBase`)
    REFERENCES `GrupoRed`.`hechizo` (`idHechizo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `hr` ;

-- -----------------------------------------------------
-- Table `hr`.`regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`regions` (
  `region_id` DECIMAL(22,0) NOT NULL,
  `region_name` VARCHAR(25) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NULL DEFAULT NULL,
  PRIMARY KEY (`region_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hr`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`countries` (
  `country_id` CHAR(2) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `country_name` VARCHAR(40) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NULL DEFAULT NULL,
  `region_id` DECIMAL(22,0) NULL DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  INDEX `countr_reg_fk` (`region_id` ASC) VISIBLE,
  CONSTRAINT `countr_reg_fk`
    FOREIGN KEY (`region_id`)
    REFERENCES `hr`.`regions` (`region_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hr`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`locations` (
  `location_id` INT NOT NULL,
  `street_address` VARCHAR(40) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NULL DEFAULT NULL,
  `postal_code` VARCHAR(12) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NULL DEFAULT NULL,
  `city` VARCHAR(30) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `state_province` VARCHAR(25) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NULL DEFAULT NULL,
  `country_id` CHAR(2) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NULL DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  INDEX `loc_city_ix` (`city` ASC) VISIBLE,
  INDEX `loc_country_ix` (`country_id` ASC) VISIBLE,
  INDEX `loc_state_province_ix` (`state_province` ASC) VISIBLE,
  INDEX `loc_c_id_fk` (`country_id` ASC) VISIBLE,
  CONSTRAINT `loc_c_id_fk`
    FOREIGN KEY (`country_id`)
    REFERENCES `hr`.`countries` (`country_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hr`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`jobs` (
  `job_id` VARCHAR(10) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `job_title` VARCHAR(35) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `min_salary` INT NULL DEFAULT NULL,
  `max_salary` INT NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hr`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`employees` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NULL DEFAULT NULL,
  `last_name` VARCHAR(25) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `email` VARCHAR(25) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `phone_number` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NULL DEFAULT NULL,
  `hire_date` DATETIME NOT NULL,
  `job_id` VARCHAR(10) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `salary` DECIMAL(8,2) NULL DEFAULT NULL,
  `commission_pct` DECIMAL(2,2) NULL DEFAULT NULL,
  `manager_id` INT NULL DEFAULT NULL,
  `department_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE INDEX `emp_email_uk` (`email` ASC) VISIBLE,
  INDEX `emp_department_ix` (`department_id` ASC) VISIBLE,
  INDEX `emp_job_ix` (`job_id` ASC) VISIBLE,
  INDEX `emp_manager_ix` (`manager_id` ASC) VISIBLE,
  INDEX `emp_name_ix` (`last_name` ASC, `first_name` ASC) VISIBLE,
  INDEX `emp_job_fk` (`job_id` ASC) VISIBLE,
  CONSTRAINT `emp_dept_fk`
    FOREIGN KEY (`department_id`)
    REFERENCES `hr`.`departments` (`department_id`),
  CONSTRAINT `emp_job_fk`
    FOREIGN KEY (`job_id`)
    REFERENCES `hr`.`jobs` (`job_id`),
  CONSTRAINT `emp_manager_fk`
    FOREIGN KEY (`manager_id`)
    REFERENCES `hr`.`employees` (`employee_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 207
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hr`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`departments` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(30) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `manager_id` INT NULL DEFAULT NULL,
  `location_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `dept_location_ix` (`location_id` ASC) VISIBLE,
  INDEX `dept_mgr_fk` (`manager_id` ASC) VISIBLE,
  CONSTRAINT `dept_loc_fk`
    FOREIGN KEY (`location_id`)
    REFERENCES `hr`.`locations` (`location_id`),
  CONSTRAINT `dept_mgr_fk`
    FOREIGN KEY (`manager_id`)
    REFERENCES `hr`.`employees` (`employee_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hr`.`job_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`job_history` (
  `employee_id` INT NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `job_id` VARCHAR(10) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NOT NULL,
  `department_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`, `start_date`),
  INDEX `jhist_department_ix` (`department_id` ASC) VISIBLE,
  INDEX `jhist_employee_ix` (`employee_id` ASC) VISIBLE,
  INDEX `jhist_job_ix` (`job_id` ASC) VISIBLE,
  INDEX `jhist_job_fk` (`job_id` ASC) VISIBLE,
  CONSTRAINT `jhist_dept_fk`
    FOREIGN KEY (`department_id`)
    REFERENCES `hr`.`departments` (`department_id`),
  CONSTRAINT `jhist_emp_fk`
    FOREIGN KEY (`employee_id`)
    REFERENCES `hr`.`employees` (`employee_id`),
  CONSTRAINT `jhist_job_fk`
    FOREIGN KEY (`job_id`)
    REFERENCES `hr`.`jobs` (`job_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
