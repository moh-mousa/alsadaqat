-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 25, 2014 at 06:32 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.17

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sadaqat_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary`
--

DROP TABLE IF EXISTS `beneficiary`;
CREATE TABLE IF NOT EXISTS `beneficiary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `ssn` varchar(32) NOT NULL,
  `gender` enum('Male','Female') NOT NULL DEFAULT 'Male',
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `home_phone` varchar(17) NOT NULL,
  `mobile` varchar(17) NOT NULL,
  `address` varchar(255) NOT NULL,
  `personal_photo_path` varchar(255) NOT NULL,
  `nationality_id` int(11) unsigned NOT NULL,
  `country_id` int(11) unsigned NOT NULL,
  `city_id` int(11) unsigned NOT NULL,
  `beneficiary_type` enum('student','orphan','poor','widow','disabled','teacher','other') NOT NULL DEFAULT 'student',
  `has_paterfamilias` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_family_members` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_home` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_income` enum('Yes','No') NOT NULL DEFAULT 'No',
  `organization_id` int(11) unsigned NOT NULL,
  `organization_branch_id` int(11) unsigned NOT NULL,
  `donator_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `notes` varchar(1024) NOT NULL,
  `options` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ssn` (`ssn`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `nationality_id` (`nationality_id`),
  KEY `country_id` (`country_id`),
  KEY `city_id` (`city_id`),
  KEY `organization_id` (`organization_id`),
  KEY `organization_branch_id` (`organization_branch_id`),
  KEY `donator_id` (`donator_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_disabled`
--

DROP TABLE IF EXISTS `beneficiary_disabled`;
CREATE TABLE IF NOT EXISTS `beneficiary_disabled` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `father_full_name` varchar(255) NOT NULL,
  `is_father_alive` enum('Yes','No') NOT NULL DEFAULT 'No',
  `father_job` varchar(255) NOT NULL,
  `father_date_of_birth` date DEFAULT NULL,
  `father_date_of_death` date DEFAULT NULL,
  `father_reason_of_death` varchar(255) DEFAULT NULL,
  `father_death_certificate_path` varchar(255) DEFAULT NULL,
  `mother_full_name` varchar(255) NOT NULL,
  `is_mother_alive` enum('Yes','No') NOT NULL DEFAULT 'No',
  `mother_job` varchar(255) NOT NULL,
  `mother_date_of_birth` date DEFAULT NULL,
  `mother_date_of_death` date DEFAULT NULL,
  `mother_reason_of_death` varchar(255) DEFAULT NULL,
  `mother_death_certificate_path` varchar(255) DEFAULT NULL,
  `number_of_brothers` tinyint(3) unsigned NOT NULL,
  `number_of_sisters` tinyint(3) unsigned NOT NULL,
  `disability_type` enum('Physical','Mental','Social') NOT NULL DEFAULT 'Physical',
  `disability_reason` enum('Genetic','Pregnancy defect','Childbirth defect','Infection','Accident','Environmental','Other') NOT NULL DEFAULT 'Genetic',
  `disability_description` varchar(255) DEFAULT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_family_members`
--

DROP TABLE IF EXISTS `beneficiary_family_members`;
CREATE TABLE IF NOT EXISTS `beneficiary_family_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `ssn` varchar(32) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `beneficiary_relation_id` int(11) unsigned NOT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `educational_status` varchar(255) DEFAULT NULL,
  `health_status` varchar(255) DEFAULT NULL,
  `business` varchar(255) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ssn` (`ssn`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`),
  KEY `beneficiary_relation_id` (`beneficiary_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_finance`
--

DROP TABLE IF EXISTS `beneficiary_finance`;
CREATE TABLE IF NOT EXISTS `beneficiary_finance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `has_supplies_card` enum('Yes','No') NOT NULL DEFAULT 'No',
  `income_from_paterfamilias` float unsigned NOT NULL,
  `income_from_beneficiary_business` float unsigned NOT NULL,
  `income_from_beneficiary_family_business` float unsigned NOT NULL,
  `income_from_social_security` float unsigned NOT NULL,
  `income_from_retirement` float unsigned NOT NULL,
  `income_from_lands` float unsigned NOT NULL,
  `income_from_property` float unsigned NOT NULL,
  `income_from_agriculture` float unsigned NOT NULL,
  `income_from_national_aid_fund` float unsigned NOT NULL,
  `income_from_zakat_fund` float unsigned NOT NULL,
  `income_from_charity_fund` float unsigned NOT NULL,
  `income_total` float unsigned NOT NULL,
  `spending_home_rent` float unsigned NOT NULL,
  `spending_food` float unsigned NOT NULL,
  `spending_clothes` float unsigned NOT NULL,
  `spending_medication` float unsigned NOT NULL,
  `spending_smoking` float unsigned NOT NULL,
  `spending_education` float unsigned NOT NULL,
  `spending_transportation` float unsigned NOT NULL,
  `spending_gas_invoice` float unsigned NOT NULL,
  `spending_water_invoice` float unsigned NOT NULL,
  `spending_elctricity_invoice` float unsigned NOT NULL,
  `spending_kerosene` int(10) unsigned NOT NULL,
  `spending_other` float unsigned NOT NULL,
  `spending_total` float unsigned NOT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_home`
--

DROP TABLE IF EXISTS `beneficiary_home`;
CREATE TABLE IF NOT EXISTS `beneficiary_home` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(512) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `construction_type` varchar(255) NOT NULL,
  `number_of_rooms` tinyint(3) unsigned NOT NULL,
  `number_of_residents` tinyint(3) unsigned NOT NULL,
  `contract_type` enum('Rented','Owned','Free') NOT NULL DEFAULT 'Rented',
  `rent_cost` float unsigned NOT NULL,
  `rent_type` enum('Monthly','Quarterly','Annual','Other') NOT NULL DEFAULT 'Monthly',
  `has_tv` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_refrigerator` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_washer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_dryer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_video_player` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_telephone` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_mobile` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_gas` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_oven` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_microwave` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_air_conditioner` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_water_solar_heater` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_water_electrical_heater` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_gas_heater` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_electrical_heater` enum('Yes','No') NOT NULL DEFAULT 'No',
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_orphan`
--

DROP TABLE IF EXISTS `beneficiary_orphan`;
CREATE TABLE IF NOT EXISTS `beneficiary_orphan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `father_full_name` varchar(255) NOT NULL,
  `is_father_alive` enum('Yes','No') NOT NULL DEFAULT 'No',
  `father_job` varchar(255) NOT NULL,
  `father_date_of_birth` date DEFAULT NULL,
  `father_date_of_death` date DEFAULT NULL,
  `father_reason_of_death` varchar(255) DEFAULT NULL,
  `father_death_certificate_path` varchar(255) DEFAULT NULL,
  `mother_full_name` varchar(255) NOT NULL,
  `is_mother_alive` enum('Yes','No') NOT NULL DEFAULT 'No',
  `mother_job` varchar(255) NOT NULL,
  `mother_date_of_birth` date DEFAULT NULL,
  `mother_date_of_death` date DEFAULT NULL,
  `mother_reason_of_death` varchar(255) DEFAULT NULL,
  `mother_death_certificate_path` varchar(255) DEFAULT NULL,
  `number_of_brothers` tinyint(3) unsigned NOT NULL,
  `number_of_sisters` tinyint(3) unsigned NOT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_paterfamilias`
--

DROP TABLE IF EXISTS `beneficiary_paterfamilias`;
CREATE TABLE IF NOT EXISTS `beneficiary_paterfamilias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paterfamilias_first_name` varchar(255) NOT NULL,
  `paterfamilias_middle_name` varchar(255) NOT NULL,
  `paterfamilias_grandfather_name` varchar(255) NOT NULL,
  `paterfamilias_family_name` varchar(255) NOT NULL,
  `paterfamilias_date_of_birth` date NOT NULL,
  `ssn` varchar(32) NOT NULL,
  `beneficiary_relation_id` int(11) unsigned NOT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`),
  KEY `beneficiary_relation_id` (`beneficiary_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_poor`
--

DROP TABLE IF EXISTS `beneficiary_poor`;
CREATE TABLE IF NOT EXISTS `beneficiary_poor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `father_full_name` varchar(255) NOT NULL,
  `is_father_alive` enum('Yes','No') NOT NULL DEFAULT 'No',
  `father_job` varchar(255) NOT NULL,
  `father_date_of_birth` date DEFAULT NULL,
  `father_date_of_death` date DEFAULT NULL,
  `father_reason_of_death` varchar(255) DEFAULT NULL,
  `father_death_certificate_path` varchar(255) DEFAULT NULL,
  `mother_full_name` varchar(255) NOT NULL,
  `is_mother_alive` enum('Yes','No') NOT NULL DEFAULT 'No',
  `mother_job` varchar(255) NOT NULL,
  `mother_date_of_birth` date DEFAULT NULL,
  `mother_date_of_death` date DEFAULT NULL,
  `mother_reason_of_death` varchar(255) DEFAULT NULL,
  `mother_death_certificate_path` varchar(255) DEFAULT NULL,
  `number_of_brothers` tinyint(3) unsigned NOT NULL,
  `number_of_sisters` tinyint(3) unsigned NOT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_relation`
--

DROP TABLE IF EXISTS `beneficiary_relation`;
CREATE TABLE IF NOT EXISTS `beneficiary_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `beneficiary_relation`
--

INSERT INTO `beneficiary_relation` (`id`, `name`, `owner_id`, `created_at`, `updated_at`) VALUES
(45, 'أب', 1, '2014-05-24 11:26:51', NULL),
(46, 'أم', 1, '2014-05-24 11:26:51', NULL),
(47, 'أخ', 1, '2014-05-24 11:26:51', NULL),
(48, 'أخت', 1, '2014-05-24 11:26:51', NULL),
(49, 'عم', 1, '2014-05-24 11:26:51', NULL),
(50, 'عمة', 1, '2014-05-24 11:26:51', NULL),
(51, 'خال', 1, '2014-05-24 11:26:51', NULL),
(52, 'خالة', 1, '2014-05-24 11:26:51', NULL),
(53, 'جد', 1, '2014-05-24 11:26:51', NULL),
(54, 'جدة', 1, '2014-05-24 11:26:51', NULL),
(55, 'ابن عم', 1, '2014-05-24 11:26:51', NULL),
(56, 'ابن عمة', 1, '2014-05-24 11:26:51', NULL),
(57, 'ابن خال', 1, '2014-05-24 11:26:51', NULL),
(58, 'ابن خالة', 1, '2014-05-24 11:26:51', NULL),
(59, 'زوج الأب', 1, '2014-05-24 11:26:51', NULL),
(60, 'زوج الأم', 1, '2014-05-24 11:26:51', NULL),
(61, 'زوج الاخت', 1, '2014-05-24 11:26:51', NULL),
(62, 'زوجة الأخ', 1, '2014-05-24 11:26:51', NULL),
(63, 'ابن الأخ', 1, '2014-05-24 11:26:51', NULL),
(64, 'ابن الأخت', 1, '2014-05-24 11:26:51', NULL),
(65, 'بنت الأخ', 1, '2014-05-24 11:26:51', NULL),
(66, 'بنت الأخت', 1, '2014-05-24 11:26:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_research_notes`
--

DROP TABLE IF EXISTS `beneficiary_research_notes`;
CREATE TABLE IF NOT EXISTS `beneficiary_research_notes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `support_type` enum('Frequent','Emergency','Medical','Educational','Other') NOT NULL DEFAULT 'Frequent',
  `support_period` enum('Permanent','Once','Until healing','Until graduate') NOT NULL DEFAULT 'Permanent',
  `expected_support_period` varchar(255) DEFAULT NULL,
  `support_modality` enum('Money','In-kind','Money and in-kind','Volunteer','By hand','Educate a family member','Employ a family member','Other') NOT NULL DEFAULT 'Money',
  `information_source` enum('Official documents','Work visit','Home visit','Trusted neighbors') NOT NULL DEFAULT 'Official documents',
  `has_small_business_idea` enum('Yes','No') NOT NULL DEFAULT 'No',
  `small_business_idea_description` varchar(255) NOT NULL,
  `researcher_recommendations` varchar(512) NOT NULL,
  `researcher_name` varchar(255) NOT NULL,
  `notes` varchar(512) NOT NULL,
  `committee_recommendations` varchar(512) NOT NULL,
  `committee_member_name` varchar(512) NOT NULL,
  `committee_manager_name` varchar(512) NOT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_student`
--

DROP TABLE IF EXISTS `beneficiary_student`;
CREATE TABLE IF NOT EXISTS `beneficiary_student` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `father_full_name` varchar(255) NOT NULL,
  `is_father_alive` enum('Yes','No') NOT NULL DEFAULT 'No',
  `father_job` varchar(255) NOT NULL,
  `father_date_of_birth` date DEFAULT NULL,
  `father_date_of_death` date DEFAULT NULL,
  `father_reason_of_death` varchar(255) DEFAULT NULL,
  `father_death_certificate_path` varchar(255) DEFAULT NULL,
  `mother_full_name` varchar(255) NOT NULL,
  `is_mother_alive` enum('Yes','No') NOT NULL DEFAULT 'No',
  `mother_job` varchar(255) NOT NULL,
  `mother_date_of_birth` date DEFAULT NULL,
  `mother_date_of_death` date DEFAULT NULL,
  `mother_reason_of_death` varchar(255) DEFAULT NULL,
  `mother_death_certificate_path` varchar(255) DEFAULT NULL,
  `number_of_brothers` tinyint(3) unsigned NOT NULL,
  `number_of_sisters` tinyint(3) unsigned NOT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_student_class`
--

DROP TABLE IF EXISTS `beneficiary_student_class`;
CREATE TABLE IF NOT EXISTS `beneficiary_student_class` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `major_name` varchar(255) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `start_at` date NOT NULL,
  `end_at` date NOT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_teacher`
--

DROP TABLE IF EXISTS `beneficiary_teacher`;
CREATE TABLE IF NOT EXISTS `beneficiary_teacher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scientific_degree` varchar(255) NOT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_widow`
--

DROP TABLE IF EXISTS `beneficiary_widow`;
CREATE TABLE IF NOT EXISTS `beneficiary_widow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `husband_full_name` varchar(255) NOT NULL,
  `husband_job` varchar(255) NOT NULL,
  `husband_date_of_birth` date DEFAULT NULL,
  `husband_date_of_death` date DEFAULT NULL,
  `husband_reason_of_death` varchar(255) DEFAULT NULL,
  `husband_death_certificate_path` varchar(255) DEFAULT NULL,
  `number_of_sons` tinyint(3) unsigned NOT NULL,
  `number_of_daughters` tinyint(3) unsigned NOT NULL,
  `beneficiary_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `published` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `country_id`, `name`, `name_ar`, `published`, `created_at`, `updated_at`) VALUES
(1, 108, 'Amman', 'عمان', 'Yes', '2014-05-24 11:20:01', NULL),
(2, 108, 'Irbid', 'إربد', 'Yes', '2014-05-24 11:20:01', NULL),
(3, 108, 'Aqaba', 'العقبة', 'Yes', '2014-05-24 11:20:01', NULL),
(4, 108, 'Zarqa', 'الزرقاء', 'Yes', '2014-05-24 11:20:01', NULL),
(5, 108, 'Karak', 'الكرك', 'Yes', '2014-05-24 11:20:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'Name in Arabic',
  `iso_code_2` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) COLLATE utf8_bin NOT NULL DEFAULT '',
  `published` enum('Yes','No') COLLATE utf8_bin NOT NULL DEFAULT 'Yes',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=240 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `name_ar`, `iso_code_2`, `iso_code_3`, `published`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'أفغانستان', 'AF', 'AFG', 'Yes', NULL, '0000-00-00 00:00:00'),
(2, 'Albania', 'ألبانيا', 'AL', 'ALB', 'Yes', NULL, '0000-00-00 00:00:00'),
(3, 'Algeria', 'الجزائر', 'DZ', 'DZA', 'Yes', NULL, '0000-00-00 00:00:00'),
(4, 'American Samoa', 'ساموا الأمريكية', 'AS', 'ASM', 'Yes', NULL, '0000-00-00 00:00:00'),
(5, 'Andorra', 'أندورا', 'AD', 'AND', 'Yes', NULL, '0000-00-00 00:00:00'),
(6, 'Angola', 'أنغولا', 'AO', 'AGO', 'Yes', NULL, '0000-00-00 00:00:00'),
(7, 'Anguilla', '', 'AI', 'AIA', 'Yes', NULL, '0000-00-00 00:00:00'),
(8, 'Antarctica', '', 'AQ', 'ATA', 'Yes', NULL, '0000-00-00 00:00:00'),
(9, 'Antigua and Barbuda', 'أنتيغوا وبربودا', 'AG', 'ATG', 'Yes', NULL, '0000-00-00 00:00:00'),
(10, 'Argentina', 'الأرجنتين', 'AR', 'ARG', 'Yes', NULL, '0000-00-00 00:00:00'),
(11, 'Armenia', 'أرمينيا', 'AM', 'ARM', 'Yes', NULL, '0000-00-00 00:00:00'),
(12, 'Aruba', 'أروبا', 'AW', 'ABW', 'Yes', NULL, '0000-00-00 00:00:00'),
(13, 'Australia', 'أستراليا', 'AU', 'AUS', 'Yes', NULL, '0000-00-00 00:00:00'),
(14, 'Austria', 'النمسا', 'AT', 'AUT', 'Yes', NULL, '0000-00-00 00:00:00'),
(15, 'Azerbaijan', 'أذربيجان', 'AZ', 'AZE', 'Yes', NULL, '0000-00-00 00:00:00'),
(16, 'Bahamas', 'جزر البهاما', 'BS', 'BHS', 'Yes', NULL, '0000-00-00 00:00:00'),
(17, 'Bahrain', 'البحرين', 'BH', 'BHR', 'Yes', NULL, '0000-00-00 00:00:00'),
(18, 'Bangladesh', 'بنغلاديش', 'BD', 'BGD', 'Yes', NULL, '0000-00-00 00:00:00'),
(19, 'Barbados', 'بربادوس', 'BB', 'BRB', 'Yes', NULL, '0000-00-00 00:00:00'),
(20, 'Belarus', 'روسيا البيضاء', 'BY', 'BLR', 'Yes', NULL, '0000-00-00 00:00:00'),
(21, 'Belgium', 'بلجيكا', 'BE', 'BEL', 'Yes', NULL, '0000-00-00 00:00:00'),
(22, 'Belize', 'بليز', 'BZ', 'BLZ', 'Yes', NULL, '0000-00-00 00:00:00'),
(23, 'Benin', 'بنين', 'BJ', 'BEN', 'Yes', NULL, '0000-00-00 00:00:00'),
(24, 'Bermuda', 'برمودا', 'BM', 'BMU', 'Yes', NULL, '0000-00-00 00:00:00'),
(25, 'Bhutan', 'بوتان', 'BT', 'BTN', 'Yes', NULL, '0000-00-00 00:00:00'),
(26, 'Bolivia', 'بوليفيا', 'BO', 'BOL', 'Yes', NULL, '0000-00-00 00:00:00'),
(27, 'Bosnia and Herzegowina', '', 'BA', 'BIH', 'Yes', NULL, '0000-00-00 00:00:00'),
(28, 'Botswana', 'بوتسوانا', 'BW', 'BWA', 'Yes', NULL, '0000-00-00 00:00:00'),
(29, 'Bouvet Island', '', 'BV', 'BVT', 'Yes', NULL, '0000-00-00 00:00:00'),
(30, 'Brazil', 'البرازيل', 'BR', 'BRA', 'Yes', NULL, '0000-00-00 00:00:00'),
(31, 'British Indian Ocean Territory', 'إقليم المحيط الهندي البريطاني', 'IO', 'IOT', 'Yes', NULL, '0000-00-00 00:00:00'),
(32, 'Brunei Darussalam', '', 'BN', 'BRN', 'Yes', NULL, '0000-00-00 00:00:00'),
(33, 'Bulgaria', 'بلغاريا', 'BG', 'BGR', 'Yes', NULL, '0000-00-00 00:00:00'),
(34, 'Burkina Faso', 'بوركينا فاسو', 'BF', 'BFA', 'Yes', NULL, '0000-00-00 00:00:00'),
(35, 'Burundi', 'بوروندي', 'BI', 'BDI', 'Yes', NULL, '0000-00-00 00:00:00'),
(36, 'Cambodia', 'كمبوديا', 'KH', 'KHM', 'Yes', NULL, '0000-00-00 00:00:00'),
(37, 'Cameroon', 'الكاميرون', 'CM', 'CMR', 'Yes', NULL, '0000-00-00 00:00:00'),
(38, 'Canada', 'كندا', 'CA', 'CAN', 'Yes', NULL, '0000-00-00 00:00:00'),
(39, 'Cape Verde', 'الرأس الأخضر', 'CV', 'CPV', 'Yes', NULL, '0000-00-00 00:00:00'),
(40, 'Cayman Islands', 'جزر كايمان', 'KY', 'CYM', 'Yes', NULL, '0000-00-00 00:00:00'),
(41, 'Central African Republic', 'جمهورية أفريقيا الوسطى', 'CF', 'CAF', 'Yes', NULL, '0000-00-00 00:00:00'),
(42, 'Chad', 'تشاد', 'TD', 'TCD', 'Yes', NULL, '0000-00-00 00:00:00'),
(43, 'Chile', 'شيلي', 'CL', 'CHL', 'Yes', NULL, '0000-00-00 00:00:00'),
(44, 'China', 'الصين', 'CN', 'CHN', 'Yes', NULL, '0000-00-00 00:00:00'),
(45, 'Christmas Island', '', 'CX', 'CXR', 'Yes', NULL, '0000-00-00 00:00:00'),
(46, 'Cocos (Keeling) Islands', '', 'CC', 'CCK', 'Yes', NULL, '0000-00-00 00:00:00'),
(47, 'Colombia', 'كولومبيا', 'CO', 'COL', 'Yes', NULL, '0000-00-00 00:00:00'),
(48, 'Comoros', 'جزر القمر', 'KM', 'COM', 'Yes', NULL, '0000-00-00 00:00:00'),
(49, 'Congo', 'الكونغو', 'CG', 'COG', 'Yes', NULL, '0000-00-00 00:00:00'),
(50, 'Cook Islands', '', 'CK', 'COK', 'Yes', NULL, '0000-00-00 00:00:00'),
(51, 'Costa Rica', '', 'CR', 'CRI', 'Yes', NULL, '0000-00-00 00:00:00'),
(52, 'Cote D''Ivoire', '', 'CI', 'CIV', 'Yes', NULL, '0000-00-00 00:00:00'),
(53, 'Croatia', 'كرواتيا', 'HR', 'HRV', 'Yes', NULL, '0000-00-00 00:00:00'),
(54, 'Cuba', 'كوبا', 'CU', 'CUB', 'Yes', NULL, '0000-00-00 00:00:00'),
(55, 'Cyprus', '', 'CY', 'CYP', 'Yes', NULL, '0000-00-00 00:00:00'),
(56, 'Czech Republic', 'جمهورية التشيك', 'CZ', 'CZE', 'Yes', NULL, '0000-00-00 00:00:00'),
(57, 'Denmark', 'الدنمارك', 'DK', 'DNK', 'Yes', NULL, '0000-00-00 00:00:00'),
(58, 'Djibouti', 'جيبوتي', 'DJ', 'DJI', 'Yes', NULL, '0000-00-00 00:00:00'),
(59, 'Dominica', '', 'DM', 'DMA', 'Yes', NULL, '0000-00-00 00:00:00'),
(60, 'Dominican Republic', 'جمهورية الدومينيكان', 'DO', 'DOM', 'Yes', NULL, '0000-00-00 00:00:00'),
(61, 'East Timor', 'تيمور الشرقية', 'TP', 'TMP', 'Yes', NULL, '0000-00-00 00:00:00'),
(62, 'Ecuador', 'الاكوادور', 'EC', 'ECU', 'Yes', NULL, '0000-00-00 00:00:00'),
(63, 'Egypt', 'مصر', 'EG', 'EGY', 'Yes', NULL, '0000-00-00 00:00:00'),
(64, 'El Salvador', 'السلفادور', 'SV', 'SLV', 'Yes', NULL, '0000-00-00 00:00:00'),
(65, 'Equatorial Guinea', 'غينيا الاستوائية', 'GQ', 'GNQ', 'Yes', NULL, '0000-00-00 00:00:00'),
(66, 'Eritrea', 'إريتريا', 'ER', 'ERI', 'Yes', NULL, '0000-00-00 00:00:00'),
(67, 'Estonia', 'استونيا', 'EE', 'EST', 'Yes', NULL, '0000-00-00 00:00:00'),
(68, 'Ethiopia', 'أثيوبيا', 'ET', 'ETH', 'Yes', NULL, '0000-00-00 00:00:00'),
(69, 'Falkland Islands (Malvinas)', '', 'FK', 'FLK', 'Yes', NULL, '0000-00-00 00:00:00'),
(70, 'Faroe Islands', '', 'FO', 'FRO', 'Yes', NULL, '0000-00-00 00:00:00'),
(71, 'Fiji', 'فيجي', 'FJ', 'FJI', 'Yes', NULL, '0000-00-00 00:00:00'),
(72, 'Finland', 'فنلندا', 'FI', 'FIN', 'Yes', NULL, '0000-00-00 00:00:00'),
(73, 'France', 'فرنسا', 'FR', 'FRA', 'Yes', NULL, '0000-00-00 00:00:00'),
(74, 'France, Metropolitan', '', 'FX', 'FXX', 'Yes', NULL, '0000-00-00 00:00:00'),
(75, 'French Guiana', 'غيانا الفرنسية', 'GF', 'GUF', 'Yes', NULL, '0000-00-00 00:00:00'),
(76, 'French Polynesia', 'بولينيزيا الفرنسية', 'PF', 'PYF', 'Yes', NULL, '0000-00-00 00:00:00'),
(77, 'French Southern Territories', 'الأراضي الفرنسية الجنوبية', 'TF', 'ATF', 'Yes', NULL, '0000-00-00 00:00:00'),
(78, 'Gabon', 'الغابون', 'GA', 'GAB', 'Yes', NULL, '0000-00-00 00:00:00'),
(79, 'Gambia', 'غامبيا', 'GM', 'GMB', 'Yes', NULL, '0000-00-00 00:00:00'),
(80, 'Georgia', 'جورجيا', 'GE', 'GEO', 'Yes', NULL, '0000-00-00 00:00:00'),
(81, 'Germany', 'ألمانيا', 'DE', 'DEU', 'Yes', NULL, '0000-00-00 00:00:00'),
(82, 'Ghana', 'غانا', 'GH', 'GHA', 'Yes', NULL, '0000-00-00 00:00:00'),
(83, 'Gibraltar', 'جبل طارق', 'GI', 'GIB', 'Yes', NULL, '0000-00-00 00:00:00'),
(84, 'Greece', 'يونان', 'GR', 'GRC', 'Yes', NULL, '0000-00-00 00:00:00'),
(85, 'Greenland', 'غرينلاند', 'GL', 'GRL', 'Yes', NULL, '0000-00-00 00:00:00'),
(86, 'Grenada', 'غرينادا', 'GD', 'GRD', 'Yes', NULL, '0000-00-00 00:00:00'),
(87, 'Guadeloupe', 'جواديلوب', 'GP', 'GLP', 'Yes', NULL, '0000-00-00 00:00:00'),
(88, 'Guam', '', 'GU', 'GUM', 'Yes', NULL, '0000-00-00 00:00:00'),
(89, 'Guatemala', 'غواتيمالا', 'GT', 'GTM', 'Yes', NULL, '0000-00-00 00:00:00'),
(90, 'Guinea', 'غينيا', 'GN', 'GIN', 'Yes', NULL, '0000-00-00 00:00:00'),
(91, 'Guinea-bissau', '', 'GW', 'GNB', 'Yes', NULL, '0000-00-00 00:00:00'),
(92, 'Guyana', 'غيانا', 'GY', 'GUY', 'Yes', NULL, '0000-00-00 00:00:00'),
(93, 'Haiti', 'هايتي', 'HT', 'HTI', 'Yes', NULL, '0000-00-00 00:00:00'),
(94, 'Heard and Mc Donald Islands', '', 'HM', 'HMD', 'Yes', NULL, '0000-00-00 00:00:00'),
(95, 'Honduras', 'هندوراس', 'HN', 'HND', 'Yes', NULL, '0000-00-00 00:00:00'),
(96, 'Hong Kong', '', 'HK', 'HKG', 'Yes', NULL, '0000-00-00 00:00:00'),
(97, 'Hungary', 'هنغاريا', 'HU', 'HUN', 'Yes', NULL, '0000-00-00 00:00:00'),
(98, 'Iceland', 'أيسلندا', 'IS', 'ISL', 'Yes', NULL, '0000-00-00 00:00:00'),
(99, 'India', 'الهند', 'IN', 'IND', 'Yes', NULL, '0000-00-00 00:00:00'),
(100, 'Indonesia', 'أندونيسيا', 'ID', 'IDN', 'Yes', NULL, '0000-00-00 00:00:00'),
(101, 'Iran (Islamic Republic of)', '', 'IR', 'IRN', 'Yes', NULL, '0000-00-00 00:00:00'),
(102, 'Iraq', 'العراق', 'IQ', 'IRQ', 'Yes', NULL, '0000-00-00 00:00:00'),
(103, 'Ireland', 'ايرلندا', 'IE', 'IRL', 'Yes', NULL, '0000-00-00 00:00:00'),
(104, 'Israel', '', 'IL', 'ISR', 'Yes', NULL, '0000-00-00 00:00:00'),
(105, 'Italy', 'إيطاليا', 'IT', 'ITA', 'Yes', NULL, '0000-00-00 00:00:00'),
(106, 'Jamaica', 'جامايكا', 'JM', 'JAM', 'Yes', NULL, '0000-00-00 00:00:00'),
(107, 'Japan', 'اليابان', 'JP', 'JPN', 'Yes', NULL, '0000-00-00 00:00:00'),
(108, 'Jordan', 'الأردن', 'JO', 'JOR', 'Yes', NULL, '0000-00-00 00:00:00'),
(109, 'Kazakhstan', 'كازاخستان', 'KZ', 'KAZ', 'Yes', NULL, '0000-00-00 00:00:00'),
(110, 'Kenya', 'كينيا', 'KE', 'KEN', 'Yes', NULL, '0000-00-00 00:00:00'),
(111, 'Kiribati', 'كيريباتي', 'KI', 'KIR', 'Yes', NULL, '0000-00-00 00:00:00'),
(112, 'North Korea', '', 'KP', 'PRK', 'Yes', NULL, '0000-00-00 00:00:00'),
(113, 'Korea, Republic of', '', 'KR', 'KOR', 'Yes', NULL, '0000-00-00 00:00:00'),
(114, 'Kuwait', 'الكويت', 'KW', 'KWT', 'Yes', NULL, '0000-00-00 00:00:00'),
(115, 'Kyrgyzstan', 'قيرغيزستان', 'KG', 'KGZ', 'Yes', NULL, '0000-00-00 00:00:00'),
(116, 'Lao People''s Democratic Republic', '', 'LA', 'LAO', 'Yes', NULL, '0000-00-00 00:00:00'),
(117, 'Latvia', 'لاتفيا', 'LV', 'LVA', 'Yes', NULL, '0000-00-00 00:00:00'),
(118, 'Lebanon', 'لبنان', 'LB', 'LBN', 'Yes', NULL, '0000-00-00 00:00:00'),
(119, 'Lesotho', 'ليسوتو', 'LS', 'LSO', 'Yes', NULL, '0000-00-00 00:00:00'),
(120, 'Liberia', 'ليبيريا', 'LR', 'LBR', 'Yes', NULL, '0000-00-00 00:00:00'),
(121, 'Libyan Arab Jamahiriya', '', 'LY', 'LBY', 'Yes', NULL, '0000-00-00 00:00:00'),
(122, 'Liechtenstein', 'ليختنشتاين', 'LI', 'LIE', 'Yes', NULL, '0000-00-00 00:00:00'),
(123, 'Lithuania', 'ليتوانيا', 'LT', 'LTU', 'Yes', NULL, '0000-00-00 00:00:00'),
(124, 'Luxembourg', 'لوكسمبورغ', 'LU', 'LUX', 'Yes', NULL, '0000-00-00 00:00:00'),
(125, 'Macau', '', 'MO', 'MAC', 'Yes', NULL, '0000-00-00 00:00:00'),
(126, 'FYROM', '', 'MK', 'MKD', 'Yes', NULL, '0000-00-00 00:00:00'),
(127, 'Madagascar', 'مدغشقر', 'MG', 'MDG', 'Yes', NULL, '0000-00-00 00:00:00'),
(128, 'Malawi', 'ملاوي', 'MW', 'MWI', 'Yes', NULL, '0000-00-00 00:00:00'),
(129, 'Malaysia', 'ماليزيا', 'MY', 'MYS', 'Yes', NULL, '0000-00-00 00:00:00'),
(130, 'Maldives', 'جزر المالديف', 'MV', 'MDV', 'Yes', NULL, '0000-00-00 00:00:00'),
(131, 'Mali', 'مالي', 'ML', 'MLI', 'Yes', NULL, '0000-00-00 00:00:00'),
(132, 'Malta', 'مالطا', 'MT', 'MLT', 'Yes', NULL, '0000-00-00 00:00:00'),
(133, 'Marshall Islands', 'جزيرة مارشال', 'MH', 'MHL', 'Yes', NULL, '0000-00-00 00:00:00'),
(134, 'Martinique', 'مارتينيك', 'MQ', 'MTQ', 'Yes', NULL, '0000-00-00 00:00:00'),
(135, 'Mauritania', 'موريتانيا', 'MR', 'MRT', 'Yes', NULL, '0000-00-00 00:00:00'),
(136, 'Mauritius', 'موريشيوس', 'MU', 'MUS', 'Yes', NULL, '0000-00-00 00:00:00'),
(137, 'Mayotte', '', 'YT', 'MYT', 'Yes', NULL, '0000-00-00 00:00:00'),
(138, 'Mexico', 'المكسيك', 'MX', 'MEX', 'Yes', NULL, '0000-00-00 00:00:00'),
(139, 'Micronesia, Federated States of', '', 'FM', 'FSM', 'Yes', NULL, '0000-00-00 00:00:00'),
(140, 'Moldova, Republic of', '', 'MD', 'MDA', 'Yes', NULL, '0000-00-00 00:00:00'),
(141, 'Monaco', 'موناكو', 'MC', 'MCO', 'Yes', NULL, '0000-00-00 00:00:00'),
(142, 'Mongolia', 'منغوليا', 'MN', 'MNG', 'Yes', NULL, '0000-00-00 00:00:00'),
(143, 'Montserrat', '', 'MS', 'MSR', 'Yes', NULL, '0000-00-00 00:00:00'),
(144, 'Morocco', 'المغرب', 'MA', 'MAR', 'Yes', NULL, '0000-00-00 00:00:00'),
(145, 'Mozambique', 'موزمبيق', 'MZ', 'MOZ', 'Yes', NULL, '0000-00-00 00:00:00'),
(146, 'Myanmar', '', 'MM', 'MMR', 'Yes', NULL, '0000-00-00 00:00:00'),
(147, 'Namibia', 'ناميبيا', 'NA', 'NAM', 'Yes', NULL, '0000-00-00 00:00:00'),
(148, 'Nauru', '', 'NR', 'NRU', 'Yes', NULL, '0000-00-00 00:00:00'),
(149, 'Nepal', 'نيبال', 'NP', 'NPL', 'Yes', NULL, '0000-00-00 00:00:00'),
(150, 'Netherlands', 'هولندا', 'NL', 'NLD', 'Yes', NULL, '0000-00-00 00:00:00'),
(151, 'Netherlands Antilles', 'انتيليز هولند', 'AN', 'ANT', 'Yes', NULL, '0000-00-00 00:00:00'),
(152, 'New Caledonia', 'كاليدونيا الجديدة', 'NC', 'NCL', 'Yes', NULL, '0000-00-00 00:00:00'),
(153, 'New Zealand', 'نيوزلندة', 'NZ', 'NZL', 'Yes', NULL, '0000-00-00 00:00:00'),
(154, 'Nicaragua', 'نيكاراغوا', 'NI', 'NIC', 'Yes', NULL, '0000-00-00 00:00:00'),
(155, 'Niger', 'النيجر', 'NE', 'NER', 'Yes', NULL, '0000-00-00 00:00:00'),
(156, 'Nigeria', 'نيجيريا', 'NG', 'NGA', 'Yes', NULL, '0000-00-00 00:00:00'),
(157, 'Niue', '', 'NU', 'NIU', 'Yes', NULL, '0000-00-00 00:00:00'),
(158, 'Norfolk Island', '', 'NF', 'NFK', 'Yes', NULL, '0000-00-00 00:00:00'),
(159, 'Northern Mariana Islands', '', 'MP', 'MNP', 'Yes', NULL, '0000-00-00 00:00:00'),
(160, 'Norway', 'النرويج', 'NO', 'NOR', 'Yes', NULL, '0000-00-00 00:00:00'),
(161, 'Oman', 'عمان', 'OM', 'OMN', 'Yes', NULL, '0000-00-00 00:00:00'),
(162, 'Pakistan', 'باكستان', 'PK', 'PAK', 'Yes', NULL, '0000-00-00 00:00:00'),
(163, 'Palau', 'بالاو', 'PW', 'PLW', 'Yes', NULL, '0000-00-00 00:00:00'),
(164, 'Panama', 'بناما', 'PA', 'PAN', 'Yes', NULL, '0000-00-00 00:00:00'),
(165, 'Papua New Guinea', 'جنوا الجديدة', 'PG', 'PNG', 'Yes', NULL, '0000-00-00 00:00:00'),
(166, 'Paraguay', 'باراغواي', 'PY', 'PRY', 'Yes', NULL, '0000-00-00 00:00:00'),
(167, 'Peru', 'بيرو', 'PE', 'PER', 'Yes', NULL, '0000-00-00 00:00:00'),
(168, 'Philippines', 'الفلبين', 'PH', 'PHL', 'Yes', NULL, '0000-00-00 00:00:00'),
(169, 'Pitcairn', '', 'PN', 'PCN', 'Yes', NULL, '0000-00-00 00:00:00'),
(170, 'Poland', 'بولندا', 'PL', 'POL', 'Yes', NULL, '0000-00-00 00:00:00'),
(171, 'Portugal', 'البرتغال', 'PT', 'PRT', 'Yes', NULL, '0000-00-00 00:00:00'),
(172, 'Puerto Rico', '', 'PR', 'PRI', 'Yes', NULL, '0000-00-00 00:00:00'),
(173, 'Qatar', 'قطر', 'QA', 'QAT', 'Yes', NULL, '0000-00-00 00:00:00'),
(174, 'Reunion', 'رونيون', 'RE', 'REU', 'Yes', NULL, '0000-00-00 00:00:00'),
(175, 'Romania', 'رومانيا', 'RO', 'ROM', 'Yes', NULL, '0000-00-00 00:00:00'),
(176, 'Russian Federation', '', 'RU', 'RUS', 'Yes', NULL, '0000-00-00 00:00:00'),
(177, 'Rwanda', 'رواندا', 'RW', 'RWA', 'Yes', NULL, '0000-00-00 00:00:00'),
(178, 'Saint Kitts and Nevis', '', 'KN', 'KNA', 'Yes', NULL, '0000-00-00 00:00:00'),
(179, 'Saint Lucia', 'سينت لوسيا', 'LC', 'LCA', 'Yes', NULL, '0000-00-00 00:00:00'),
(180, 'Saint Vincent and the Grenadines', '', 'VC', 'VCT', 'Yes', NULL, '0000-00-00 00:00:00'),
(181, 'Samoa', '', 'WS', 'WSM', 'Yes', NULL, '0000-00-00 00:00:00'),
(182, 'San Marino', 'سان مارينو', 'SM', 'SMR', 'Yes', NULL, '0000-00-00 00:00:00'),
(183, 'Sao Tome and Principe', 'ساو تومي وبرينسيبي', 'ST', 'STP', 'Yes', NULL, '0000-00-00 00:00:00'),
(184, 'Saudi Arabia', 'السعودية', 'SA', 'SAU', 'Yes', NULL, '0000-00-00 00:00:00'),
(185, 'Senegal', 'السنغال', 'SN', 'SEN', 'Yes', NULL, '0000-00-00 00:00:00'),
(186, 'Seychelles', 'سيشيل', 'SC', 'SYC', 'Yes', NULL, '0000-00-00 00:00:00'),
(187, 'Sierra Leone', 'سيراليون', 'SL', 'SLE', 'Yes', NULL, '0000-00-00 00:00:00'),
(188, 'Singapore', 'سنغافورة', 'SG', 'SGP', 'Yes', NULL, '0000-00-00 00:00:00'),
(189, 'Slovak Republic', '', 'SK', 'SVK', 'Yes', NULL, '0000-00-00 00:00:00'),
(190, 'Slovenia', 'سلوفينيا', 'SI', 'SVN', 'Yes', NULL, '0000-00-00 00:00:00'),
(191, 'Solomon Islands', 'جزر سليمان', 'SB', 'SLB', 'Yes', NULL, '0000-00-00 00:00:00'),
(192, 'Somalia', 'الصومال', 'SO', 'SOM', 'Yes', NULL, '0000-00-00 00:00:00'),
(193, 'South Africa', 'جنوب أفريقيا', 'ZA', 'ZAF', 'Yes', NULL, '0000-00-00 00:00:00'),
(194, 'South Georgia &amp; South Sandwich Islands', '', 'GS', 'SGS', 'Yes', NULL, '0000-00-00 00:00:00'),
(195, 'Spain', 'إسبانيا', 'ES', 'ESP', 'Yes', NULL, '0000-00-00 00:00:00'),
(196, 'Sri Lanka', '', 'LK', 'LKA', 'Yes', NULL, '0000-00-00 00:00:00'),
(197, 'St. Helena', '', 'SH', 'SHN', 'Yes', NULL, '0000-00-00 00:00:00'),
(198, 'St. Pierre and Miquelon', '', 'PM', 'SPM', 'Yes', NULL, '0000-00-00 00:00:00'),
(199, 'Sudan', 'سودان', 'SD', 'SDN', 'Yes', NULL, '0000-00-00 00:00:00'),
(200, 'Suriname', 'سورينام', 'SR', 'SUR', 'Yes', NULL, '0000-00-00 00:00:00'),
(201, 'Svalbard and Jan Mayen Islands', '', 'SJ', 'SJM', 'Yes', NULL, '0000-00-00 00:00:00'),
(202, 'Swaziland', 'سوازيلاند', 'SZ', 'SWZ', 'Yes', NULL, '0000-00-00 00:00:00'),
(203, 'Sweden', 'السويد', 'SE', 'SWE', 'Yes', NULL, '0000-00-00 00:00:00'),
(204, 'Switzerland', 'سويسرا', 'CH', 'CHE', 'Yes', NULL, '0000-00-00 00:00:00'),
(205, 'Syrian Arab Republic', '', 'SY', 'SYR', 'Yes', NULL, '0000-00-00 00:00:00'),
(206, 'Taiwan', 'تايوان', 'TW', 'TWN', 'Yes', NULL, '0000-00-00 00:00:00'),
(207, 'Tajikistan', 'طاجاكستان', 'TJ', 'TJK', 'Yes', NULL, '0000-00-00 00:00:00'),
(208, 'Tanzania, United Republic of', '', 'TZ', 'TZA', 'Yes', NULL, '0000-00-00 00:00:00'),
(209, 'Thailand', 'تايلاند', 'TH', 'THA', 'Yes', NULL, '0000-00-00 00:00:00'),
(210, 'Togo', 'توغو', 'TG', 'TGO', 'Yes', NULL, '0000-00-00 00:00:00'),
(211, 'Tokelau', '', 'TK', 'TKL', 'Yes', NULL, '0000-00-00 00:00:00'),
(212, 'Tonga', 'تونغا', 'TO', 'TON', 'Yes', NULL, '0000-00-00 00:00:00'),
(213, 'Trinidad and Tobago', '', 'TT', 'TTO', 'Yes', NULL, '0000-00-00 00:00:00'),
(214, 'Tunisia', 'تونس', 'TN', 'TUN', 'Yes', NULL, '0000-00-00 00:00:00'),
(215, 'Turkey', 'تركيا', 'TR', 'TUR', 'Yes', NULL, '0000-00-00 00:00:00'),
(216, 'Turkmenistan', 'تركمانستان', 'TM', 'TKM', 'Yes', NULL, '0000-00-00 00:00:00'),
(217, 'Turks and Caicos Islands', 'جزر تركس وكايكوس', 'TC', 'TCA', 'Yes', NULL, '0000-00-00 00:00:00'),
(218, 'Tuvalu', 'توفالو', 'TV', 'TUV', 'Yes', NULL, '0000-00-00 00:00:00'),
(219, 'Uganda', 'أوغندا', 'UG', 'UGA', 'Yes', NULL, '0000-00-00 00:00:00'),
(220, 'Ukraine', 'أوكرانيا', 'UA', 'UKR', 'Yes', NULL, '0000-00-00 00:00:00'),
(221, 'United Arab Emirates', 'الأمارات العربية المتحدة', 'AE', 'ARE', 'Yes', NULL, '0000-00-00 00:00:00'),
(222, 'United Kingdom', 'المملكة المتحدة', 'GB', 'GBR', 'Yes', NULL, '0000-00-00 00:00:00'),
(223, 'United States', '', 'US', 'USA', 'Yes', NULL, '0000-00-00 00:00:00'),
(224, 'United States Minor Outlying Islands', '', 'UM', 'UMI', 'Yes', NULL, '0000-00-00 00:00:00'),
(225, 'Uruguay', 'أوروغواي', 'UY', 'URY', 'Yes', NULL, '0000-00-00 00:00:00'),
(226, 'Uzbekistan', 'أوزبكستان', 'UZ', 'UZB', 'Yes', NULL, '0000-00-00 00:00:00'),
(227, 'Vanuatu', 'فانواتو', 'VU', 'VUT', 'Yes', NULL, '0000-00-00 00:00:00'),
(228, 'Vatican City State (Holy See)', '', 'VA', 'VAT', 'Yes', NULL, '0000-00-00 00:00:00'),
(229, 'Venezuela', 'فنزويلا', 'VE', 'VEN', 'Yes', NULL, '0000-00-00 00:00:00'),
(230, 'Viet Nam', '', 'VN', 'VNM', 'Yes', NULL, '0000-00-00 00:00:00'),
(231, 'Virgin Islands (British)', '', 'VG', 'VGB', 'Yes', NULL, '0000-00-00 00:00:00'),
(232, 'Virgin Islands (U.S.)', '', 'VI', 'VIR', 'Yes', NULL, '0000-00-00 00:00:00'),
(233, 'Wallis and Futuna Islands', '', 'WF', 'WLF', 'Yes', NULL, '0000-00-00 00:00:00'),
(234, 'Western Sahara', 'الصحراء الغربية', 'EH', 'ESH', 'Yes', NULL, '0000-00-00 00:00:00'),
(235, 'Yemen', 'اليمن', 'YE', 'YEM', 'Yes', NULL, '0000-00-00 00:00:00'),
(236, 'Yugoslavia', '', 'YU', 'YUG', 'Yes', NULL, '0000-00-00 00:00:00'),
(237, 'Democratic Republic of Congo', '', 'CD', 'COD', 'Yes', NULL, '0000-00-00 00:00:00'),
(238, 'Zambia', 'زامبيا', 'ZM', 'ZMB', 'Yes', NULL, '0000-00-00 00:00:00'),
(239, 'Zimbabwe', 'زيمبابوي', 'ZW', 'ZWE', 'Yes', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `donator`
--

DROP TABLE IF EXISTS `donator`;
CREATE TABLE IF NOT EXISTS `donator` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` enum('Mr.','Mrs.','Miss','Ms.') NOT NULL DEFAULT 'Mr.',
  `fullname` varchar(255) NOT NULL,
  `ssn` varchar(32) NOT NULL,
  `gender` enum('Male','Female') NOT NULL DEFAULT 'Male',
  `email` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `home_phone` varchar(17) NOT NULL,
  `work_phone` varchar(17) NOT NULL,
  `mobile` varchar(17) NOT NULL,
  `nationality_id` int(11) unsigned NOT NULL,
  `organization_id` int(11) unsigned NOT NULL,
  `organization_branch_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `personal_photo_path` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `notes` varchar(1024) NOT NULL,
  `options` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ssn` (`ssn`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `nationality_id` (`nationality_id`),
  KEY `organization_id` (`organization_id`),
  KEY `organization_branch_id` (`organization_branch_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `number_of_days` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `event_type_id` int(11) unsigned NOT NULL,
  `country_id` int(11) unsigned NOT NULL,
  `city_id` int(11) unsigned NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` enum('Draft','In Progress','Completed','Canceled') NOT NULL DEFAULT 'Draft',
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `published` enum('Yes','No') NOT NULL DEFAULT 'No',
  `approved` enum('Yes','No') NOT NULL DEFAULT 'No',
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `notes` varchar(1024) NOT NULL,
  `options` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `event_type_id` (`event_type_id`),
  KEY `country_id` (`country_id`),
  KEY `city_id` (`city_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_activity`
--

DROP TABLE IF EXISTS `event_activity`;
CREATE TABLE IF NOT EXISTS `event_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_agenda`
--

DROP TABLE IF EXISTS `event_agenda`;
CREATE TABLE IF NOT EXISTS `event_agenda` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_time` time NOT NULL DEFAULT '00:00:00',
  `end_time` time NOT NULL DEFAULT '00:00:00',
  `venue_name` varchar(255) NOT NULL,
  `day_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_photo`
--

DROP TABLE IF EXISTS `event_photo`;
CREATE TABLE IF NOT EXISTS `event_photo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) unsigned NOT NULL,
  `source_path` varchar(255) NOT NULL,
  `source_url` varchar(255) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
CREATE TABLE IF NOT EXISTS `event_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `organization_id`, `title`, `description`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'مؤتمر', 'تجمع تحت عنوان أو موضوع محدد يُدعى إليه المتخصصون في مجال ما ويُقدّمون أبحاثاً وأوراقَ عمل تعالج قضية ما من قضايا المؤتمر', 1, '2014-05-24 10:53:57', NULL),
(2, 1, 'حلقة نقاشية', 'تتشابه الحلقة النقاشية مع  الدورة التدريبية الإعتادية، وتتميز بكثافة النقاش بين المشاركين في الدورة حول أمور محددة مسبقا، و تؤدي إلى نتائج يتفق عليها المشاركين لاحقا. و تعتبر الحلقات النقاشية من الأساليب التدريبية الفعالة و المؤثرة إيجابيا في تقبل المشاركين لما يتم طرحه من أفكار', 1, '2014-05-24 10:53:57', NULL),
(3, 1, 'ندوة', 'حلقة نقاش بين عدد من المتخصصين في موضوع محدد', 1, '2014-05-24 11:17:16', NULL),
(4, 1, 'معرض', 'بهدف عرض مواد عينية', 1, '2014-05-24 11:18:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mail_attachment`
--

DROP TABLE IF EXISTS `mail_attachment`;
CREATE TABLE IF NOT EXISTS `mail_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mail_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(5) NOT NULL,
  `size` int(11) unsigned NOT NULL,
  `source_path` varchar(255) NOT NULL,
  `source_url` varchar(255) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_id` (`mail_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mail_inbox`
--

DROP TABLE IF EXISTS `mail_inbox`;
CREATE TABLE IF NOT EXISTS `mail_inbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) unsigned NOT NULL,
  `mail_type_id` int(11) unsigned NOT NULL,
  `number` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `from_department` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `received_at` datetime NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `mail_attachment_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `mail_type_id` (`mail_type_id`),
  KEY `owner_id` (`owner_id`),
  KEY `mail_attachment_id` (`mail_attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mail_outbox`
--

DROP TABLE IF EXISTS `mail_outbox`;
CREATE TABLE IF NOT EXISTS `mail_outbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) unsigned NOT NULL,
  `mail_type_id` int(11) unsigned NOT NULL,
  `mail_template_id` int(11) unsigned NOT NULL,
  `number` varchar(255) NOT NULL,
  `from_mail` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `from_department` varchar(255) NOT NULL,
  `to_mail` varchar(255) NOT NULL,
  `to_name` varchar(255) NOT NULL,
  `to_department` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `send_at` datetime NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `mail_type_id` (`mail_type_id`),
  KEY `mail_template_id` (`mail_template_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mail_template`
--

DROP TABLE IF EXISTS `mail_template`;
CREATE TABLE IF NOT EXISTS `mail_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) unsigned NOT NULL,
  `mail_type_id` int(11) unsigned NOT NULL,
  `number` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `from_department` varchar(255) NOT NULL,
  `to_name` varchar(255) NOT NULL,
  `to_department` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `mail_type_id` (`mail_type_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mail_type`
--

DROP TABLE IF EXISTS `mail_type`;
CREATE TABLE IF NOT EXISTS `mail_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mail_type`
--

INSERT INTO `mail_type` (`id`, `organization_id`, `title`, `description`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'مراسلات داخلية', 'هذا البريد خاص بالمراسلات الداخلية للمؤسسة', 1, '2014-05-24 10:34:59', NULL),
(2, 1, 'مراسلات المحسنين', 'هذا البريد خاص بالمراسلات مع المحسنين بشكل مباشر', 1, '2014-05-24 10:34:59', NULL),
(3, 1, 'مراسلات الوكلاء', 'هذا البريد خاص بالمراسلات مع الوكلاء بشكل مباشر', 1, '2014-05-24 10:36:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
CREATE TABLE IF NOT EXISTS `Message` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(16) NOT NULL DEFAULT '',
  `translation` text,
  `remote_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Message`
--

INSERT INTO `Message` (`id`, `language`, `translation`, `remote_address`, `created_at`, `updated_at`) VALUES
(1, 'ar', '{attribute} يجب تعبئتها', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'ar', '{attribute} يجب أن يكون {true} أو {false}.', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'ar', 'الرئيسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'ar', 'المعلومات الرئيسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'ar', 'تسجيل مستفيد جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'ar', 'قائمة جميع المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'ar', 'إدارة شؤون المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'ar', 'تصنيفات المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'ar', 'إدارة الفقراء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'ar', 'إدارة شؤون ذوي الاحتياجات الخاصة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'ar', 'إدارة الأيتام ', '', '0000-00-00 00:00:00', '2014-05-25 13:03:18'),
(13, 'ar', 'إدارة الطلبة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'ar', 'إدارة المراحل الدراسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'ar', 'إدارة المعلمين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'ar', 'إدارة شؤون الأرامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'ar', 'التفاصيل المشتركة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'ar', 'إدارة الدراسات الميدانية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'ar', 'إدارة المعلومات المادية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'ar', 'إدارة العلاقات اﻷسرية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'ar', 'إدارة أفراد الأسر', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'ar', 'إدارة أرباب الأسر', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'ar', 'إدارة المعلومات المادية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'ar', 'الفعاليات والمهام', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'ar', 'إدارة الفعاليات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'ar', 'إدارة جدول أعمال الفعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'ar', 'إدارة أنشطة الفعاليات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'ar', 'إدارة صور الفعاليات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'ar', 'إدارة أنواع الفعاليات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'ar', 'إدارة المهام', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'ar', 'البريد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'ar', 'إدارة المواقع', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'ar', 'إدارة البريد الوارد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'ar', 'إدارة البريد الصادر', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'ar', 'إدارة المرفقات البريدية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'ar', 'إدارة القوالب البريدية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'ar', 'إدارة أنواع البريد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'ar', 'المتبرعين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'ar', 'تسجيل متبرع جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'ar', 'قائمة جميع المتبرعين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'ar', 'إدارة شؤون المتبرعين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'ar', 'المشاريع', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'ar', 'إدارة المساجد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'ar', 'إدارة شؤون وكلاء المساجد ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'ar', 'إدارة صور المساجد ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'ar', 'إدارة أنواع المساجد ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'ar', 'إدارة الآبار', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'ar', 'إدارة شؤون وكلاء الآبار', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'ar', 'إدارة صور اﻵبار', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'ar', 'إدارة أنواع اﻵبار', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'ar', 'إدارة معلومات المنظمة ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'ar', 'تسجيل منظمة جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'ar', 'قائمة جميع المنظمات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'ar', 'إدارة شؤون المنظمات ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'ar', 'معلومات تفصيلية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'ar', 'إدارة فروع المنظمة ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'ar', 'إدارة ربط الدول', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'ar', 'إدارة ربط اللجان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'ar', 'إدارة ربط المستخدمين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'ar', 'إدارة الوظائف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'ar', 'إدارة أنواع المنظمات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'ar', 'إدارة الصلاحيات والتحكم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'ar', 'إدارة شؤون المستخدمين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'ar', 'إدارة صلاحيات المستخدمين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'ar', 'إدارة مستويات الصلاحية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'ar', 'إدارة خيارات مستويات الصلاحية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'ar', 'الإعدادات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'ar', 'إدارة الدول', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'ar', 'إدارة المدن', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'ar', 'إدارة الترجمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'ar', 'تسجيل الدخول', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'ar', 'تسجيل الخروج', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'ar', 'عدم القدرة على تنفيذ الطلب "{route}".', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'ar', 'الصفحة الرئيسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'ar', 'بدعم من {yii}.', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'ar', 'إنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'ar', 'قائمة المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'ar', 'إدارة شؤون المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'ar', 'تسجيل مستفيد جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'ar', 'الحقول المميزة بـ <span class="required">*</span>مطلوبة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'ar', 'الاسم الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'ar', 'الرقم الوطني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'ar', 'الجنس', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'ar', 'تاريخ الميلاد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'ar', 'البريد الالكتروني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'ar', 'رقم هاتف المنزل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'ar', 'رقم الهاتف المتنقل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'ar', 'الصورة الشخصية ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'ar', 'الجنسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'ar', 'الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'ar', 'المدينة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'ar', 'أنواع المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'ar', 'هل لديه رب أسرة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'ar', 'هل لديه افراد العائلة ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'ar', 'هل لديه منزل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'ar', 'هل لديه دخل ثابت', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'ar', 'فرع المنظمة ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'ar', 'المتبرع', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'ar', 'الملاحظات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'ar', 'الخيارات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'ar', 'ذكر', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'ar', 'انثى', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'ar', 'طالب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'ar', 'يتيم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'ar', 'فقير', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'ar', 'ارملة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'ar', 'عاجز', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'ar', 'معلم ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'ar', 'أخرى', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'ar', 'نعم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'ar', 'لا', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'ar', 'يرجى إصلاح أخطاء الإدخال التالية :', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'ar', 'لا توجد نتائج .', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'ar', '&lt;&lt; الأول', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'ar', 'الأخير &gt;&gt;', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'ar', 'إدارة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'ar', 'إدارة شؤون المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'ar', 'تستطيع ان تختار احد ادوات المقارنة التالية  (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>\nor <b>=</b>) في بداية كل بحث لتحديد كيفية المقارنة.', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'ar', 'بحث متقدم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'ar', 'بحث ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'ar', 'عرض', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'ar', 'تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'ar', 'حذف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'ar', 'هل أنت متأكد أنك تريد حذف هذا السجل؟', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'ar', 'حدث خطأ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'ar', 'حدث خطأ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'ar', 'تستطيع ان تختار احد ادوات المقارنة التالية  (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>\nor <b>=</b>) في بداية كل بحث لتحديد كيفية المقارنة.', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'ar', 'قائمة المتبرعين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'ar', 'إدارة شؤون المتبرع', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'ar', 'تسجيل متبرع جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'ar', 'السيد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'ar', 'السيدة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'ar', 'السيدة/الآنسة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'ar', 'اﻵنسة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'ar', 'الاسم الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'ar', 'الرقم الوطني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'ar', 'الجنس', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'ar', 'البريد الالكتروني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'ar', 'تاريخ الميلاد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'ar', 'هاتف المنزل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'ar', 'رقم هاتف العمل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'ar', 'رقم الهاتف المتنقل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'ar', 'الجنسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'ar', 'فرع المنظمة ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'ar', 'الصورة الشخصية ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'ar', 'الملاحظات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'ar', 'الخيارات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'ar', 'الفقراء المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'ar', 'تسجيل فقير جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'ar', 'إدارة الفقراء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'ar', 'قائمة الفقراء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'ar', 'اسم الأب الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'ar', 'هل الأب على قيد الحياة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'ar', 'وظيفة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'ar', 'تاريخ ميلاد الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'ar', 'تاريخ وفاة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'ar', 'سبب وفاة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'ar', 'شهادة وفاة الأب ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'ar', 'اسم الأم الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'ar', 'هل الأم على قيد الحياة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'ar', 'عمل الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'ar', 'تاريخ ميلاد الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'ar', 'تاريخ وفاة الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'ar', 'سبب وفاة الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'ar', 'شهادة وفاة الأم ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'ar', 'عدد الإخوة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'ar', 'عدد الأخوات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'ar', 'إدارة الفقراء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'ar', 'حدث خطأ، الرجاء المحاولة مرة أخرى', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'ar', 'النظام غير قادر على ايجاد طلبك. "{action}".', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'ar', 'ذوي الاحتياجات الخاصة من المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'ar', 'تسجيل ذوي احتياجات خاصة جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'ar', 'إدارة ذوي الاحتياجات الخاصة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'ar', 'قائمة ذوي الاحتياجات الخاصة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'ar', 'اسم الأب الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'ar', 'هل الأب على قيد الحياة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'ar', 'وظيفة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'ar', 'تاريخ ميلاد الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'ar', 'تاريخ وفاة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'ar', 'سبب وفاة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'ar', 'شهادة وفاة الأب ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'ar', 'اسم الأم الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'ar', 'هل الأم على قيد  الحياة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'ar', 'عمل الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'ar', 'تاريخ ميلاد الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'ar', 'تاريخ وفاة الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'ar', 'سبب وفاة الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'ar', 'شهادة وفاة الأم ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'ar', 'عدد الإخوة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'ar', 'عدد الأخوات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'ar', 'نوع العجز', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'ar', 'سبب العجز', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'ar', 'وصف العجز', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'ar', 'جسدي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'ar', 'عقلي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'ar', 'اجتماعي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'ar', 'وراثي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'ar', 'خلل في الحمل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'ar', 'خلل في الولادة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'ar', 'عدوى', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'ar', 'حادث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'ar', 'بيئي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'ar', 'قائمة ذوي الاحتياجات الخاصة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'ar', 'تسجيل ذوي احتياجات خاصة جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'ar', 'إدارة ذوي الاحتياجات الخاصة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'ar', 'المستفيدين الأيتام', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'ar', 'تسجيل يتيم جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'ar', 'إدارة الأيتام', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'ar', 'قائمة الأيتام', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'ar', 'اسم الأب الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'ar', 'هل الأب على قيد الحياة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'ar', 'وظيفة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'ar', 'تاريخ ميلاد الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'ar', 'تاريخ وفاة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'ar', 'سبب وفاة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'ar', 'شهادة وفاة الأب ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'ar', 'اسم الأم الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'ar', 'هل الأم على قيد  الحياة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'ar', 'عمل الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'ar', 'تاريخ ميلاد الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'ar', 'تاريخ وفاة الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'ar', 'سبب وفاة الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'ar', 'شهادة وفاة الأم ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'ar', 'عدد الإخوة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'ar', 'عدد الأخوات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 'ar', 'إدارة الأيتام', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'ar', 'الطلبة المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'ar', 'تسجيل طالب جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'ar', 'إدارة الطلبة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'ar', 'قائمة الطلبة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'ar', 'اسم الأب الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'ar', 'هل الأب على قيد الحياة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'ar', 'وظيفة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'ar', 'تاريخ ميلاد الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'ar', 'تاريخ وفاة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'ar', 'سبب وفاة الأب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'ar', 'شهادة وفاة الأب ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 'ar', 'اسم الأم الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 'ar', 'هل الأم على قيد  الحياة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 'ar', 'عمل الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 'ar', 'تاريخ ميلاد الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 'ar', 'تاريخ وفاة الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'ar', 'سبب وفاة الأم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'ar', 'شهادة وفاة الأم ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 'ar', 'عدد الإخوة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'ar', 'عدد الأخوات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 'ar', 'إدارة الطلبة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'ar', 'المراحل الدراسية للمستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'ar', 'تسجيل مرحلة دراسية جديدة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'ar', 'إدارة المراحل الدراسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 'ar', 'قائمة المراحل الدراسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'ar', 'إدارة المراحل الدراسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'ar', 'اسم الفئة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 'ar', 'التخصص', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'ar', 'اسم المدرسة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'ar', 'تاريخ البدء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 'ar', 'ينتهي بتاريخ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 'ar', 'المعلمين المستفيدين ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 'ar', 'تسجيل معلم جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 'ar', 'إدارة المعلمين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 'ar', 'قائمة المعلمين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 'ar', 'المؤهل العلمي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 'ar', 'إدارة المعلمين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 'ar', 'المستفيدين الأرامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 'ar', 'تسجيل أرملة جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 'ar', 'إدارة الأرامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 'ar', 'قائمة الأرامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 'ar', 'اسم الزوج الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 'ar', 'وظيفة الزوج', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 'ar', 'تاريخ ميلاد الزوج', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 'ar', 'تاريخ وفاة الزوج', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 'ar', 'سبب وفاة الزوج', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 'ar', 'شهادة وفاة الزوج', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 'ar', 'عدد الأبناء الذكور', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 'ar', 'عدد البنات الإناث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 'ar', 'إدارة الأرامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 'ar', 'الدراسات الميدانية للمستفيدين ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 'ar', 'تسجيل دراسة ميدانية جديدة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 'ar', 'إدارة الدراسات الميدانية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 'ar', 'قائمة بالدراسات الميدانية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 'ar', 'متكرر', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 'ar', 'حالة طارئة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 'ar', 'طبي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 'ar', 'تربوي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 'ar', 'نوع الدعم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 'ar', 'فترة الدعم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 'ar', 'فترة الدعم المتوقعة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 'ar', 'كيفية الدعم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 'ar', 'مصدر المعلومات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 'ar', 'هل لديه فكرة مشروع صغير', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 'ar', 'وصف فكرة المشروع الصغير', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 'ar', 'توصيات الباحث ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 'ar', 'اسم الباحث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 'ar', 'الملاحظات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 'ar', 'توصيات اللجنة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 'ar', 'اسم عضو اللجنة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 'ar', 'اسم مدير اللجنة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 'ar', 'دائم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 'ar', 'مرة واحدة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 'ar', 'لحين الشفاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 'ar', 'لحين التخرج', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 'ar', 'نقدية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 'ar', 'العينية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 'ar', 'نقدية وعينية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 'ar', 'متطوع', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 'ar', 'المساعدة باليد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 'ar', 'تدريس أحد أفراد الأسرة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 'ar', 'توظيف أحد أفراد الأسرة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 'ar', 'وثائق رسمية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 'ar', 'زيارة عمل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 'ar', 'زيارة منزلية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 'ar', 'جيران ذوو ثقة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 'ar', 'إدارة الدراسات الميدانية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 'ar', 'الحالة المادية للمستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 'ar', 'تسجيل تقرير مالي جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 'ar', 'إدارة المعلومات المادية للمستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 'ar', 'قائمة المعلومات المادية للمستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 'ar', 'هل لديه بطاقة تأمين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 'ar', 'الدخل من رب الأسرة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 'ar', 'الدخل من أعمال المستفيد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 'ar', 'الدخل من أعمال أفراد الأسرة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 'ar', 'الدخل من عائدات الضمان الاجتماعي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 'ar', 'الدخل من عائدات التقاعد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 'ar', 'الدخل من عائدات الأراضي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 'ar', 'الدخل من الممتلكات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 'ar', 'الدخل من الزراعة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 'ar', 'الدخل من صندوق المعونة الوطنية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 'ar', 'الدخل من صندوق الزكاة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 'ar', 'الدخل من لجان الزكاة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 'ar', 'إجمالي الدخل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 'ar', 'الإنفاق على إيجارالمنزل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 'ar', 'الإنفاق الغذائي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 'ar', 'الإنفاق على الملابس', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 'ar', 'الإنفاق على الدواء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 'ar', 'الإنفاق على التدخين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 'ar', 'الإنفاق على التعليم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 'ar', 'الإنفاق على التنقلات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 'ar', 'الإنفاق على فاتورة الغاز', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 'ar', 'الانفاق على فاتورة المياه ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 'ar', 'الإنفاق على فاتورة الكهرباء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 'ar', 'الإنفاق على الكيروسين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 'ar', 'إنفاقات أخرى', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 'ar', 'الإنفاق الإجمالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 'ar', 'إدارة المعلومات المادية للمستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 'ar', 'علاقات المستفيدين ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 'ar', 'تسجيل علاقة أسرية جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 'ar', 'إدارة العلاقات اﻷسرية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 'ar', 'قائمة العلاقات اﻷسرية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 'ar', 'الاسم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 'ar', 'إدارة العلاقات اﻷسرية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 'ar', 'أفراد عائلة المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 'ar', 'تسجيل فرد عائلة جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 'ar', 'إدارة أفراد الأسر', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 'ar', 'قائمة افراد العائلة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 'ar', 'تسجيل فرد عائلة جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 'ar', 'الاسم الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 'ar', 'الرقم الوطني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 'ar', 'تاريخ الميلاد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 'ar', 'علاقات المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 'ar', 'الحالة الإجتماعية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 'ar', 'الحالة التعليمية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 'ar', 'الحالة الصحية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 'ar', 'طبيعة العمل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 'ar', 'أخرى', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 'ar', 'إدارة أفراد الأسر', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 'ar', 'أرباب أسرالمستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 'ar', 'تسجيل رب أسرة جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 'ar', 'إدارة أرباب الأسر ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 'ar', 'قائمة أرباب الأسر ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 'ar', 'الإسم الأول لرب الأسرة  ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 'ar', 'الإسم الأوسط لرب الأسرة ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 'ar', 'اسم جد رب الأسرة ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 'ar', 'اسم العائلة لرب الأسرة ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 'ar', 'تاريخ ميلاد رب الأسرة  ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 'ar', 'الرقم الوطني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 'ar', 'علاقات المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 'ar', 'إدارة أرباب الأسر ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 'ar', 'منازل المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 'ar', 'تسجيل تقرير منزلي جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 'ar', 'إدارة معلومات المنازل للمستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 'ar', 'قائمة معلومات المنازل للمستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, 'ar', 'اسم المالك', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 'ar', 'نوع البناء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 'ar', 'عدد الغرف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 'ar', 'عدد المقيمين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 'ar', 'نوع العقد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 'ar', 'تكلفة الإيجار ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 'ar', 'نوع الإيجار ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 'ar', 'هل لديه تلفزيون', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, 'ar', 'هل لديه ثلاجة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 'ar', 'هل لديه غسالة ملابس', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 'ar', 'هل لديه حماصة ملابس', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 'ar', 'هل لديه مشغل فيديو', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, 'ar', 'هل لديه الهاتف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 'ar', 'هل لديه جوال', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 'ar', 'هل لديه غاز', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 'ar', 'هل لديه فرن', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, 'ar', 'هل لديه ميكروويف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, 'ar', 'هل لديه تكييف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, 'ar', 'هل لديه سخان مياه بالطاقة الشمسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, 'ar', 'هل لديه سخان مياه كهربائي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 'ar', 'هل لديه سخان الغاز', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 'ar', 'هل لديه سخان كهربائي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, 'ar', 'المستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 'ar', 'مؤجر', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 'ar', 'مملوكة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, 'ar', 'مجاني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, 'ar', 'شهريا', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 'ar', 'فصلي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 'ar', 'سنوي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 'ar', 'إدارة معلومات المنازل للمستفيدين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, 'ar', 'عدد الأيام', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 'ar', 'نوع الفعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 'ar', 'الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, 'ar', 'المدينة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, 'ar', 'الحالة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 'ar', 'يبدأ بتاريخ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, 'ar', 'ينتهي بتاريخ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 'ar', 'تم نشره', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 'ar', 'تم تدقيقه', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, 'ar', 'الملاحظات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 'ar', 'الخيارات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, 'ar', 'مسودة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, 'ar', 'قيد التنفيذ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(512, 'ar', 'إنتهى', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, 'ar', 'ألغي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, 'ar', 'فعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, 'ar', 'يبدأ في الساعة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, 'ar', 'ينتهي في الساعة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, 'ar', 'اسم القاعة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, 'ar', 'رقم اليوم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, 'ar', 'فعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, 'ar', 'فعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 'ar', 'حجم الملف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, 'ar', 'الصورة – PATH', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, 'ar', 'الصورة – URL', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `Message` (`id`, `language`, `translation`, `remote_address`, `created_at`, `updated_at`) VALUES
(539, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, 'ar', 'حدث خطأ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, 'ar', 'حدث خطأ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, 'ar', 'تم قبوله', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 'ar', 'نوع البريد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, 'ar', 'اسم المرسل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(554, 'ar', 'قسم المرسل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(555, 'ar', 'الموضوع', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, 'ar', 'تم استلامه بتاريخ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(557, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, 'ar', 'البريد المرفقات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(560, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(561, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(562, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(563, 'ar', 'نوع البريد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(564, 'ar', 'القالب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(565, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(566, 'ar', 'بريد المرسل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(567, 'ar', 'اسم المرسل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(568, 'ar', 'قسم المرسل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(569, 'ar', 'البريد المرسل إليه', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(570, 'ar', 'اسم المرسل إليه', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(571, 'ar', 'قسم المرسل إليه', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(572, 'ar', 'الموضوع', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(573, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(574, 'ar', 'تم إرساله في', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(575, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(576, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(577, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(578, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(579, 'ar', 'البريد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, 'ar', 'الاسم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(581, 'ar', 'إمتداد الملف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(582, 'ar', 'حجم الملف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(583, 'ar', 'الصورة – PATH', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(584, 'ar', 'الصورة – URL', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(586, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(590, 'ar', 'نوع البريد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(591, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(592, 'ar', 'اسم المرسل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(593, 'ar', 'قسم المرسل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 'ar', 'اسم المرسل إليه', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, 'ar', 'قسم المرسل إليه', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(596, 'ar', 'الموضوع', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(597, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(598, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(599, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(600, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(603, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(604, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(605, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(606, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, 'ar', 'الاسم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(610, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(611, 'ar', 'تاريخ العقد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(612, 'ar', 'صورة العقد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, 'ar', 'نسبة إكتمال البناء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, 'ar', 'المتبرع', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(615, 'ar', 'الوكيل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(616, 'ar', 'نوع المسجد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(617, 'ar', 'الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(618, 'ar', 'المدينة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(621, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(622, 'ar', 'الملاحظات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(623, 'ar', 'الخيارات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, 'ar', 'اسم الشركة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(627, 'ar', 'الاسم الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(628, 'ar', 'الرقم الوطني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(629, 'ar', 'الجنس', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(630, 'ar', 'البريد الالكتروني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, 'ar', 'هاتف المنزل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, 'ar', 'رقم هاتف العمل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(633, 'ar', 'رقم الهاتف المتنقل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(634, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(635, 'ar', 'إسم البنك ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(636, 'ar', 'إسم فرع البنك', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(637, 'ar', 'رقم فرع البنك', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(638, 'ar', 'Swift Code', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, 'ar', 'رقم حساب البنك ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(640, 'ar', 'الصورة الشخصية ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(641, 'ar', 'الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, 'ar', 'المدينة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(644, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(645, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(646, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(647, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, 'ar', 'المسجد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(650, 'ar', 'حجم الملف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(651, 'ar', 'الصورة – PATH', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(652, 'ar', 'الصورة – URL', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(657, 'ar', 'الاسم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(658, 'ar', 'مساحة البناء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(659, 'ar', 'كلفة البناء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, 'ar', 'المدة اللازمة لاكتمال البناء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, 'ar', 'نوع البناء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, 'ar', 'نوع الأثاث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, 'ar', 'عدد المصلين', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(664, 'ar', 'عدد دورات المياه', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, 'ar', 'عدد الطوابق', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, 'ar', 'عدد المداخل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, 'ar', 'هل يوجد مصلى للنساء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, 'ar', 'هل لديه نظام صوتي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(669, 'ar', 'هل لديه تكييف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(670, 'ar', 'الوكيل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(671, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(672, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, 'ar', 'المنظمات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(675, 'ar', 'قائمة المنظمات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(676, 'ar', 'إدارة المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(677, 'ar', 'تسجيل منظمة جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(678, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(679, 'ar', 'نوع المنظمة ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(680, 'ar', 'الاسم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(681, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(683, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(684, 'ar', 'الملاحظات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(685, 'ar', 'الخيارات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(686, 'ar', 'عرض {start}-{end} من 1 نتائج.|عرض {start}-{end} من {count} نتائج.', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, 'ar', 'تحديث المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, 'ar', 'حذف المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, 'ar', 'هل أنت متأكد أنك تريد حذف هذا السجل؟', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, 'ar', 'عرض المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, 'ar', 'لم تحدد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, 'ar', 'إدارة المنظمات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, 'ar', 'تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, 'ar', 'حفظ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(697, 'ar', 'الاسم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, 'ar', 'الموقع الإلكتروني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, 'ar', 'الهاتف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, 'ar', 'الفاكس', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, 'ar', 'رقم الهاتف المتنقل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, 'ar', 'الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, 'ar', 'المدينة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, 'ar', 'المدير', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, 'ar', 'أيام العمل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(708, 'ar', 'ساعات العمل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, 'ar', 'ساعات الإستراحة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, 'ar', 'الموقع الجغرافي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(711, 'ar', 'هل هو فرع رئيسي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(713, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(714, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(716, 'ar', 'فرع المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, 'ar', 'الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, 'ar', '{attribute} يستخدم عدد أحرف أكثر من المسموح (الحد الأقصى  {max} حرف).', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(726, 'ar', 'المؤهلات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(727, 'ar', 'المسؤوليات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, 'ar', 'المستخدم الحالي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(731, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(732, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(733, 'ar', 'الوصف', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(734, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(735, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(736, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(737, 'ar', 'اسم المستخدم ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, 'ar', 'كلمة المرور', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(739, 'ar', 'العنوان', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, 'ar', 'الاسم الكامل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, 'ar', 'الرقم الوطني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, 'ar', 'الجنس', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(743, 'ar', 'البريد الالكتروني', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, 'ar', 'تاريخ الميلاد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, 'ar', 'هاتف المنزل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, 'ar', 'رقم هاتف العمل', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(747, 'ar', 'الهاتف المحلي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, 'ar', 'الهاتف الدولي', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(749, 'ar', 'الجنسية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(750, 'ar', 'المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, 'ar', 'فرع المنظمة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(752, 'ar', 'الصورة الشخصية ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, 'ar', 'الصورة الشخصية ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(754, 'ar', 'تعطيل الحساب', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(755, 'ar', 'آخر تسجيل لتاريخ الدخول', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(756, 'ar', 'آخر تسجيل لعنوان الإنترنت IP', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(757, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(758, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(759, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(760, 'ar', 'المستخدم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(761, 'ar', 'مستوى الصلاحية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(762, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, 'ar', 'الدول', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(765, 'ar', 'تسجيل دولة جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, 'ar', 'إدارة الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(768, 'ar', 'الاسم باللغة الإنجليزية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, 'ar', 'الاسم باللغة العربية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(770, 'ar', 'Iso Code 2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(771, 'ar', 'Iso Code 3', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(772, 'ar', 'تم نشره', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(773, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(774, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(775, 'ar', 'قائمة الدول', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(776, 'ar', 'تحديث الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(777, 'ar', 'حذف الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(778, 'ar', 'عرض الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(779, 'ar', 'المدن', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(780, 'ar', 'تسجيل مدينة جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(781, 'ar', 'إدارة المدينة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(782, 'ar', 'الرقم', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(783, 'ar', 'الدولة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(784, 'ar', 'الاسم باللغة الإنجليزية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(785, 'ar', 'الاسم باللغة العربية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(786, 'ar', 'تم نشره', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(787, 'ar', 'تاريخ الإنشاء', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(788, 'ar', 'تاريخ آخر تحديث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(789, 'ar', 'قائمة المدن', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(790, 'ar', 'تحديث المدينة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(791, 'ar', 'حذف المدينة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(792, 'ar', 'عرض المدينة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(793, 'ar', 'حدث خطأ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(794, 'ar', 'التالي &gt;', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(795, 'ar', '&lt; السابق', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(796, 'ar', 'إذهب الى الصفحة', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(797, 'ar', 'الفعاليات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(798, 'ar', 'تسجيل فعالية/ حدث جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(799, 'ar', 'إدارة فعالية/حدث', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(800, 'ar', 'قائمة الفعاليات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(801, 'ar', 'جدول أعمال الفعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(802, 'ar', 'تسجيل جدول أعمال جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(803, 'ar', 'إدارة جدول أعمال الفعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(804, 'ar', 'قائمة جداول الأعمال ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(805, 'ar', 'إدارة جداول أعمال الفعاليات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(806, 'ar', 'أنشطة الفعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(807, 'ar', 'تسجيل نشاط جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(808, 'ar', 'إدارة نشاط الفعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(809, 'ar', 'قائمة أنشطة الفعاليات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(810, 'ar', 'صور الفعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(811, 'ar', 'تسجيل صور جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(812, 'ar', 'إدارة صور الفعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(813, 'ar', 'قائمة صور الفعاليات', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(814, 'ar', 'أنواع الفعاليات ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(815, 'ar', 'تسجيل نوع فعالية جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(816, 'ar', 'إدارة نوع الفعالية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(817, 'ar', 'قائمة أنواع الفعاليات ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(818, 'ar', 'تسجيل بريد وارد جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(819, 'ar', 'إدارة البريد الوارد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(820, 'ar', 'صناديق البريد الوارد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(821, 'ar', 'قائمة صندوق البريد الوارد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(822, 'ar', 'إدارة البريد الوارد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(823, 'ar', 'المرفقات البريدية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(824, 'ar', 'تسجيل مرفق بريدي جديد', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(825, 'ar', 'إدارة المرفقات البريدية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(826, 'ar', 'قائمة المرفقات البريدية', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mosque`
--

DROP TABLE IF EXISTS `mosque`;
CREATE TABLE IF NOT EXISTS `mosque` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contract_date` date NOT NULL,
  `contract_photo_path` varchar(255) NOT NULL,
  `construction_progress` int(11) unsigned NOT NULL,
  `donator_id` int(11) unsigned NOT NULL,
  `agent_id` int(11) unsigned NOT NULL,
  `mosque_type_id` int(11) unsigned NOT NULL,
  `country_id` int(11) unsigned NOT NULL,
  `city_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `notes` varchar(1024) NOT NULL,
  `options` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `donator_id` (`donator_id`),
  KEY `agent_id` (`agent_id`),
  KEY `mosque_type_id` (`mosque_type_id`),
  KEY `country_id` (`country_id`),
  KEY `city_id` (`city_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mosque_agent`
--

DROP TABLE IF EXISTS `mosque_agent`;
CREATE TABLE IF NOT EXISTS `mosque_agent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `title` enum('Mr.','Mrs.','Miss','Ms.') NOT NULL DEFAULT 'Mr.',
  `fullname` varchar(255) NOT NULL,
  `ssn` varchar(32) NOT NULL,
  `gender` enum('Male','Female') NOT NULL DEFAULT 'Male',
  `email` varchar(255) NOT NULL,
  `home_phone` varchar(17) NOT NULL,
  `work_phone` varchar(17) NOT NULL,
  `mobile` varchar(17) NOT NULL,
  `address` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_branch_name` varchar(255) NOT NULL,
  `bank_branch_number` varchar(255) NOT NULL,
  `bank_swift_code` varchar(32) NOT NULL,
  `bank_account_number` varchar(255) NOT NULL,
  `personal_photo_path` varchar(255) NOT NULL,
  `country_id` int(11) unsigned NOT NULL,
  `city_id` int(11) unsigned NOT NULL,
  `organization_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ssn` (`ssn`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `country_id` (`country_id`),
  KEY `city_id` (`city_id`),
  KEY `organization_id` (`organization_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mosque_photo`
--

DROP TABLE IF EXISTS `mosque_photo`;
CREATE TABLE IF NOT EXISTS `mosque_photo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mosque_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) unsigned NOT NULL,
  `source_path` varchar(255) NOT NULL,
  `source_url` varchar(255) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mosque_id` (`mosque_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mosque_type`
--

DROP TABLE IF EXISTS `mosque_type`;
CREATE TABLE IF NOT EXISTS `mosque_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `construction_area` float unsigned NOT NULL,
  `construction_cost` float unsigned NOT NULL,
  `construction_time` int(11) NOT NULL,
  `construction_type` varchar(255) NOT NULL,
  `furniture_type` varchar(255) NOT NULL,
  `number_of_people` tinyint(3) NOT NULL,
  `number_of_restrooms` tinyint(3) NOT NULL,
  `number_of_floors` tinyint(3) NOT NULL,
  `number_of_entrances` tinyint(3) NOT NULL,
  `has_female_area` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_sound_system` enum('Yes','No') NOT NULL DEFAULT 'No',
  `has_air_condition` enum('Yes','No') NOT NULL DEFAULT 'No',
  `agent_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
CREATE TABLE IF NOT EXISTS `organization` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_type_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `notes` varchar(1024) NOT NULL,
  `options` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_type_id` (`organization_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`id`, `organization_type_id`, `name`, `description`, `created_at`, `updated_at`, `notes`, `options`) VALUES
(1, 1, 'شق تمرة', 'هذا الحساب خاص بالبحث والتطوير المتعلق بالنظام', '2014-05-24 09:31:33', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `organization_access_level`
--

DROP TABLE IF EXISTS `organization_access_level`;
CREATE TABLE IF NOT EXISTS `organization_access_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization_access_level`
--

INSERT INTO `organization_access_level` (`id`, `organization_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'حساب رئيسي', 'يملك كافة الصلاحيات بدون أي استثناءات', '2014-05-24 09:28:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_access_level_permission`
--

DROP TABLE IF EXISTS `organization_access_level_permission`;
CREATE TABLE IF NOT EXISTS `organization_access_level_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_access_level_id` int(11) unsigned NOT NULL,
  `controller_name` varchar(255) NOT NULL,
  `action_name` varchar(255) NOT NULL,
  `permission` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_access_level_id` (`organization_access_level_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization_access_level_permission`
--

INSERT INTO `organization_access_level_permission` (`id`, `organization_access_level_id`, `controller_name`, `action_name`, `permission`, `created_at`, `updated_at`) VALUES
(1, 1, '*', '*', '*', '2014-05-24 09:29:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_branch`
--

DROP TABLE IF EXISTS `organization_branch`;
CREATE TABLE IF NOT EXISTS `organization_branch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL,
  `website` varchar(255) NOT NULL,
  `phone` varchar(17) NOT NULL,
  `fax` varchar(17) NOT NULL,
  `mobile` varchar(17) NOT NULL,
  `country_id` int(11) unsigned NOT NULL,
  `city_id` int(11) unsigned NOT NULL,
  `adress` varchar(255) NOT NULL,
  `manager_id` int(11) unsigned NOT NULL,
  `work_days` varchar(255) NOT NULL,
  `work_hours` varchar(255) NOT NULL,
  `break_hours` varchar(255) NOT NULL,
  `geo_location` varchar(255) NOT NULL,
  `is_main_branch` enum('Yes','No') NOT NULL DEFAULT 'No',
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `country_id` (`country_id`),
  KEY `city_id` (`city_id`),
  KEY `manager_id` (`manager_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization_branch`
--

INSERT INTO `organization_branch` (`id`, `organization_id`, `name`, `description`, `website`, `phone`, `fax`, `mobile`, `country_id`, `city_id`, `adress`, `manager_id`, `work_days`, `work_hours`, `break_hours`, `geo_location`, `is_main_branch`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'البحث والتطوير', 'هذا الحساب خاص بالبحث والتطوير المتعلق بالنظام', 'http://alsadaqat.com/', '+962797511179', '', '+962797511179', 108, 0, 'عمان', 1, '', '', '', '', 'Yes', 1, '2014-05-24 09:35:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_branch_country`
--

DROP TABLE IF EXISTS `organization_branch_country`;
CREATE TABLE IF NOT EXISTS `organization_branch_country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_branch_id` int(11) unsigned NOT NULL,
  `country_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_branch_id` (`organization_branch_id`),
  KEY `country_id` (`country_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization_branch_country`
--

INSERT INTO `organization_branch_country` (`id`, `organization_branch_id`, `country_id`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 1, 108, 1, '2014-05-24 09:36:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_branch_country_committee`
--

DROP TABLE IF EXISTS `organization_branch_country_committee`;
CREATE TABLE IF NOT EXISTS `organization_branch_country_committee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_branch_country_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL,
  `agenda` varchar(1024) NOT NULL,
  `annual_plan` varchar(1024) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_branch_country_id` (`organization_branch_country_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization_branch_country_committee`
--

INSERT INTO `organization_branch_country_committee` (`id`, `organization_branch_country_id`, `name`, `description`, `agenda`, `annual_plan`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'لجنة التطوير', 'خاصة بتطوير النظام', '', '', 1, '2014-05-24 09:38:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_branch_country_committee_user`
--

DROP TABLE IF EXISTS `organization_branch_country_committee_user`;
CREATE TABLE IF NOT EXISTS `organization_branch_country_committee_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_branch_country_committee_id` int(11) unsigned NOT NULL,
  `organization_user_id` int(11) unsigned NOT NULL,
  `organization_position_id` int(11) unsigned NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_branch_country_committee_id` (`organization_branch_country_committee_id`),
  KEY `organization_user_id` (`organization_user_id`),
  KEY `organization_position_id` (`organization_position_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization_branch_country_committee_user`
--

INSERT INTO `organization_branch_country_committee_user` (`id`, `organization_branch_country_committee_id`, `organization_user_id`, `organization_position_id`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '2014-05-24 09:38:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_position`
--

DROP TABLE IF EXISTS `organization_position`;
CREATE TABLE IF NOT EXISTS `organization_position` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL,
  `qualifications` varchar(255) NOT NULL,
  `responsibilities` varchar(255) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization_position`
--

INSERT INTO `organization_position` (`id`, `organization_id`, `title`, `description`, `qualifications`, `responsibilities`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'المدير العام', '', '', '', 1, '2014-05-24 09:41:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_type`
--

DROP TABLE IF EXISTS `organization_type`;
CREATE TABLE IF NOT EXISTS `organization_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `organization_type`
--

INSERT INTO `organization_type` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'شق تمرة', 'هذا النوع خاص بالمؤسسات التي تستعمل النظام لهدف البحث والتطوير', '2014-05-24 09:24:32', NULL),
(2, 'صندوق الزكاة', 'جميع لجان الزكاة التي تتبع لصندوق الزكاة يجب أن يتم اختيار هذا النوع عند إضافتها إلى النظام.', '2014-05-24 09:24:32', NULL),
(3, 'وزارة التنمية الإجتماعية', 'جميع الجمعيات الخيرية التي تتبع وزارة التنمية الإجتماعية يجب أن يتم اختيار هذا النوع عند إضافتها إلى النظام.', '2014-05-24 09:24:32', NULL),
(4, 'لجان المساجد', 'جميع لجان المساجد التي تعنى بأهل الحي يجب أن يتم اختيار هذا النوع عند إضافتها إلى النظام.', '2014-05-24 09:24:32', NULL),
(5, 'الهيئات العالمية', 'هذا النوع خاص بالهيئات العالمية', '2014-05-24 10:37:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_user`
--

DROP TABLE IF EXISTS `organization_user`;
CREATE TABLE IF NOT EXISTS `organization_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `title` enum('Mr.','Mrs.','Miss','Ms.') NOT NULL DEFAULT 'Mr.',
  `fullname` varchar(255) NOT NULL,
  `ssn` varchar(32) NOT NULL,
  `gender` enum('Male','Female') NOT NULL DEFAULT 'Male',
  `email` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `home_phone` varchar(17) NOT NULL,
  `work_phone` varchar(17) NOT NULL,
  `local_mobile` varchar(17) NOT NULL,
  `international_mobile` varchar(17) NOT NULL,
  `nationality_id` int(11) unsigned NOT NULL,
  `organization_id` int(11) unsigned NOT NULL,
  `organization_branch_id` int(11) unsigned NOT NULL,
  `personal_photo_path` varchar(255) NOT NULL,
  `passport_photo_path` varchar(255) NOT NULL,
  `blocked` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `last_login_date` datetime NOT NULL,
  `last_login_ip` varchar(15) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ssn` (`ssn`),
  UNIQUE KEY `local_mobile` (`local_mobile`),
  UNIQUE KEY `international_mobile` (`international_mobile`),
  UNIQUE KEY `username` (`username`),
  KEY `nationality_id` (`nationality_id`),
  KEY `organization_id` (`organization_id`),
  KEY `organization_branch_id` (`organization_branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization_user`
--

INSERT INTO `organization_user` (`id`, `username`, `password`, `title`, `fullname`, `ssn`, `gender`, `email`, `date_of_birth`, `home_phone`, `work_phone`, `local_mobile`, `international_mobile`, `nationality_id`, `organization_id`, `organization_branch_id`, `personal_photo_path`, `passport_photo_path`, `blocked`, `last_login_date`, `last_login_ip`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'Mr.', 'أنس كامل الفار', '9801017992', 'Male', 'anas@al-far.com', '1980-03-25', '+96265065435', '+962797511179', '+962797511179', '+962797511179', 108, 1, 1, '', '', 'No', '0000-00-00 00:00:00', '127.0.0.1', '2014-05-24 09:44:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_user_access_level`
--

DROP TABLE IF EXISTS `organization_user_access_level`;
CREATE TABLE IF NOT EXISTS `organization_user_access_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `organization_access_level_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `organization_access_level_id` (`organization_access_level_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization_user_access_level`
--

INSERT INTO `organization_user_access_level` (`id`, `user_id`, `organization_access_level_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2014-05-24 09:42:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SourceMessage`
--

DROP TABLE IF EXISTS `SourceMessage`;
CREATE TABLE IF NOT EXISTS `SourceMessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) DEFAULT NULL,
  `message` text,
  `remote_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=832 ;

--
-- Dumping data for table `SourceMessage`
--

INSERT INTO `SourceMessage` (`id`, `category`, `message`, `remote_address`, `created_at`, `updated_at`) VALUES
(1, 'yii', '{attribute} cannot be blank.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(2, 'yii', '{attribute} must be either {true} or {false}.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(3, 'app', 'Dashboard', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(4, 'app', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(5, 'app', 'Manage Main Info', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(6, 'app', 'Create Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(7, 'app', 'List all Beneficiaries', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(8, 'app', 'Manage Beneficiaries', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(9, 'app', 'Manage Specific Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(10, 'app', 'Manage Poors', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(11, 'app', 'Manage Disabled', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(12, 'app', 'Manage Orphan', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(13, 'app', 'Manage Student', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(14, 'app', 'Manage StudentClass', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(15, 'app', 'Manage Teacher', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(16, 'app', 'Manage Widow', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(17, 'app', 'Manage Common Details', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(18, 'app', 'Manage ResearchNotes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(19, 'app', 'Manage Finance State', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(20, 'app', 'Manage Relations', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(21, 'app', 'Manage Family Members', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(22, 'app', 'Manage Paterfamilias', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(23, 'app', 'Manage Home Details', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(24, 'app', 'Events & Tasks', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(25, 'app', 'Manage Events', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(26, 'app', 'Manage Event Agenda', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(27, 'app', 'Manage Event Activities', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(28, 'app', 'Manage Event Photos', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(29, 'app', 'Manage Event Types', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(30, 'app', 'Manage Tasks', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(31, 'app', 'Mail', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(32, 'app', 'Manage Locations', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(33, 'app', 'Manage Mail Inbox', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(34, 'app', 'Manage Mail Outbox', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(35, 'app', 'Manage Mail Attachments', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(36, 'app', 'Manage Mail Templates', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(37, 'app', 'Manage Mail Types', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(38, 'app', 'Donators', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(39, 'app', 'Create Donator', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(40, 'app', 'List all Donators', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(41, 'app', 'Manage Donators', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(42, 'app', 'Projects', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(43, 'app', 'Manage Mosques', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(44, 'app', 'Manage Mosque Agent', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(45, 'app', 'Manage Mosque Photos', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(46, 'app', 'Manage Mosque Types', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(47, 'app', 'Manage Wells', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(48, 'app', 'Manage Wells Agent', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(49, 'app', 'Manage Wells Photos', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(50, 'app', 'Manage Wells Types', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(51, 'app', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(52, 'app', 'Manage Organization Info', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(53, 'app', 'Create Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(54, 'app', 'List all Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(55, 'app', 'Manage Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(56, 'app', 'Manage Organization Details', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(57, 'app', 'Manage Organization Branch', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(58, 'app', 'Manage Organization Branch Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(59, 'app', 'Manage Organization Branch Country Committee', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(60, 'app', 'Manage Organization Branch Country Committee User', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(61, 'app', 'Manage Organization Positions', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(62, 'app', 'Manage Organization Types', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(63, 'app', 'Manage Organization ACL', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(64, 'app', 'Manage Organization Users', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(65, 'app', 'Manage Organization Users Access Level', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(66, 'app', 'Manage Organization Access Level', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(67, 'app', 'Manage Organization Access Level Permission', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(68, 'app', 'Settings', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(69, 'app', 'Manage Countries', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(70, 'app', 'Manage Cities', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(71, 'app', 'Manage Translation', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(72, 'app', 'Login', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(73, 'app', 'Logout', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(74, 'yii', 'Unable to resolve the request "{route}".', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(75, 'zii', 'Home', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(76, 'yii', 'Powered by {yii}.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(77, 'app', 'Beneficiaries', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(78, 'app', 'Create', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(79, 'beneficiary', 'List Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(80, 'beneficiary', 'Manage Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(81, 'beneficiary', 'Create Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(82, 'app', 'Fields with <span class="required">*</span> are required', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(83, 'beneficiary', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(84, 'beneficiary', 'Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(85, 'beneficiary', 'Ssn', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(86, 'beneficiary', 'Gender', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(87, 'beneficiary', 'Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(88, 'beneficiary', 'Email', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(89, 'beneficiary', 'Home Phone', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(90, 'beneficiary', 'Mobile', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(91, 'beneficiary', 'Address', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(92, 'beneficiary', 'Personal Photo Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(93, 'beneficiary', 'Nationality', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(94, 'beneficiary', 'Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(95, 'beneficiary', 'City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(96, 'beneficiary', 'Beneficiary Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(97, 'beneficiary', 'Has Paterfamilias', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(98, 'beneficiary', 'Has Family Members', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(99, 'beneficiary', 'Has Home', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(100, 'beneficiary', 'Has Income', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(101, 'beneficiary', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(102, 'beneficiary', 'Organization Branch', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(103, 'beneficiary', 'Donator', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(104, 'beneficiary', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(105, 'beneficiary', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(106, 'beneficiary', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(107, 'beneficiary', 'Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(108, 'beneficiary', 'Options', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(109, 'enumItem', 'Male', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(110, 'enumItem', 'Female', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(111, 'enumItem', 'student', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(112, 'enumItem', 'orphan', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(113, 'enumItem', 'poor', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(114, 'enumItem', 'widow', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(115, 'enumItem', 'disabled', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(116, 'enumItem', 'teacher', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(117, 'enumItem', 'other', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(118, 'enumItem', 'Yes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(119, 'enumItem', 'No', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(120, 'yii', 'Please fix the following input errors:', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(121, 'zii', 'No results found.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(122, 'yii', '&lt;&lt; First', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(123, 'yii', 'Last &gt;&gt;', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(124, 'app', 'Manage', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(125, 'beneficiary', 'Manage Beneficiaries', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(126, 'app', 'You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>\nor <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(127, 'app', 'Advanced Search', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(128, 'app', 'Search', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(129, 'zii', 'View', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(130, 'zii', 'Update', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(131, 'zii', 'Delete', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(132, 'zii', 'Are you sure you want to delete this item?', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(133, 'yii', 'CDbCommand::execute() failed: {error}. The SQL statement executed was: {sql}.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(134, 'yii', 'CDbCommand failed to execute the SQL statement: {error}', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(135, 'app', 'You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>\nor <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(136, 'Donator', 'List Donator', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(137, 'Donator', 'Manage Donator', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(138, 'Donator', 'Create Donator', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(139, 'enumItem', 'Mr.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(140, 'enumItem', 'Mrs.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(141, 'enumItem', 'Miss', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(142, 'enumItem', 'Ms.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(143, 'donator', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(144, 'donator', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(145, 'donator', 'Fullname', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(146, 'donator', 'Ssn', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(147, 'donator', 'Gender', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(148, 'donator', 'Email', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(149, 'donator', 'Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(150, 'donator', 'Home Phone', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(151, 'donator', 'Work Phone', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(152, 'donator', 'Mobile', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(153, 'donator', 'Nationality', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(154, 'donator', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(155, 'donator', 'Organization Branch', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(156, 'donator', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(157, 'donator', 'Personal Photo Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(158, 'donator', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(159, 'donator', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(160, 'donator', 'Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(161, 'donator', 'Options', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(162, 'app', 'Beneficiary Poors', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(163, 'BeneficiaryPoor', 'Create Beneficiary Poor', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(164, 'BeneficiaryPoor', 'Manage Beneficiary Poor', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(165, 'BeneficiaryPoor', 'List Beneficiary Poor', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(166, 'beneficiary_poor', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(167, 'beneficiary_poor', 'Father Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(168, 'beneficiary_poor', 'Is Father Alive', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(169, 'beneficiary_poor', 'Father Job', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(170, 'beneficiary_poor', 'Father Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(171, 'beneficiary_poor', 'Father Date Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(172, 'beneficiary_poor', 'Father Reason Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(173, 'beneficiary_poor', 'Father Death Certificate Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(174, 'beneficiary_poor', 'Mother Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(175, 'beneficiary_poor', 'Is Mother Alive', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(176, 'beneficiary_poor', 'Mother Job', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(177, 'beneficiary_poor', 'Mother Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(178, 'beneficiary_poor', 'Mother Date Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(179, 'beneficiary_poor', 'Mother Reason Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(180, 'beneficiary_poor', 'Mother Death Certificate Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(181, 'beneficiary_poor', 'Number Of Brothers', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(182, 'beneficiary_poor', 'Number Of Sisters', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(183, 'beneficiary_poor', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(184, 'beneficiary_poor', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(185, 'beneficiary_poor', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(186, 'beneficiary_poor', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(187, 'app', 'Manage Beneficiary Poors', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(188, 'yii', 'Your request is invalid.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(189, 'yii', 'The system is unable to find the requested action "{action}".', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(190, 'app', 'Beneficiary Disableds', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(191, 'BeneficiaryDisabled', 'Create Beneficiary Disabled', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(192, 'BeneficiaryDisabled', 'Manage Beneficiary Disabled', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(193, 'BeneficiaryDisabled', 'List Beneficiary Disabled', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(194, 'beneficiary_disabled', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(195, 'beneficiary_disabled', 'Father Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(196, 'beneficiary_disabled', 'Is Father Alive', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(197, 'beneficiary_disabled', 'Father Job', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(198, 'beneficiary_disabled', 'Father Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(199, 'beneficiary_disabled', 'Father Date Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(200, 'beneficiary_disabled', 'Father Reason Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(201, 'beneficiary_disabled', 'Father Death Certificate Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(202, 'beneficiary_disabled', 'Mother Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(203, 'beneficiary_disabled', 'Is Mother Alive', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(204, 'beneficiary_disabled', 'Mother Job', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(205, 'beneficiary_disabled', 'Mother Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(206, 'beneficiary_disabled', 'Mother Date Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(207, 'beneficiary_disabled', 'Mother Reason Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(208, 'beneficiary_disabled', 'Mother Death Certificate Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(209, 'beneficiary_disabled', 'Number Of Brothers', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(210, 'beneficiary_disabled', 'Number Of Sisters', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(211, 'beneficiary_disabled', 'Disability Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(212, 'beneficiary_disabled', 'Disability Reason', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(213, 'beneficiary_disabled', 'Disability Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(214, 'beneficiary_disabled', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(215, 'beneficiary_disabled', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(216, 'beneficiary_disabled', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(217, 'beneficiary_disabled', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(218, 'enumItem', 'Physical', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(219, 'enumItem', 'Mental', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(220, 'enumItem', 'Social', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(221, 'enumItem', 'Genetic', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(222, 'enumItem', 'Pregnancy defect', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(223, 'enumItem', 'Childbirth defect', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(224, 'enumItem', 'Infection', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(225, 'enumItem', 'Accident', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(226, 'enumItem', 'Environmental', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(227, 'BeneficiaryDisabled', 'List BeneficiaryDisabled', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(228, 'BeneficiaryDisabled', 'Create BeneficiaryDisabled', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(229, 'app', 'Manage Beneficiary Disableds', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(230, 'app', 'Beneficiary Orphans', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(231, 'BeneficiaryOrphan', 'Create Beneficiary Orphan', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(232, 'BeneficiaryOrphan', 'Manage Beneficiary Orphan', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(233, 'BeneficiaryOrphan', 'List Beneficiary Orphan', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(234, 'beneficiary_orphan', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(235, 'beneficiary_orphan', 'Father Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(236, 'beneficiary_orphan', 'Is Father Alive', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(237, 'beneficiary_orphan', 'Father Job', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(238, 'beneficiary_orphan', 'Father Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(239, 'beneficiary_orphan', 'Father Date Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(240, 'beneficiary_orphan', 'Father Reason Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(241, 'beneficiary_orphan', 'Father Death Certificate Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(242, 'beneficiary_orphan', 'Mother Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(243, 'beneficiary_orphan', 'Is Mother Alive', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(244, 'beneficiary_orphan', 'Mother Job', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(245, 'beneficiary_orphan', 'Mother Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(246, 'beneficiary_orphan', 'Mother Date Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(247, 'beneficiary_orphan', 'Mother Reason Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(248, 'beneficiary_orphan', 'Mother Death Certificate Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(249, 'beneficiary_orphan', 'Number Of Brothers', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(250, 'beneficiary_orphan', 'Number Of Sisters', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(251, 'beneficiary_orphan', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(252, 'beneficiary_orphan', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(253, 'beneficiary_orphan', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(254, 'beneficiary_orphan', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(255, 'app', 'Manage Beneficiary Orphans', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(256, 'app', 'Beneficiary Students', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(257, 'BeneficiaryStudent', 'Create Beneficiary Student', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(258, 'BeneficiaryStudent', 'Manage Beneficiary Student', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(259, 'BeneficiaryStudent', 'List Beneficiary Student', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(260, 'beneficiary_student', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(261, 'beneficiary_student', 'Father Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(262, 'beneficiary_student', 'Is Father Alive', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(263, 'beneficiary_student', 'Father Job', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(264, 'beneficiary_student', 'Father Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(265, 'beneficiary_student', 'Father Date Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(266, 'beneficiary_student', 'Father Reason Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(267, 'beneficiary_student', 'Father Death Certificate Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(268, 'beneficiary_student', 'Mother Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(269, 'beneficiary_student', 'Is Mother Alive', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(270, 'beneficiary_student', 'Mother Job', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(271, 'beneficiary_student', 'Mother Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(272, 'beneficiary_student', 'Mother Date Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(273, 'beneficiary_student', 'Mother Reason Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(274, 'beneficiary_student', 'Mother Death Certificate Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(275, 'beneficiary_student', 'Number Of Brothers', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(276, 'beneficiary_student', 'Number Of Sisters', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(277, 'beneficiary_student', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(278, 'beneficiary_student', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(279, 'beneficiary_student', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(280, 'beneficiary_student', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(281, 'app', 'Manage Beneficiary Students', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(282, 'app', 'Beneficiary Student Classes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(283, 'BeneficiaryStudentClass', 'Create Beneficiary Student Class', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(284, 'BeneficiaryStudentClass', 'Manage Beneficiary Student Class', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(285, 'BeneficiaryStudentClass', 'List Beneficiary Student Class', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(286, 'app', 'Manage Beneficiary Student Classes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(287, 'beneficiary_student_class', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(288, 'beneficiary_student_class', 'Class Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(289, 'beneficiary_student_class', 'Major Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(290, 'beneficiary_student_class', 'School Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(291, 'beneficiary_student_class', 'Address', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(292, 'beneficiary_student_class', 'Start At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(293, 'beneficiary_student_class', 'End At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(294, 'beneficiary_student_class', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(295, 'beneficiary_student_class', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(296, 'beneficiary_student_class', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(297, 'beneficiary_student_class', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(298, 'app', 'Beneficiary Teachers', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(299, 'BeneficiaryTeacher', 'Create Beneficiary Teacher', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(300, 'BeneficiaryTeacher', 'Manage Beneficiary Teacher', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(301, 'BeneficiaryTeacher', 'List Beneficiary Teacher', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(302, 'beneficiary_teacher', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(303, 'beneficiary_teacher', 'Scientific Degree', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(304, 'beneficiary_teacher', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(305, 'beneficiary_teacher', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(306, 'beneficiary_teacher', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(307, 'beneficiary_teacher', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(308, 'app', 'Manage Beneficiary Teachers', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(309, 'app', 'Beneficiary Widows', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(310, 'BeneficiaryWidow', 'Create Beneficiary Widow', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(311, 'BeneficiaryWidow', 'Manage Beneficiary Widow', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(312, 'BeneficiaryWidow', 'List Beneficiary Widow', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(313, 'beneficiary_widow', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(314, 'beneficiary_widow', 'Husband Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(315, 'beneficiary_widow', 'Husband Job', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(316, 'beneficiary_widow', 'Husband Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(317, 'beneficiary_widow', 'Husband Date Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(318, 'beneficiary_widow', 'Husband Reason Of Death', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(319, 'beneficiary_widow', 'Husband Death Certificate Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(320, 'beneficiary_widow', 'Number Of Sons', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(321, 'beneficiary_widow', 'Number Of Daughters', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(322, 'beneficiary_widow', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(323, 'beneficiary_widow', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(324, 'beneficiary_widow', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(325, 'beneficiary_widow', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(326, 'app', 'Manage Beneficiary Widows', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(327, 'app', 'Beneficiary Research Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(328, 'BeneficiaryResearchNotes', 'Create Beneficiary Research Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(329, 'BeneficiaryResearchNotes', 'Manage Beneficiary Research Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(330, 'BeneficiaryResearchNotes', 'List Beneficiary Research Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(331, 'enumItem', 'Frequent', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(332, 'enumItem', 'Emergency', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(333, 'enumItem', 'Medical', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(334, 'enumItem', 'Educational', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(335, 'beneficiary_research_notes', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(336, 'beneficiary_research_notes', 'Support Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(337, 'beneficiary_research_notes', 'Support Period', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(338, 'beneficiary_research_notes', 'Expected Support Period', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(339, 'beneficiary_research_notes', 'Support Modality', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(340, 'beneficiary_research_notes', 'Information Source', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(341, 'beneficiary_research_notes', 'Has Small Business Idea', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(342, 'beneficiary_research_notes', 'Small Business Idea Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(343, 'beneficiary_research_notes', 'Researcher Recommendations', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(344, 'beneficiary_research_notes', 'Researcher Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(345, 'beneficiary_research_notes', 'Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(346, 'beneficiary_research_notes', 'Committee Recommendations', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(347, 'beneficiary_research_notes', 'Committee Member Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(348, 'beneficiary_research_notes', 'Committee Manager Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(349, 'beneficiary_research_notes', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(350, 'beneficiary_research_notes', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(351, 'beneficiary_research_notes', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(352, 'beneficiary_research_notes', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(353, 'enumItem', 'Permanent', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(354, 'enumItem', 'Once', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(355, 'enumItem', 'Until healing', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(356, 'enumItem', 'Until graduate', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(357, 'enumItem', 'Money', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(358, 'enumItem', 'In-kind', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(359, 'enumItem', 'Money and in-kind', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(360, 'enumItem', 'Volunteer', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(361, 'enumItem', 'By hand', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(362, 'enumItem', 'Educate a family member', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(363, 'enumItem', 'Employ a family member', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(364, 'enumItem', 'Official documents', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(365, 'enumItem', 'Work visit', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(366, 'enumItem', 'Home visit', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(367, 'enumItem', 'Trusted neighbors', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(368, 'app', 'Manage Beneficiary Research Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(369, 'app', 'Beneficiary Finances', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(370, 'BeneficiaryFinance', 'Create Beneficiary Finance', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(371, 'BeneficiaryFinance', 'Manage Beneficiary Finance', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(372, 'BeneficiaryFinance', 'List Beneficiary Finance', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(373, 'beneficiary_finance', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(374, 'beneficiary_finance', 'Has Supplies Card', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(375, 'beneficiary_finance', 'Income From Paterfamilias', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(376, 'beneficiary_finance', 'Income From Beneficiary Business', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(377, 'beneficiary_finance', 'Income From Beneficiary Family Business', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(378, 'beneficiary_finance', 'Income From Social Security', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(379, 'beneficiary_finance', 'Income From Retirement', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(380, 'beneficiary_finance', 'Income From Lands', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(381, 'beneficiary_finance', 'Income From Property', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(382, 'beneficiary_finance', 'Income From Agriculture', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(383, 'beneficiary_finance', 'Income From National Aid Fund', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(384, 'beneficiary_finance', 'Income From Zakat Fund', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(385, 'beneficiary_finance', 'Income From Charity Fund', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(386, 'beneficiary_finance', 'Income Total', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(387, 'beneficiary_finance', 'Spending Home Rent', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(388, 'beneficiary_finance', 'Spending Food', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(389, 'beneficiary_finance', 'Spending Clothes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(390, 'beneficiary_finance', 'Spending Medication', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(391, 'beneficiary_finance', 'Spending Smoking', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(392, 'beneficiary_finance', 'Spending Education', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(393, 'beneficiary_finance', 'Spending Transportation', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(394, 'beneficiary_finance', 'Spending Gas Invoice', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(395, 'beneficiary_finance', 'Spending Water Invoice', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(396, 'beneficiary_finance', 'Spending Elctricity Invoice', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(397, 'beneficiary_finance', 'Spending Kerosene', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(398, 'beneficiary_finance', 'Spending Other', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(399, 'beneficiary_finance', 'Spending Total', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(400, 'beneficiary_finance', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(401, 'beneficiary_finance', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(402, 'beneficiary_finance', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(403, 'beneficiary_finance', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(404, 'app', 'Manage Beneficiary Finances', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(405, 'app', 'Beneficiary Relations', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(406, 'BeneficiaryRelation', 'Create Beneficiary Relation', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(407, 'BeneficiaryRelation', 'Manage Beneficiary Relation', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(408, 'BeneficiaryRelation', 'List Beneficiary Relation', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(409, 'beneficiary_relation', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(410, 'beneficiary_relation', 'Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(411, 'beneficiary_relation', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(412, 'beneficiary_relation', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(413, 'beneficiary_relation', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(414, 'app', 'Manage Beneficiary Relations', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(415, 'app', 'Beneficiary Family Members', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(416, 'BeneficiaryFamilyMembers', 'Create Family Members', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(417, 'BeneficiaryFamilyMembers', 'Manage Family Members', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(418, 'BeneficiaryFamilyMembers', 'List Family Members', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(419, 'BeneficiaryFamilyMembers', 'Create Beneficiary Family Members', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(420, 'beneficiary_family_members', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(421, 'beneficiary_family_members', 'Full Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(422, 'beneficiary_family_members', 'Ssn', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(423, 'beneficiary_family_members', 'Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(424, 'beneficiary_family_members', 'Beneficiary Relation', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(425, 'beneficiary_family_members', 'Marital Status', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(426, 'beneficiary_family_members', 'Educational Status', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(427, 'beneficiary_family_members', 'Health Status', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(428, 'beneficiary_family_members', 'Business', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(429, 'beneficiary_family_members', 'Other', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(430, 'beneficiary_family_members', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(431, 'beneficiary_family_members', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(432, 'beneficiary_family_members', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(433, 'beneficiary_family_members', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(434, 'app', 'Manage Beneficiary Family Members', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(435, 'app', 'Beneficiary Paterfamiliases', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(436, 'BeneficiaryPaterfamilias', 'Create Beneficiary Paterfamilias', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(437, 'BeneficiaryPaterfamilias', 'Manage Beneficiary Paterfamilias', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(438, 'BeneficiaryPaterfamilias', 'List Beneficiary Paterfamilias', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(439, 'beneficiary_paterfamilias', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(440, 'beneficiary_paterfamilias', 'Paterfamilias First Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(441, 'beneficiary_paterfamilias', 'Paterfamilias Middle Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(442, 'beneficiary_paterfamilias', 'Paterfamilias Grandfather Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(443, 'beneficiary_paterfamilias', 'Paterfamilias Family Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(444, 'beneficiary_paterfamilias', 'Paterfamilias Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(445, 'beneficiary_paterfamilias', 'Ssn', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(446, 'beneficiary_paterfamilias', 'Beneficiary Relation', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(447, 'beneficiary_paterfamilias', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(448, 'beneficiary_paterfamilias', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(449, 'beneficiary_paterfamilias', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(450, 'beneficiary_paterfamilias', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(451, 'app', 'Manage Beneficiary Paterfamiliases', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(452, 'app', 'Beneficiary Homes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(453, 'BeneficiaryHome', 'Create Beneficiary Home', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(454, 'BeneficiaryHome', 'Manage Beneficiary Home', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(455, 'BeneficiaryHome', 'List Beneficiary Home', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(456, 'beneficiary_home', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(457, 'beneficiary_home', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(458, 'beneficiary_home', 'Owner Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(459, 'beneficiary_home', 'Construction Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(460, 'beneficiary_home', 'Number Of Rooms', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(461, 'beneficiary_home', 'Number Of Residents', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(462, 'beneficiary_home', 'Contract Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(463, 'beneficiary_home', 'Rent Cost', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(464, 'beneficiary_home', 'Rent Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(465, 'beneficiary_home', 'Has Tv', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(466, 'beneficiary_home', 'Has Refrigerator', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(467, 'beneficiary_home', 'Has Washer', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(468, 'beneficiary_home', 'Has Dryer', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(469, 'beneficiary_home', 'Has Video Player', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(470, 'beneficiary_home', 'Has Telephone', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(471, 'beneficiary_home', 'Has Mobile', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(472, 'beneficiary_home', 'Has Gas', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(473, 'beneficiary_home', 'Has Oven', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(474, 'beneficiary_home', 'Has Microwave', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(475, 'beneficiary_home', 'Has Air Conditioner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(476, 'beneficiary_home', 'Has Water Solar Heater', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(477, 'beneficiary_home', 'Has Water Electrical Heater', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(478, 'beneficiary_home', 'Has Gas Heater', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(479, 'beneficiary_home', 'Has Electrical Heater', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(480, 'beneficiary_home', 'Beneficiary', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(481, 'beneficiary_home', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(482, 'beneficiary_home', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(483, 'beneficiary_home', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(484, 'enumItem', 'Rented', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(485, 'enumItem', 'Owned', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(486, 'enumItem', 'Free', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(487, 'enumItem', 'Monthly', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36');
INSERT INTO `SourceMessage` (`id`, `category`, `message`, `remote_address`, `created_at`, `updated_at`) VALUES
(488, 'enumItem', 'Quarterly', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(489, 'enumItem', 'Annual', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(490, 'app', 'Manage Beneficiary Homes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(491, 'event', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(492, 'event', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(493, 'event', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(494, 'event', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(495, 'event', 'Number Of Days', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(496, 'event', 'Event Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(497, 'event', 'Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(498, 'event', 'City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(499, 'event', 'Address', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(500, 'event', 'Status', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(501, 'event', 'Start At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(502, 'event', 'End At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(503, 'event', 'Published', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(504, 'event', 'Approved', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(505, 'event', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(506, 'event', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(507, 'event', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(508, 'event', 'Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(509, 'event', 'Options', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(510, 'enumItem', 'Draft', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(511, 'enumItem', 'In Progress', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(512, 'enumItem', 'Completed', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(513, 'enumItem', 'Canceled', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(514, 'event_agenda', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(515, 'event_agenda', 'Event', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(516, 'event_agenda', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(517, 'event_agenda', 'Start Time', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(518, 'event_agenda', 'End Time', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(519, 'event_agenda', 'Venue Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(520, 'event_agenda', 'Day Number', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(521, 'event_agenda', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(522, 'event_agenda', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(523, 'event_activity', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(524, 'event_activity', 'Event', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(525, 'event_activity', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(526, 'event_activity', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(527, 'event_activity', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(528, 'event_activity', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(529, 'event_activity', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(530, 'event_photo', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(531, 'event_photo', 'Event', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(532, 'event_photo', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(533, 'event_photo', 'Size', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(534, 'event_photo', 'Source Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(535, 'event_photo', 'Source Url', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(536, 'event_photo', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(537, 'event_photo', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(538, 'event_photo', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(539, 'event_type', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(540, 'event_type', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(541, 'event_type', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(542, 'event_type', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(543, 'event_type', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(544, 'event_type', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(545, 'event_type', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(546, 'yii', 'CDbCommand::{method}() failed: {error}. The SQL statement executed was: {sql}.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(547, 'yii', 'The table "{table}" for active record class "{class}" cannot be found in the database.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(548, 'enumItem', 'Accepted', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(549, 'mail_inbox', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(550, 'mail_inbox', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(551, 'mail_inbox', 'Mail Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(552, 'mail_inbox', 'Number', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(553, 'mail_inbox', 'From Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(554, 'mail_inbox', 'From Department', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(555, 'mail_inbox', 'Subject', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(556, 'mail_inbox', 'Received At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(557, 'mail_inbox', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(558, 'mail_inbox', 'Mail Attachment', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(559, 'mail_inbox', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(560, 'mail_inbox', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(561, 'mail_outbox', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(562, 'mail_outbox', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(563, 'mail_outbox', 'Mail Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(564, 'mail_outbox', 'Mail Template', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(565, 'mail_outbox', 'Number', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(566, 'mail_outbox', 'From Mail', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(567, 'mail_outbox', 'From Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(568, 'mail_outbox', 'From Department', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(569, 'mail_outbox', 'To Mail', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(570, 'mail_outbox', 'To Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(571, 'mail_outbox', 'To Department', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(572, 'mail_outbox', 'Subject', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(573, 'mail_outbox', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(574, 'mail_outbox', 'Send At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(575, 'mail_outbox', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(576, 'mail_outbox', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(577, 'mail_outbox', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(578, 'mail_attachment', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(579, 'mail_attachment', 'Mail', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(580, 'mail_attachment', 'Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(581, 'mail_attachment', 'Extension', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(582, 'mail_attachment', 'Size', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(583, 'mail_attachment', 'Source Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(584, 'mail_attachment', 'Source Url', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(585, 'mail_attachment', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(586, 'mail_attachment', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(587, 'mail_attachment', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(588, 'mail_template', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(589, 'mail_template', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(590, 'mail_template', 'Mail Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(591, 'mail_template', 'Number', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(592, 'mail_template', 'From Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(593, 'mail_template', 'From Department', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(594, 'mail_template', 'To Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(595, 'mail_template', 'To Department', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(596, 'mail_template', 'Subject', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(597, 'mail_template', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(598, 'mail_template', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(599, 'mail_template', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(600, 'mail_template', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(601, 'mail_type', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(602, 'mail_type', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(603, 'mail_type', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(604, 'mail_type', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(605, 'mail_type', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(606, 'mail_type', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(607, 'mail_type', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(608, 'mosque', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(609, 'mosque', 'Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(610, 'mosque', 'Address', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(611, 'mosque', 'Contract Date', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(612, 'mosque', 'Contract Photo Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(613, 'mosque', 'Construction Progress', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(614, 'mosque', 'Donator', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(615, 'mosque', 'Agent', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(616, 'mosque', 'Mosque Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(617, 'mosque', 'Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(618, 'mosque', 'City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(619, 'mosque', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(620, 'mosque', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(621, 'mosque', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(622, 'mosque', 'Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(623, 'mosque', 'Options', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(624, 'mosque_agent', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(625, 'mosque_agent', 'Company Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(626, 'mosque_agent', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(627, 'mosque_agent', 'Fullname', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(628, 'mosque_agent', 'Ssn', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(629, 'mosque_agent', 'Gender', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(630, 'mosque_agent', 'Email', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(631, 'mosque_agent', 'Home Phone', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(632, 'mosque_agent', 'Work Phone', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(633, 'mosque_agent', 'Mobile', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(634, 'mosque_agent', 'Address', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(635, 'mosque_agent', 'Bank Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(636, 'mosque_agent', 'Bank Branch Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(637, 'mosque_agent', 'Bank Branch Number', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(638, 'mosque_agent', 'Bank Swift Code', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(639, 'mosque_agent', 'Bank Account Number', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(640, 'mosque_agent', 'Personal Photo Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(641, 'mosque_agent', 'Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(642, 'mosque_agent', 'City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(643, 'mosque_agent', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(644, 'mosque_agent', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(645, 'mosque_agent', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(646, 'mosque_agent', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(647, 'mosque_photo', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(648, 'mosque_photo', 'Mosque', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(649, 'mosque_photo', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(650, 'mosque_photo', 'Size', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(651, 'mosque_photo', 'Source Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(652, 'mosque_photo', 'Source Url', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(653, 'mosque_photo', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(654, 'mosque_photo', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(655, 'mosque_photo', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(656, 'mosque_type', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(657, 'mosque_type', 'Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(658, 'mosque_type', 'Construction Area', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(659, 'mosque_type', 'Construction Cost', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(660, 'mosque_type', 'Construction Time', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(661, 'mosque_type', 'Construction Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(662, 'mosque_type', 'Furniture Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(663, 'mosque_type', 'Number Of People', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(664, 'mosque_type', 'Number Of Restrooms', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(665, 'mosque_type', 'Number Of Floors', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(666, 'mosque_type', 'Number Of Entrances', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(667, 'mosque_type', 'Has Female Area', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(668, 'mosque_type', 'Has Sound System', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(669, 'mosque_type', 'Has Air Condition', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(670, 'mosque_type', 'Agent', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(671, 'mosque_type', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(672, 'mosque_type', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(673, 'mosque_type', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(674, 'app', 'Organizations', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(675, 'organization', 'List Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(676, 'organization', 'Manage Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(677, 'organization', 'Create Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(678, 'organization', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(679, 'organization', 'Organization Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(680, 'organization', 'Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(681, 'organization', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(682, 'organization', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(683, 'organization', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(684, 'organization', 'Notes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(685, 'organization', 'Options', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(686, 'zii', 'Displaying {start}-{end} of 1 result.|Displaying {start}-{end} of {count} results.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(687, 'organization', 'Update Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(688, 'organization', 'Delete Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(689, 'app', 'Are you sure you want to delete this item?', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(690, 'organization', 'View Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(691, 'zii', 'Not set', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(692, 'organization', 'Manage Organizations', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(693, 'app', 'Update', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(694, 'app', 'Save', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(695, 'organization_branch', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(696, 'organization_branch', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(697, 'organization_branch', 'Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(698, 'organization_branch', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(699, 'organization_branch', 'Website', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(700, 'organization_branch', 'Phone', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(701, 'organization_branch', 'Fax', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(702, 'organization_branch', 'Mobile', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(703, 'organization_branch', 'Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(704, 'organization_branch', 'City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(705, 'organization_branch', 'Adress', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(706, 'organization_branch', 'Manager', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(707, 'organization_branch', 'Work Days', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(708, 'organization_branch', 'Work Hours', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(709, 'organization_branch', 'Break Hours', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(710, 'organization_branch', 'Geo Location', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(711, 'organization_branch', 'Is Main Branch', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(712, 'organization_branch', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(713, 'organization_branch', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(714, 'organization_branch', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(715, 'organization_branch_country', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(716, 'organization_branch_country', 'Organization Branch', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(717, 'organization_branch_country', 'Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(718, 'organization_branch_country', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(719, 'organization_branch_country', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(720, 'organization_branch_country', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(721, 'yii', '{attribute} is too long (maximum is {max} characters).', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(722, 'organization_position', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(723, 'organization_position', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(724, 'organization_position', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(725, 'organization_position', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(726, 'organization_position', 'Qualifications', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(727, 'organization_position', 'Responsibilities', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(728, 'organization_position', 'Owner', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(729, 'organization_position', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(730, 'organization_position', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(731, 'organization_type', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(732, 'organization_type', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(733, 'organization_type', 'Description', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(734, 'organization_type', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(735, 'organization_type', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(736, 'organization_user', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(737, 'organization_user', 'Username', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(738, 'organization_user', 'Password', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(739, 'organization_user', 'Title', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(740, 'organization_user', 'Fullname', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(741, 'organization_user', 'Ssn', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(742, 'organization_user', 'Gender', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(743, 'organization_user', 'Email', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(744, 'organization_user', 'Date Of Birth', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(745, 'organization_user', 'Home Phone', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(746, 'organization_user', 'Work Phone', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(747, 'organization_user', 'Local Mobile', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(748, 'organization_user', 'International Mobile', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(749, 'organization_user', 'Nationality', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(750, 'organization_user', 'Organization', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(751, 'organization_user', 'Organization Branch', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(752, 'organization_user', 'Personal Photo Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(753, 'organization_user', 'Passport Photo Path', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(754, 'organization_user', 'Blocked', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(755, 'organization_user', 'Last Login Date', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(756, 'organization_user', 'Last Login Ip', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(757, 'organization_user', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(758, 'organization_user', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(759, 'organization_user_access_level', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(760, 'organization_user_access_level', 'User', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(761, 'organization_user_access_level', 'Organization Access Level', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(762, 'organization_user_access_level', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(763, 'organization_user_access_level', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(764, 'app', 'Countries', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(765, 'Country', 'Create Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(766, 'Country', 'Manage Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(767, 'country', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(768, 'country', 'Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(769, 'country', 'Name Ar', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(770, 'country', 'Iso Code 2', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(771, 'country', 'Iso Code 3', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(772, 'country', 'Published', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(773, 'country', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(774, 'country', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(775, 'Country', 'List Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(776, 'Country', 'Update Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(777, 'Country', 'Delete Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(778, 'Country', 'View Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(779, 'app', 'Cities', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(780, 'City', 'Create City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(781, 'City', 'Manage City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(782, 'city', 'ID', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(783, 'city', 'Country', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(784, 'city', 'Name', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(785, 'city', 'Name Ar', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(786, 'city', 'Published', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(787, 'city', 'Created At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(788, 'city', 'Updated At', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(789, 'City', 'List City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(790, 'City', 'Update City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(791, 'City', 'Delete City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(792, 'City', 'View City', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(793, 'yii', 'Property "{class}.{property}" is not defined.', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(794, 'yii', 'Next &gt;', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(795, 'yii', '&lt; Previous', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(796, 'yii', 'Go to page: ', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(797, 'app', 'Events', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(798, 'Event', 'Create Event', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(799, 'Event', 'Manage Event', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(800, 'Event', 'List Event', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(801, 'app', 'Event Agendas', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(802, 'EventAgenda', 'Create Event Agenda', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(803, 'EventAgenda', 'Manage Event Agenda', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(804, 'EventAgenda', 'List Event Agenda', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(805, 'app', 'Manage Event Agendas', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(806, 'app', 'Event Activities', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(807, 'EventActivity', 'Create Event Activity', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(808, 'EventActivity', 'Manage Event Activity', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(809, 'EventActivity', 'List Event Activity', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(810, 'app', 'Event Photos', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(811, 'EventPhoto', 'Create Event Photo', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(812, 'EventPhoto', 'Manage Event Photo', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(813, 'EventPhoto', 'List Event Photo', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(814, 'app', 'Event Types', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(815, 'EventType', 'Create Event Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(816, 'EventType', 'Manage Event Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(817, 'EventType', 'List Event Type', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(818, 'MailInbox', 'Create Mail Inbox', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(819, 'MailInbox', 'Manage Mail Inbox', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(820, 'app', 'Mail Inboxes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(821, 'MailInbox', 'List Mail Inbox', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(822, 'app', 'Manage Mail Inboxes', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(823, 'app', 'Mail Attachments', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(824, 'MailAttachment', 'Create Mail Attachment', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(825, 'MailAttachment', 'Manage Mail Attachment', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(826, 'MailAttachment', 'List Mail Attachment', '127.0.0.1', '2014-05-23 15:56:36', '2014-05-23 15:56:36'),
(827, 'app', 'Organization Branch Country Committees', '127.0.0.1', '2014-05-25 13:05:31', '2014-05-25 13:05:31'),
(828, 'app', 'Mosque Types', '127.0.0.1', '2014-05-25 13:05:37', '2014-05-25 13:05:37'),
(829, 'MosqueType', 'Create Mosque Type', '127.0.0.1', '2014-05-25 13:05:37', '2014-05-25 13:05:37'),
(830, 'MosqueType', 'Manage Mosque Type', '127.0.0.1', '2014-05-25 13:05:37', '2014-05-25 13:05:37'),
(831, 'MosqueType', 'List Mosque Type', '127.0.0.1', '2014-05-25 13:05:39', '2014-05-25 13:05:39');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `assignee_id` int(11) unsigned NOT NULL,
  `status` enum('Draft','Accepted','In Progress','Completed','Canceled') NOT NULL DEFAULT 'Draft',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_id` (`organization_id`),
  KEY `owner_id` (`owner_id`),
  KEY `assignee_id` (`assignee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migration`
--

DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `beneficiary`
--
ALTER TABLE `beneficiary`
  ADD CONSTRAINT `beneficiary_ibfk_1` FOREIGN KEY (`nationality_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `beneficiary_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `beneficiary_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `beneficiary_ibfk_4` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `beneficiary_ibfk_5` FOREIGN KEY (`organization_branch_id`) REFERENCES `organization_branch` (`id`),
  ADD CONSTRAINT `beneficiary_ibfk_6` FOREIGN KEY (`donator_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `beneficiary_ibfk_7` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_disabled`
--
ALTER TABLE `beneficiary_disabled`
  ADD CONSTRAINT `beneficiary_disabled_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_disabled_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_family_members`
--
ALTER TABLE `beneficiary_family_members`
  ADD CONSTRAINT `beneficiary_family_members_ibfk_1` FOREIGN KEY (`beneficiary_relation_id`) REFERENCES `beneficiary_relation` (`id`),
  ADD CONSTRAINT `beneficiary_family_members_ibfk_2` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_family_members_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_finance`
--
ALTER TABLE `beneficiary_finance`
  ADD CONSTRAINT `beneficiary_finance_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_finance_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_home`
--
ALTER TABLE `beneficiary_home`
  ADD CONSTRAINT `beneficiary_home_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_home_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_orphan`
--
ALTER TABLE `beneficiary_orphan`
  ADD CONSTRAINT `beneficiary_orphan_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_orphan_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_paterfamilias`
--
ALTER TABLE `beneficiary_paterfamilias`
  ADD CONSTRAINT `beneficiary_paterfamilias_ibfk_1` FOREIGN KEY (`beneficiary_relation_id`) REFERENCES `beneficiary_relation` (`id`),
  ADD CONSTRAINT `beneficiary_paterfamilias_ibfk_2` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_paterfamilias_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_poor`
--
ALTER TABLE `beneficiary_poor`
  ADD CONSTRAINT `beneficiary_poor_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_poor_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_relation`
--
ALTER TABLE `beneficiary_relation`
  ADD CONSTRAINT `beneficiary_relation_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_research_notes`
--
ALTER TABLE `beneficiary_research_notes`
  ADD CONSTRAINT `beneficiary_research_notes_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_research_notes_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_student`
--
ALTER TABLE `beneficiary_student`
  ADD CONSTRAINT `beneficiary_student_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_student_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_student_class`
--
ALTER TABLE `beneficiary_student_class`
  ADD CONSTRAINT `beneficiary_student_class_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_student_class_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_teacher`
--
ALTER TABLE `beneficiary_teacher`
  ADD CONSTRAINT `beneficiary_teacher_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_teacher_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `beneficiary_widow`
--
ALTER TABLE `beneficiary_widow`
  ADD CONSTRAINT `beneficiary_widow_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`),
  ADD CONSTRAINT `beneficiary_widow_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `donator`
--
ALTER TABLE `donator`
  ADD CONSTRAINT `donator_ibfk_6` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `donator_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `donator_ibfk_3` FOREIGN KEY (`organization_branch_id`) REFERENCES `organization_branch` (`id`),
  ADD CONSTRAINT `donator_ibfk_5` FOREIGN KEY (`nationality_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_8` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`),
  ADD CONSTRAINT `event_ibfk_3` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `event_ibfk_5` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `event_activity`
--
ALTER TABLE `event_activity`
  ADD CONSTRAINT `event_activity_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `event_activity_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`);

--
-- Constraints for table `event_agenda`
--
ALTER TABLE `event_agenda`
  ADD CONSTRAINT `event_agenda_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`);

--
-- Constraints for table `event_photo`
--
ALTER TABLE `event_photo`
  ADD CONSTRAINT `event_photo_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `event_photo_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `event_type`
--
ALTER TABLE `event_type`
  ADD CONSTRAINT `event_type_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `event_type_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`);

--
-- Constraints for table `mail_attachment`
--
ALTER TABLE `mail_attachment`
  ADD CONSTRAINT `mail_attachment_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `mail_attachment_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `mail` (`id`);

--
-- Constraints for table `mail_inbox`
--
ALTER TABLE `mail_inbox`
  ADD CONSTRAINT `mail_inbox_ibfk_5` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `mail_inbox_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `mail_inbox_ibfk_3` FOREIGN KEY (`mail_attachment_id`) REFERENCES `mail_attachment` (`id`),
  ADD CONSTRAINT `mail_inbox_ibfk_4` FOREIGN KEY (`mail_type_id`) REFERENCES `mail_type` (`id`);

--
-- Constraints for table `mail_outbox`
--
ALTER TABLE `mail_outbox`
  ADD CONSTRAINT `mail_outbox_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `mail_outbox_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `mail_outbox_ibfk_3` FOREIGN KEY (`mail_type_id`) REFERENCES `mail_type` (`id`);

--
-- Constraints for table `mail_template`
--
ALTER TABLE `mail_template`
  ADD CONSTRAINT `mail_template_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `mail_template_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `mail_template_ibfk_3` FOREIGN KEY (`mail_type_id`) REFERENCES `mail_type` (`id`);

--
-- Constraints for table `mail_type`
--
ALTER TABLE `mail_type`
  ADD CONSTRAINT `mail_type_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `mail_type_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`);

--
-- Constraints for table `Message`
--
ALTER TABLE `Message`
  ADD CONSTRAINT `FK_Message_SourceMessage` FOREIGN KEY (`id`) REFERENCES `SourceMessage` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mosque`
--
ALTER TABLE `mosque`
  ADD CONSTRAINT `mosque_ibfk_1` FOREIGN KEY (`donator_id`) REFERENCES `donator` (`id`),
  ADD CONSTRAINT `mosque_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `mosque_agent` (`id`),
  ADD CONSTRAINT `mosque_ibfk_3` FOREIGN KEY (`mosque_type_id`) REFERENCES `mosque_type` (`id`),
  ADD CONSTRAINT `mosque_ibfk_4` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `mosque_ibfk_5` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `mosque_ibfk_6` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `mosque_agent`
--
ALTER TABLE `mosque_agent`
  ADD CONSTRAINT `mosque_agent_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `mosque_agent_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `mosque_agent_ibfk_3` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `mosque_agent_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `mosque_photo`
--
ALTER TABLE `mosque_photo`
  ADD CONSTRAINT `mosque_photo_ibfk_1` FOREIGN KEY (`mosque_id`) REFERENCES `mosque` (`id`),
  ADD CONSTRAINT `mosque_photo_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `mosque_type`
--
ALTER TABLE `mosque_type`
  ADD CONSTRAINT `mosque_type_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `mosque_agent` (`id`),
  ADD CONSTRAINT `mosque_type_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `organization`
--
ALTER TABLE `organization`
  ADD CONSTRAINT `organization_ibfk_1` FOREIGN KEY (`organization_type_id`) REFERENCES `organization_type` (`id`);

--
-- Constraints for table `organization_access_level`
--
ALTER TABLE `organization_access_level`
  ADD CONSTRAINT `organization_access_level_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`);

--
-- Constraints for table `organization_access_level_permission`
--
ALTER TABLE `organization_access_level_permission`
  ADD CONSTRAINT `organization_access_level_permission_ibfk_1` FOREIGN KEY (`organization_access_level_id`) REFERENCES `organization_access_level` (`id`);

--
-- Constraints for table `organization_branch`
--
ALTER TABLE `organization_branch`
  ADD CONSTRAINT `organization_branch_ibfk_7` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `organization_branch_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `organization_branch_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `organization_branch_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `organization_branch_ibfk_6` FOREIGN KEY (`manager_id`) REFERENCES `organization_user` (`id`);

--
-- Constraints for table `organization_branch_country`
--
ALTER TABLE `organization_branch_country`
  ADD CONSTRAINT `organization_branch_country_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `organization_branch_country_ibfk_1` FOREIGN KEY (`organization_branch_id`) REFERENCES `organization_branch` (`id`),
  ADD CONSTRAINT `organization_branch_country_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `organization_branch_country_committee`
--
ALTER TABLE `organization_branch_country_committee`
  ADD CONSTRAINT `organization_branch_country_committee_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `organization_branch_country_committee_ibfk_1` FOREIGN KEY (`organization_branch_country_id`) REFERENCES `organization_branch_country` (`id`);

--
-- Constraints for table `organization_branch_country_committee_user`
--
ALTER TABLE `organization_branch_country_committee_user`
  ADD CONSTRAINT `organization_branch_country_committee_user_ibfk_5` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `organization_branch_country_committee_user_ibfk_1` FOREIGN KEY (`organization_branch_country_committee_id`) REFERENCES `organization_branch_country_committee` (`id`),
  ADD CONSTRAINT `organization_branch_country_committee_user_ibfk_2` FOREIGN KEY (`organization_user_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `organization_branch_country_committee_user_ibfk_3` FOREIGN KEY (`organization_position_id`) REFERENCES `organization_position` (`id`);

--
-- Constraints for table `organization_position`
--
ALTER TABLE `organization_position`
  ADD CONSTRAINT `organization_position_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `organization_position_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`);

--
-- Constraints for table `organization_user`
--
ALTER TABLE `organization_user`
  ADD CONSTRAINT `organization_user_ibfk_4` FOREIGN KEY (`nationality_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `organization_user_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `organization_user_ibfk_3` FOREIGN KEY (`organization_branch_id`) REFERENCES `organization_branch` (`id`);

--
-- Constraints for table `organization_user_access_level`
--
ALTER TABLE `organization_user_access_level`
  ADD CONSTRAINT `organization_user_access_level_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `organization_user_access_level_ibfk_2` FOREIGN KEY (`organization_access_level_id`) REFERENCES `organization_access_level` (`id`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_5` FOREIGN KEY (`assignee_id`) REFERENCES `organization_user` (`id`),
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `task_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `organization_user` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
