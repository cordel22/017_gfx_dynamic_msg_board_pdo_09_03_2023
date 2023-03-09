-- --------------------------------------------------------
-- Hostiteľ:                     127.0.0.1
-- Verze serveru:                10.6.4-MariaDB - mariadb.org binary distribution
-- OS serveru:                   Win32
-- HeidiSQL Verzia:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportování struktury databáze pro
CREATE DATABASE IF NOT EXISTS `forum2` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `forum2`;

-- Exportování struktury pro tabulka forum2.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `lang_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(60) NOT NULL,
  `lang_eng` varchar(20) NOT NULL,
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `lang` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Exportování dat pro tabulku forum2.languages: ~10 rows (přibližně)
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`lang_id`, `lang`, `lang_eng`) VALUES
	(1, 'English', 'English');
INSERT INTO `languages` (`lang_id`, `lang`, `lang_eng`) VALUES
	(2, 'Português', 'Portuguese');
INSERT INTO `languages` (`lang_id`, `lang`, `lang_eng`) VALUES
	(3, 'Français', 'French');
INSERT INTO `languages` (`lang_id`, `lang`, `lang_eng`) VALUES
	(4, 'Norsk', 'Norwegian');
INSERT INTO `languages` (`lang_id`, `lang`, `lang_eng`) VALUES
	(5, 'Romanian', 'Romanian');
INSERT INTO `languages` (`lang_id`, `lang`, `lang_eng`) VALUES
	(6, 'Hellenike', 'Greek');
INSERT INTO `languages` (`lang_id`, `lang`, `lang_eng`) VALUES
	(7, 'Deutsch', 'German');
INSERT INTO `languages` (`lang_id`, `lang`, `lang_eng`) VALUES
	(8, 'Srpski', 'Serbian');
INSERT INTO `languages` (`lang_id`, `lang`, `lang_eng`) VALUES
	(9, 'Nippon ', 'Japanese');
INSERT INTO `languages` (`lang_id`, `lang`, `lang_eng`) VALUES
	(10, 'Nederlands', 'Dutch');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;

-- Exportování struktury pro tabulka forum2.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `posted_on` datetime NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `thread_id` (`thread_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Exportování dat pro tabulku forum2.posts: ~0 rows (přibližně)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Exportování struktury pro tabulka forum2.threads
CREATE TABLE IF NOT EXISTS `threads` (
  `thread_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` tinyint(3) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `subject` varchar(150) NOT NULL,
  PRIMARY KEY (`thread_id`),
  KEY `lang_id` (`lang_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Exportování dat pro tabulku forum2.threads: ~0 rows (přibližně)
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;

-- Exportování struktury pro tabulka forum2.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` tinyint(3) unsigned NOT NULL,
  `time_zone` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pass` char(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `login` (`username`,`pass`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Exportování dat pro tabulku forum2.users: ~5 rows (přibližně)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `lang_id`, `time_zone`, `username`, `pass`, `email`) VALUES
	(1, 1, 'America/New_York', 'trouster', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'email@example.com');
INSERT INTO `users` (`user_id`, `lang_id`, `time_zone`, `username`, `pass`, `email`) VALUES
	(2, 7, 'Europe/Berlin', 'Ute', 'a5a7569327c9925049693dbfda8cd1d0106f4550', 'email1@example.com');
INSERT INTO `users` (`user_id`, `lang_id`, `time_zone`, `username`, `pass`, `email`) VALUES
	(3, 4, 'Europe/Oslo', 'Silje', 'e408d64f8bcd85ebb7d84bc13540c5683ce1b6c9', 'email2@example.com');
INSERT INTO `users` (`user_id`, `lang_id`, `time_zone`, `username`, `pass`, `email`) VALUES
	(4, 2, 'America/Sao_Paulo', 'João', '2d2553bcdeda4aa9d3b09965e90c6d283a8cfce1', 'email3@example.com');
INSERT INTO `users` (`user_id`, `lang_id`, `time_zone`, `username`, `pass`, `email`) VALUES
	(5, 1, 'Pacific/Auckland', 'kiwi', '9c147500fd397d8f90a2e5005524fee515099760', 'kiwi@example.org');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Exportování struktury pro tabulka forum2.words
CREATE TABLE IF NOT EXISTS `words` (
  `word_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(80) NOT NULL,
  `intro` tinytext NOT NULL,
  `home` varchar(30) NOT NULL,
  `forum_home` varchar(40) NOT NULL,
  `language` varchar(40) NOT NULL,
  `register` varchar(30) NOT NULL,
  `login` varchar(30) NOT NULL,
  `logout` varchar(30) NOT NULL,
  `new_thread` varchar(40) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `body` varchar(30) NOT NULL,
  `submit` varchar(30) NOT NULL,
  `posted_on` varchar(30) NOT NULL,
  `posted_by` varchar(30) NOT NULL,
  `replies` varchar(30) NOT NULL,
  `latest_reply` varchar(40) NOT NULL,
  `post_a_reply` varchar(40) NOT NULL,
  PRIMARY KEY (`word_id`),
  UNIQUE KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Exportování dat pro tabulku forum2.words: ~0 rows (přibližně)
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` (`word_id`, `lang_id`, `title`, `intro`, `home`, `forum_home`, `language`, `register`, `login`, `logout`, `new_thread`, `subject`, `body`, `submit`, `posted_on`, `posted_by`, `replies`, `latest_reply`, `post_a_reply`) VALUES
	(1, 1, 'PHP and MySQL for Dynmic Web Sites: The Forum!', '<p>Welcome to our site....\r\n	please use the links above...\r\n	blah, blah, blah.</p>\r\n\r\n	<p>Welcome to our site....please\r\n	use the links above...blah,\r\n	blah, blah.</p>', 'Home', 'Forum Home', 'Language', 'Register', 'Login', 'Logout', 'New Thread', 'Subject', 'Body', 'Submit', 'Posted on', 'Posted\r\n	by', 'Replies', 'Latest Reply', 'Post a Reply');
/*!40000 ALTER TABLE `words` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
