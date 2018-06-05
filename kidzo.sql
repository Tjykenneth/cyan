SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `id5614927_kidzo_database` ;
CREATE SCHEMA IF NOT EXISTS `id5614927_kidzo_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `id5614927_kidzo_database` ;

-- -----------------------------------------------------
-- Table `id5614927_kidzo_database`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `id5614927_kidzo_database`.`student` ;

CREATE TABLE IF NOT EXISTS `id5614927_kidzo_database`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `active` INT(2) NOT NULL,
  `contact_number` INT(16) NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `id5614927_kidzo_database`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `id5614927_kidzo_database`.`admin` ;

CREATE TABLE IF NOT EXISTS `id5614927_kidzo_database`.`admin` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`admin_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `id5614927_kidzo_database`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `id5614927_kidzo_database`.`category` ;

CREATE TABLE IF NOT EXISTS `id5614927_kidzo_database`.`category` (
  `category_id` INT(8) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(20) NOT NULL,
  `category_desc` VARCHAR(60) NOT NULL,
  `category_img` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `id5614927_kidzo_database`.`sub_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `id5614927_kidzo_database`.`sub_category` ;

CREATE TABLE IF NOT EXISTS `id5614927_kidzo_database`.`sub_category` (
  `sub_category` INT(8) NOT NULL AUTO_INCREMENT,
  `category_id` INT(8) NOT NULL,
  `subCat_name` VARCHAR(45) NOT NULL,
  `subCat_img` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sub_category`),
  INDEX `fk_sub_category_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_sub_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `id5614927_kidzo_database`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `id5614927_kidzo_database`.`item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `id5614927_kidzo_database`.`item` ;

CREATE TABLE IF NOT EXISTS `id5614927_kidzo_database`.`item` (
  `item_id` INT(8) NOT NULL AUTO_INCREMENT,
  `item_img` VARCHAR(45) NOT NULL,
  `item_audio` VARCHAR(45) NOT NULL,
  `image_name` VARCHAR(45) NOT NULL,
  `sub_category` INT(8) NOT NULL,
  PRIMARY KEY (`item_id`),
  INDEX `fk_item_sub_category1_idx` (`sub_category` ASC),
  CONSTRAINT `fk_item_sub_category1`
    FOREIGN KEY (`sub_category`)
    REFERENCES `id5614927_kidzo_database`.`sub_category` (`sub_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `id5614927_kidzo_database`.`quiz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `id5614927_kidzo_database`.`quiz` ;

CREATE TABLE IF NOT EXISTS `id5614927_kidzo_database`.`quiz` (
  `quiz_id` INT(8) NOT NULL AUTO_INCREMENT,
  `item_id` INT(8) NOT NULL,
  `question` VARCHAR(45) NOT NULL,
  `option1` VARCHAR(45) NOT NULL,
  `option2` VARCHAR(45) NOT NULL,
  `option3` VARCHAR(45) NOT NULL,
  `option4` VARCHAR(45) NOT NULL,
  `answer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`quiz_id`),
  INDEX `fk_quiz_lesson1_idx` (`item_id` ASC),
  CONSTRAINT `fk_quiz_lesson1`
    FOREIGN KEY (`item_id`)
    REFERENCES `id5614927_kidzo_database`.`item` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `id5614927_kidzo_database`.`quiz_score`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `id5614927_kidzo_database`.`quiz_score` ;

CREATE TABLE IF NOT EXISTS `id5614927_kidzo_database`.`quiz_score` (
  `score_id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `quiz_id` INT(8) NOT NULL,
  `quiz_score` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`score_id`),
  INDEX `fk_quiz_result_student1_idx` (`student_id` ASC),
  INDEX `fk_quiz_result_quiz1_idx` (`quiz_id` ASC),
  CONSTRAINT `fk_quiz_result_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `id5614927_kidzo_database`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_result_quiz1`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `id5614927_kidzo_database`.`quiz` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `id5614927_kidzo_database`.`student`
-- -----------------------------------------------------
START TRANSACTION;
USE `id5614927_kidzo_database`;
INSERT INTO `id5614927_kidzo_database`.`student` (`student_id`, `first_name`, `last_name`, `dob`, `email`, `password`, `username`, `image`, `active`, `contact_number`) VALUES (1, 'Ahmad', 'Syafiq', '1998-04-12', 'aladine112@gmail.com', 'xHerbl0re', 'QifaysDamha', 'myself', 1, 97487175);

COMMIT;