-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 10 2012 г., 23:01
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `abiz_admin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE IF NOT EXISTS `cache` (
  `id` char(128) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `value` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `data_bases`
--

CREATE TABLE IF NOT EXISTS `data_bases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `caption` varchar(45) NOT NULL,
  `database_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_data_bases_database_type1` (`database_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- Структура таблицы `database_type`
--

CREATE TABLE IF NOT EXISTS `database_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Структура таблицы `individual_info`
--

CREATE TABLE IF NOT EXISTS `individual_info` (
  `value` varchar(1000) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  KEY `fk_individual_info_user1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `restrict`
--

CREATE TABLE IF NOT EXISTS `restrict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(50) NOT NULL,
  `client_caption` varchar(50) NOT NULL,
  `child_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'Depends on another field (id in the same table). Example: Model depends on Brand.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `pwd_hash` varchar(32) NOT NULL COMMENT '32 bytes for md5 hash sum',
  `name` varchar(100) NOT NULL COMMENT 'Any user describe name',
  `reg_date` date NOT NULL,
  `rights` int(11) NOT NULL DEFAULT '0' COMMENT 'Administrator user',
  `max_install` int(11) NOT NULL,
  `cur_install` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(16) NOT NULL DEFAULT 'en_us',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

-- --------------------------------------------------------

--
-- Структура таблицы `user_has_data_bases`
--

CREATE TABLE IF NOT EXISTS `user_has_data_bases` (
  `user_id` int(10) unsigned NOT NULL,
  `data_bases_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`data_bases_id`),
  KEY `fk_user_has_data_bases_data_bases1` (`data_bases_id`),
  KEY `fk_user_has_data_bases_user1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_has_restrict`
--

CREATE TABLE IF NOT EXISTS `user_has_restrict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `restrict_id` int(10) unsigned NOT NULL,
  `value` int(11) NOT NULL COMMENT 'Value of restrict',
  `data_bases_id` int(10) unsigned NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rgt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`user_id`,`restrict_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_user_has_restrict_restrict1` (`restrict_id`),
  KEY `fk_user_has_restrict_user1` (`user_id`),
  KEY `fk_user_has_restrict_data_bases1` (`data_bases_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1201 ;

-- --------------------------------------------------------

--
-- Структура таблицы `user_has_restrict_fields`
--

CREATE TABLE IF NOT EXISTS `user_has_restrict_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `restrict_id` int(10) unsigned NOT NULL,
  `data_bases_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`user_id`,`restrict_id`,`data_bases_id`),
  KEY `fk_user_has_restrict_fields_user1` (`user_id`),
  KEY `fk_user_has_restrict_fields_restrict1` (`restrict_id`),
  KEY `fk_user_has_restrict_fields_data_bases1` (`data_bases_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `user_pivot`
--

CREATE TABLE IF NOT EXISTS `user_pivot` (
  `pivot_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `pivot_name` varchar(255) NOT NULL,
  `tabDatabaseId` int(10) unsigned NOT NULL,
  `tabFieldsArrHeader` varchar(2048) NOT NULL,
  `tabFieldsArrLeft` varchar(2048) NOT NULL,
  `tabCritActive` varchar(2048) NOT NULL,
  `tabFieldsFilterArr` varchar(2048) NOT NULL,
  `tabFieldsSortArr` varchar(2048) NOT NULL,
  PRIMARY KEY (`pivot_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `data_bases`
--
ALTER TABLE `data_bases`
  ADD CONSTRAINT `fk_data_bases_database_type1` FOREIGN KEY (`database_type_id`) REFERENCES `database_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `individual_info`
--
ALTER TABLE `individual_info`
  ADD CONSTRAINT `fk_individual_info_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `user_has_data_bases`
--
ALTER TABLE `user_has_data_bases`
  ADD CONSTRAINT `fk_user_has_data_bases_data_bases1` FOREIGN KEY (`data_bases_id`) REFERENCES `data_bases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_has_data_bases_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_has_restrict`
--
ALTER TABLE `user_has_restrict`
  ADD CONSTRAINT `fk_user_has_restrict_data_bases1` FOREIGN KEY (`data_bases_id`) REFERENCES `data_bases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_has_restrict_restrict1` FOREIGN KEY (`restrict_id`) REFERENCES `restrict` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_has_restrict_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_has_restrict_fields`
--
ALTER TABLE `user_has_restrict_fields`
  ADD CONSTRAINT `fk_user_has_restrict_fields_data_bases1` FOREIGN KEY (`data_bases_id`) REFERENCES `data_bases` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_restrict_fields_restrict1` FOREIGN KEY (`restrict_id`) REFERENCES `restrict` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_restrict_fields_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
