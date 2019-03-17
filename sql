-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 17 2019 г., 14:02
-- Версия сервера: 5.7.19-log
-- Версия PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_db`
--

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `acity`
-- (See below for the actual view)
--
CREATE TABLE `acity` (
`id` int(11)
,`name` varchar(50)
,`salary` int(11)
,`department_id` int(11)
,`birthday` date
,`city` varchar(50)
,`gender` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `current_birthday`
-- (See below for the actual view)
--
CREATE TABLE `current_birthday` (
`id` int(11)
,`name` varchar(50)
,`salary` int(11)
,`department_id` int(11)
,`birthday` date
,`city` varchar(50)
,`gender` int(11)
);

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(1, '1 отдел'),
(2, '2 отдел'),
(3, '3 отдел'),
(4, '4 отдел'),
(5, '5 отдел');

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `city` varchar(50) NOT NULL,
  `gender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`id`, `name`, `salary`, `department_id`, `birthday`, `city`, `gender`) VALUES
(3, 'Иванов Иван', 20000, 1, '2000-03-13', 'Москва', 1),
(4, 'Петров Пётр', 40000, 2, '1980-03-15', 'Архангельск', 1),
(5, 'Семёнов Семён', 30000, 1, '1999-03-18', 'Астрахань', 1),
(6, 'Бодрова Ирина', 35000, 3, '1990-03-05', 'Москва', 2),
(7, 'Евгеньева Евгения', 20000, 4, '1995-04-10', 'Андреаполь', 2),
(8, 'Григорьев Григорий', 33000, 5, '1987-03-27', 'Астрахань', 1),
(9, 'Андреев Андрей', 30000, 2, '1970-02-11', 'Тверь', 1),
(10, 'Данилов Данил', 15000, 1, '1976-04-03', 'Санкт-Петербург', 1),
(11, 'Алиев Али', 42000, 1, '1988-03-16', 'Грозный', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `genders`
--

CREATE TABLE `genders` (
  `gender_id` int(11) NOT NULL,
  `gender_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_name`) VALUES
(1, 'male'),
(2, 'female');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `max_dep_salary`
-- (See below for the actual view)
--
CREATE TABLE `max_dep_salary` (
`department_id` int(11)
,`MAX(salary)` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `max_min_salary`
-- (See below for the actual view)
--
CREATE TABLE `max_min_salary` (
`id` int(11)
,`name` varchar(50)
,`salary` int(11)
,`department_id` int(11)
,`birthday` date
,`city` varchar(50)
,`gender` int(11)
);

-- --------------------------------------------------------

--
-- Структура для представления `acity`
--
DROP TABLE IF EXISTS `acity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `acity`  AS  select `employee`.`id` AS `id`,`employee`.`name` AS `name`,`employee`.`salary` AS `salary`,`employee`.`department_id` AS `department_id`,`employee`.`birthday` AS `birthday`,`employee`.`city` AS `city`,`employee`.`gender` AS `gender` from `employee` where (`employee`.`city` like 'А%') order by `employee`.`name` ;

-- --------------------------------------------------------

--
-- Структура для представления `current_birthday`
--
DROP TABLE IF EXISTS `current_birthday`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `current_birthday`  AS  select `employee`.`id` AS `id`,`employee`.`name` AS `name`,`employee`.`salary` AS `salary`,`employee`.`department_id` AS `department_id`,`employee`.`birthday` AS `birthday`,`employee`.`city` AS `city`,`employee`.`gender` AS `gender` from `employee` where ((month(`employee`.`birthday`) like month(curdate())) and (dayofmonth(`employee`.`birthday`) like dayofmonth(curdate()))) ;

-- --------------------------------------------------------

--
-- Структура для представления `max_dep_salary`
--
DROP TABLE IF EXISTS `max_dep_salary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `max_dep_salary`  AS  select `employee`.`department_id` AS `department_id`,max(`employee`.`salary`) AS `MAX(salary)` from `employee` group by `employee`.`department_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `max_min_salary`
--
DROP TABLE IF EXISTS `max_min_salary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `max_min_salary`  AS  select `employee`.`id` AS `id`,`employee`.`name` AS `name`,`employee`.`salary` AS `salary`,`employee`.`department_id` AS `department_id`,`employee`.`birthday` AS `birthday`,`employee`.`city` AS `city`,`employee`.`gender` AS `gender` from `employee` where ((`employee`.`salary` = (select max(`employee`.`salary`) from `employee`)) or (`employee`.`salary` = (select min(`employee`.`salary`) from `employee`))) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `gender` (`gender`);

--
-- Индексы таблицы `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`gender_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `genders`
--
ALTER TABLE `genders`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
