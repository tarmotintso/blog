-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Loomise aeg: Märts 18, 2014 kell 01:29 PM
-- Serveri versioon: 5.5.32
-- PHP versioon: 5.4.19

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Andmebaas: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_text` text NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Andmete tõmmistamine tabelile `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_text`) VALUES
(1, 'Loll jutt.');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_subject` varchar(255) NOT NULL,
  `post_text` text NOT NULL,
  `post_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Andmete tõmmistamine tabelile `post`
--

INSERT INTO `post` (`post_id`, `post_subject`, `post_text`, `post_created`, `user_id`) VALUES
(3, 'Esimene', 'Test''äöõüköõlüö.õüö  34523oikb0b esgs 8hnzdf güauozrgjawv4 8', '2014-01-14 18:10:42', 1),
(4, 'Teine', '*ÄÖ*Ä ÖF* Ü 5641+++-**- + ggg+g6f', '2014-01-14 18:10:42', 1),
(5, 'Kolmas', ' Ukraina president Viktor Janukovõtš pakub opositsioonijuhile Arseni Jatsenjukile peaministri ja teisele opositsiooniliidrile Vitali Klitškole asepeaministri kohta, teatas laupäeval Ukraina justiitsminister.\r\n\r\nPresidendi personaliülema asetäitja sõnul ütles Janukovõtš kohtumisel opositsiooni esindajatega, et on valmis tegema muudatusi Ukraina põhiseadusse ning on nõus üleminekuga parlamentaarsele-presidentaalsele süsteemile.\r\n\r\nJanukovõtš alustas laupäeval opositsioonijuhtidega uusi etteteatamata läbirääkimisi, teatas presidendi kantselei. Kõnelustel osalevad UDARi juht Klitško, Isamaa liider Jatsenjuk ja rahvuslaste erakonna Svoboda juht Oleg Tjagnõbokiga, teatas presidendi kantselei.\r\n', '2014-01-25 20:44:10', 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `post_comments`
--

CREATE TABLE IF NOT EXISTS `post_comments` (
  `post_id` int(11) unsigned NOT NULL,
  `comment_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`comment_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Andmete tõmmistamine tabelile `post_comments`
--

INSERT INTO `post_comments` (`post_id`, `comment_id`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `post_tags`
--

CREATE TABLE IF NOT EXISTS `post_tags` (
  `post_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Andmete tõmmistamine tabelile `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tag_id`) VALUES
(3, 1),
(4, 1),
(3, 2),
(5, 2),
(4, 6),
(5, 6),
(4, 7);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(25) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Andmete tõmmistamine tabelile `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_name`) VALUES
(1, 'elu'),
(2, 'muu'),
(5, 'raske'),
(6, 'kerge'),
(7, 'mõttetused ja lollused');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Andmete tõmmistamine tabelile `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `deleted`) VALUES
(1, 'demo', 'demo', 0);

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Piirangud tabelile `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  ADD CONSTRAINT `post_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`);

--
-- Piirangud tabelile `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  ADD CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`);
SET FOREIGN_KEY_CHECKS=1;
