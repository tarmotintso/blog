-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Loomise aeg: Märts 20, 2014 kell 01:57 PM
-- Serveri versioon: 5.5.32
-- PHP versioon: 5.4.19

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_text` text NOT NULL,
  `comment_author` text NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Andmete tõmmistamine tabelile `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_text`, `comment_author`) VALUES
(1, 'Esimene kommentaar ', 'tarmo'),
(2, 'Teine kommentaar', 'tarmo');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `post_subject` varchar(255) DEFAULT NULL,
  `post_text` text,
  `post_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Andmete tõmmistamine tabelile `post`
--

INSERT INTO `post` (`post_id`, `post_subject`, `post_text`, `post_created`, `user_id`) VALUES
(3, 'Esimene postitus', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', '2014-01-20 10:30:21', 1),
(4, 'Teine postitus', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. ', '2014-01-26 16:46:20', 2);

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
(3, 1),
(4, 2);

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
(4, 2),
(4, 3),
(3, 4),
(4, 4);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(25) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Andmete tõmmistamine tabelile `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_name`) VALUES
(1, 'kala'),
(2, 'mutionu'),
(3, 'rohi'),
(4, 'karu');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Andmete tõmmistamine tabelile `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `deleted`) VALUES
(1, 'demo', 'demo', 0),
(2, 'tarmo', 'mutionu', 0),
(3, 'uus kasutaja', 'miski', 0);

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
  ADD CONSTRAINT `post_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  ADD CONSTRAINT `post_comments_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`);

--
-- Piirangud tabelile `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  ADD CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`);
SET FOREIGN_KEY_CHECKS=1;
