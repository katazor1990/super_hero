-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.5.52 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la base pour super_heros
DROP DATABASE IF EXISTS `super_heros`;
CREATE DATABASE IF NOT EXISTS `super_heros` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `super_heros`;


-- Export de la structure de table super_heros. sh_hero
DROP TABLE IF EXISTS `sh_hero`;
CREATE TABLE IF NOT EXISTS `sh_hero` (
  `hero_id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_first_name` varchar(80) DEFAULT NULL,
  `hero_last_name` varchar(80) DEFAULT NULL,
  `hero_pseudo` varchar(80) DEFAULT NULL,
  `hero_country` varchar(80) DEFAULT NULL,
  `hero_logo` text,
  `hero_team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hero_id`),
  KEY `fk_hero_team_id` (`hero_team_id`),
  CONSTRAINT `fk_hero_team_id` FOREIGN KEY (`hero_team_id`) REFERENCES `sh_team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Export de données de la table super_heros.sh_hero : ~0 rows (environ)
DELETE FROM `sh_hero`;
/*!40000 ALTER TABLE `sh_hero` DISABLE KEYS */;
INSERT INTO `sh_hero` (`hero_id`, `hero_first_name`, `hero_last_name`, `hero_pseudo`, `hero_country`, `hero_logo`, `hero_team_id`) VALUES
	(1, 'Bruce', 'Wayne', 'Batman', 'USA', NULL, 1),
	(2, 'Clark', 'Kent', 'Superman', 'USA', NULL, 1);
/*!40000 ALTER TABLE `sh_hero` ENABLE KEYS */;


-- Export de la structure de table super_heros. sh_hero_power
DROP TABLE IF EXISTS `sh_hero_power`;
CREATE TABLE IF NOT EXISTS `sh_hero_power` (
  `hero_power_id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_power_hero_id` int(11) DEFAULT NULL,
  `hero_power_power_id` int(11) DEFAULT NULL,
  `hero_power_level` int(3) DEFAULT NULL,
  PRIMARY KEY (`hero_power_id`),
  KEY `fk_hero_power_hero_id` (`hero_power_hero_id`),
  KEY `fk_hero_power_power_id` (`hero_power_power_id`),
  CONSTRAINT `fk_hero_power_power_id` FOREIGN KEY (`hero_power_power_id`) REFERENCES `sh_power` (`power_id`),
  CONSTRAINT `fk_hero_power_hero_id` FOREIGN KEY (`hero_power_hero_id`) REFERENCES `sh_hero` (`hero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table super_heros.sh_hero_power : ~0 rows (environ)
DELETE FROM `sh_hero_power`;
/*!40000 ALTER TABLE `sh_hero_power` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_hero_power` ENABLE KEYS */;


-- Export de la structure de table super_heros. sh_power
DROP TABLE IF EXISTS `sh_power`;
CREATE TABLE IF NOT EXISTS `sh_power` (
  `power_id` int(11) NOT NULL AUTO_INCREMENT,
  `power_name` varchar(80) DEFAULT NULL,
  `power_desc` text,
  PRIMARY KEY (`power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table super_heros.sh_power : ~0 rows (environ)
DELETE FROM `sh_power`;
/*!40000 ALTER TABLE `sh_power` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_power` ENABLE KEYS */;


-- Export de la structure de table super_heros. sh_team
DROP TABLE IF EXISTS `sh_team`;
CREATE TABLE IF NOT EXISTS `sh_team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(80) DEFAULT NULL,
  `team_logo` text,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Export de données de la table super_heros.sh_team : ~0 rows (environ)
DELETE FROM `sh_team`;
/*!40000 ALTER TABLE `sh_team` DISABLE KEYS */;
INSERT INTO `sh_team` (`team_id`, `team_name`, `team_logo`) VALUES
	(1, 'gla', NULL);
/*!40000 ALTER TABLE `sh_team` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
