-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 10 2012 г., 22:59
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `reg_truck_2012_1m`
--

-- --------------------------------------------------------

--
-- Структура таблицы `a_brand`
--

CREATE TABLE IF NOT EXISTS `a_brand` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_country`
--

CREATE TABLE IF NOT EXISTS `a_country` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_god_reg`
--

CREATE TABLE IF NOT EXISTS `a_god_reg` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_god_vip`
--

CREATE TABLE IF NOT EXISTS `a_god_vip` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_kuzov`
--

CREATE TABLE IF NOT EXISTS `a_kuzov` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_mass_seg`
--

CREATE TABLE IF NOT EXISTS `a_mass_seg` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_mec_reg`
--

CREATE TABLE IF NOT EXISTS `a_mec_reg` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_model`
--

CREATE TABLE IF NOT EXISTS `a_model` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_name_dv`
--

CREATE TABLE IF NOT EXISTS `a_name_dv` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_name_reg`
--

CREATE TABLE IF NOT EXISTS `a_name_reg` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_name_rul`
--

CREATE TABLE IF NOT EXISTS `a_name_rul` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_name_vl`
--

CREATE TABLE IF NOT EXISTS `a_name_vl` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_new_used`
--

CREATE TABLE IF NOT EXISTS `a_new_used` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_okrug`
--

CREATE TABLE IF NOT EXISTS `a_okrug` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_origin`
--

CREATE TABLE IF NOT EXISTS `a_origin` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_part_w`
--

CREATE TABLE IF NOT EXISTS `a_part_w` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_region`
--

CREATE TABLE IF NOT EXISTS `a_region` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `a_v_diap`
--

CREATE TABLE IF NOT EXISTS `a_v_diap` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `city_reg`
--

CREATE TABLE IF NOT EXISTS `city_reg` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `gorod`
--

CREATE TABLE IF NOT EXISTS `gorod` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `kol`
--

CREATE TABLE IF NOT EXISTS `kol` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `main`
--

CREATE TABLE IF NOT EXISTS `main` (
  `id` int(10) unsigned NOT NULL,
  `A_OKRUG` int(10) unsigned NOT NULL,
  `A_REGION` int(10) unsigned NOT NULL,
  `A_BRAND` int(10) unsigned NOT NULL,
  `A_MODEL` int(10) unsigned NOT NULL,
  `A_GOD_VIP` int(10) unsigned NOT NULL,
  `A_GOD_REG` int(10) unsigned NOT NULL,
  `A_MEC_REG` int(10) unsigned NOT NULL,
  `KOL` int(10) unsigned NOT NULL,
  `A_NEW_USED` int(10) unsigned NOT NULL,
  `VIN_KOD` int(10) unsigned NOT NULL,
  `N_DVIG` int(10) unsigned NOT NULL,
  `N_KUZ` int(10) unsigned NOT NULL,
  `N_CHASSI` int(10) unsigned NOT NULL,
  `A_NAME_REG` int(10) unsigned NOT NULL,
  `A_NAME_VL` int(10) unsigned NOT NULL,
  `RAION` int(10) unsigned NOT NULL,
  `RAION_GR` int(10) unsigned NOT NULL,
  `GOROD` int(10) unsigned NOT NULL,
  `SOCR` int(10) unsigned NOT NULL,
  `OCATO` int(10) unsigned NOT NULL,
  `CITY_REG` int(10) unsigned NOT NULL,
  `A_NAME_DV` int(10) unsigned NOT NULL,
  `A_V_DIAP` int(10) unsigned NOT NULL,
  `A_NAME_RUL` int(10) unsigned NOT NULL,
  `A_KUZOV` int(10) unsigned NOT NULL,
  `A_MASS_SEG` int(10) unsigned NOT NULL,
  `A_COUNTRY` int(10) unsigned NOT NULL,
  `A_PART_W` int(10) unsigned NOT NULL,
  `A_ORIGIN` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_A_OKRUG` (`A_OKRUG`),
  KEY `index_A_REGION` (`A_REGION`),
  KEY `index_A_BRAND` (`A_BRAND`),
  KEY `index_A_MODEL` (`A_MODEL`),
  KEY `index_A_GOD_VIP` (`A_GOD_VIP`),
  KEY `index_A_GOD_REG` (`A_GOD_REG`),
  KEY `index_A_MEC_REG` (`A_MEC_REG`),
  KEY `index_KOL` (`KOL`),
  KEY `index_A_NEW_USED` (`A_NEW_USED`),
  KEY `index_VIN_KOD` (`VIN_KOD`),
  KEY `index_N_DVIG` (`N_DVIG`),
  KEY `index_N_KUZ` (`N_KUZ`),
  KEY `index_N_CHASSI` (`N_CHASSI`),
  KEY `index_A_NAME_REG` (`A_NAME_REG`),
  KEY `index_A_NAME_VL` (`A_NAME_VL`),
  KEY `index_RAION` (`RAION`),
  KEY `index_RAION_GR` (`RAION_GR`),
  KEY `index_GOROD` (`GOROD`),
  KEY `index_SOCR` (`SOCR`),
  KEY `index_OCATO` (`OCATO`),
  KEY `index_CITY_REG` (`CITY_REG`),
  KEY `index_A_NAME_DV` (`A_NAME_DV`),
  KEY `index_A_V_DIAP` (`A_V_DIAP`),
  KEY `index_A_NAME_RUL` (`A_NAME_RUL`),
  KEY `index_A_KUZOV` (`A_KUZOV`),
  KEY `index_A_MASS_SEG` (`A_MASS_SEG`),
  KEY `index_A_COUNTRY` (`A_COUNTRY`),
  KEY `index_A_PART_W` (`A_PART_W`),
  KEY `index_ORIG_CHS` (`A_ORIGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `n_chassi`
--

CREATE TABLE IF NOT EXISTS `n_chassi` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `n_dvig`
--

CREATE TABLE IF NOT EXISTS `n_dvig` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `n_kuz`
--

CREATE TABLE IF NOT EXISTS `n_kuz` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ocato`
--

CREATE TABLE IF NOT EXISTS `ocato` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `raion`
--

CREATE TABLE IF NOT EXISTS `raion` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `raion_gr`
--

CREATE TABLE IF NOT EXISTS `raion_gr` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `socr`
--

CREATE TABLE IF NOT EXISTS `socr` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `vin_kod`
--

CREATE TABLE IF NOT EXISTS `vin_kod` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
