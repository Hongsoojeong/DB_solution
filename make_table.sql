CREATE TABLE mainbase(
id int,
pname varchar(45), 
sex varchar(1),
birth varchar(100), 
email varchar(100), 
dtime datetime, 
ddept varchar(45), 
dcd varchar(45), 
dname varchar(100), 
stype varchar(45), 
scd varchar(45), 
sname varchar(200), 
company varchar(200), 
medic_amount varchar(45), 
pack varchar(45), 
ingredient varchar(200), 
amount int)

-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `id` INT NOT NULL,
  `pname` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  `birth` DATE NOT NULL,
  `email` VARCHAR(100) NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`diease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diease` (
  `dcd` VARCHAR(45) NOT NULL,
  `dname` VARCHAR(45) NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diagnosis` (
  `patient_id` INT NOT NULL,
  `diease_dcd` VARCHAR(45) NOT NULL,
  `time` DATETIME NOT NULL,
  `ddept` VARCHAR(45) NOT NULL,
  `amount` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`script`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`script` (
  `diease_dcd` VARCHAR(45) NOT NULL,
  `scd` VARCHAR(45) NOT NULL,
  `stype` VARCHAR(45) NOT NULL,
  `sname` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`diease_dcd`, `scd`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medicine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medicine` (
  `script_scd` VARCHAR(45) NOT NULL,
  `company` VARCHAR(100) NULL,
  `medic_amount` VARCHAR(45) NULL,
  `pack` VARCHAR(45) NULL,
  `ingredient` INT NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
