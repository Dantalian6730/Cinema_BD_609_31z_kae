-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 13 2025 г., 15:50
-- Версия сервера: 5.5.62
-- Версия PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `609.31z.kae`
--

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL COMMENT 'фильм –id(PK)',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'наименование',
  `duration` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'продолжительность'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`id`, `name`, `duration`) VALUES
(1, 'Дыхание шторма', '1ч. 33мин.'),
(2, 'Мастер', '2ч. 2мин.'),
(3, 'Микки 17', '2ч. 19мин.'),
(4, 'Электрический штат', '2ч. 8мин.'),
(5, 'Западня', '1ч. 35мин.');

-- --------------------------------------------------------

--
-- Структура таблицы `hall`
--

CREATE TABLE `hall` (
  `id` int(11) NOT NULL COMMENT 'зал – id(PK)',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hall`
--

INSERT INTO `hall` (`id`, `name`) VALUES
(1, '№1'),
(2, '№2'),
(3, '№3');

-- --------------------------------------------------------

--
-- Структура таблицы `place`
--

CREATE TABLE `place` (
  `id` int(11) NOT NULL COMMENT 'место – id(PK)',
  `id_hall` int(11) NOT NULL COMMENT 'id_зала (FK)',
  `row` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ряд',
  `number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'номер',
  `price_category` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ценовая_категория'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `place`
--

INSERT INTO `place` (`id`, `id_hall`, `row`, `number`, `price_category`) VALUES
(1, 1, '1', '1', '1'),
(2, 1, '1', '2', '1'),
(3, 1, '1', '3', '1'),
(4, 1, '2', '1', '1'),
(5, 1, '2', '2', '1'),
(6, 1, '2', '3', '1'),
(7, 1, '3', '1', '1'),
(8, 1, '3', '2', '1'),
(9, 1, '3', '3', '1'),
(10, 2, '1', '1', '2'),
(11, 2, '1', '2', '2'),
(12, 2, '1', '3', '2'),
(13, 2, '2', '1', '2'),
(14, 2, '2', '2', '2'),
(15, 2, '2', '3', '2'),
(16, 2, '3', '1', '2'),
(17, 2, '3', '2', '2'),
(18, 2, '3', '3', '2'),
(19, 3, '1', '1', '3'),
(20, 3, '1', '2', '3'),
(21, 3, '1', '3', '3'),
(22, 3, '2', '1', '3'),
(23, 3, '2', '2', '3'),
(24, 3, '2', '3', '3'),
(25, 3, '3', '1', '3'),
(26, 3, '3', '2', '3'),
(27, 3, '3', '3', '3');

-- --------------------------------------------------------

--
-- Структура таблицы `price`
--

CREATE TABLE `price` (
  `id` int(11) NOT NULL COMMENT 'цена – id(PK)',
  `id_session` int(11) NOT NULL COMMENT ' id_сеанса (FK)',
  `price_category` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ценовая_категория',
  `price` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `price`
--

INSERT INTO `price` (`id`, `id_session`, `price_category`, `price`) VALUES
(1, 1, '1', '400'),
(2, 2, '1', '400'),
(3, 3, '1', '400'),
(4, 4, '1', '400'),
(5, 5, '1', '400'),
(6, 6, '2', '200'),
(7, 7, '2', '200'),
(8, 8, '2', '200'),
(9, 9, '2', '200'),
(10, 10, '2', '200'),
(11, 11, '3', '300'),
(12, 12, '3', '300'),
(13, 13, '3', '300'),
(14, 14, '3', '300'),
(15, 15, '3', '300');

-- --------------------------------------------------------

--
-- Структура таблицы `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL COMMENT 'сеанс – id(PK)',
  `id_hall` int(11) NOT NULL COMMENT 'id_зала (FK)',
  `id_film` int(11) NOT NULL COMMENT 'id_фильма (FK)',
  `start_date` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'дата_и_время_начала'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `session`
--

INSERT INTO `session` (`id`, `id_hall`, `id_film`, `start_date`) VALUES
(1, 1, 2, '13.04.25 11:00'),
(2, 1, 3, '13.04.25 13:05'),
(3, 1, 4, '13.04.25 16:10'),
(4, 1, 1, '13.04.25 19:30'),
(5, 1, 5, '13.04.25 22:30'),
(6, 2, 1, '13.04.25 11:00'),
(7, 2, 2, '13.04.25 13:30'),
(8, 2, 3, '13.04.25 16:30'),
(9, 2, 4, '13.04.25 19:50'),
(10, 2, 5, '13.04.25 23:00'),
(11, 3, 5, '13.04.25 11:00'),
(12, 3, 4, '13.04.25 14:00'),
(13, 3, 3, '13.04.25 17:00'),
(14, 3, 2, '13.04.25 20:00'),
(15, 3, 1, '13.04.25 23:00');

-- --------------------------------------------------------

--
-- Структура таблицы `tiсket`
--

CREATE TABLE `tiсket` (
  `id` int(11) NOT NULL COMMENT 'билет – id(PK)',
  `id_session` int(10) NOT NULL COMMENT 'id_сеанса (FK)',
  `Id_place` int(11) NOT NULL COMMENT 'id_места (FK)',
  `full_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ФИО'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tiсket`
--

INSERT INTO `tiсket` (`id`, `id_session`, `Id_place`, `full_name`) VALUES
(1, 1, 1, 'Калинкин Александр Евгеньевич'),
(2, 1, 2, 'Левина Ксения Дмитриевна'),
(3, 1, 3, 'Панова Елизавета Дмитриевна'),
(4, 1, 4, 'Соколов Егор Сергеевич'),
(5, 1, 5, 'Дементьев Никита Максимович'),
(6, 1, 6, 'Николаева Майя Антоновна'),
(7, 1, 7, 'Волкова Александра Алексеевна'),
(8, 1, 8, 'Орлова Мирослава Вячеславовна'),
(9, 2, 9, 'Попова Александра Дмитриевна'),
(10, 2, 6, 'Федотов Егор Маркович'),
(11, 2, 7, 'Овсянникова Ольга Саввична'),
(12, 3, 1, 'Зыкова Елизавета Тимуровна'),
(13, 3, 9, 'Тарасов Георгий Тимофеевич'),
(14, 4, 5, 'Михайлова Арина Ильинична'),
(15, 5, 9, 'Ефремов Владислав Артёмович'),
(16, 6, 11, 'Щербакова Элина Даниловна'),
(17, 7, 15, 'Андреев Эмин Даниилович'),
(18, 8, 17, 'Горбунов Андрей Львович'),
(19, 9, 18, 'Захарова Мария Егоровна'),
(20, 9, 17, 'Беляев Глеб Макарович'),
(21, 9, 16, 'Маркова Алёна Сергеевна'),
(22, 10, 10, 'Прохоров Иван Платонович'),
(23, 10, 13, 'Леонова Вера Леонидовна'),
(24, 10, 16, 'Миронова Варвара Леоновна'),
(25, 11, 19, 'Сидорова Елизавета Игоревна'),
(26, 11, 20, 'Сотников Кирилл Михайлович'),
(27, 11, 21, 'Киселева Светлана Ильинична'),
(28, 12, 27, 'Иванова Мария Григорьевна'),
(29, 12, 26, 'Громов Даниил Максимович'),
(30, 13, 23, 'Агеев Иван Даниилович'),
(31, 14, 25, 'Сидорова Елизавета Алексеевна'),
(32, 14, 23, 'Чеботарева Валерия Ярославовна'),
(33, 15, 27, 'Сидорова Елизавета Алексеевна'),
(34, 15, 26, 'Соколова Светлана Дмитриевна'),
(35, 15, 25, 'Пономарев Яков Артёмович'),
(36, 15, 24, 'Власов Константин Михайлович'),
(37, 15, 23, 'Алехин Аркадий Никитич');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `film_name` (`name`),
  ADD UNIQUE KEY `film_duration` (`duration`);

--
-- Индексы таблицы `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_hall` (`name`);

--
-- Индексы таблицы `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`,`id_hall`),
  ADD KEY `id_hall` (`id_hall`);

--
-- Индексы таблицы `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`,`id_session`),
  ADD KEY `id_session` (`id_session`);

--
-- Индексы таблицы `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`,`id_hall`,`id_film`),
  ADD KEY `id_hall` (`id_hall`),
  ADD KEY `id_film` (`id_film`);

--
-- Индексы таблицы `tiсket`
--
ALTER TABLE `tiсket`
  ADD PRIMARY KEY (`id`,`id_session`,`Id_place`),
  ADD KEY `Id_place` (`Id_place`),
  ADD KEY `tiсket_ibfk_2` (`id_session`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'фильм –id(PK)', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `hall`
--
ALTER TABLE `hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'зал – id(PK)', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `place`
--
ALTER TABLE `place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'место – id(PK)', AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `price`
--
ALTER TABLE `price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'цена – id(PK)', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'сеанс – id(PK)', AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `tiсket`
--
ALTER TABLE `tiсket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'билет – id(PK)', AUTO_INCREMENT=45;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`id_hall`) REFERENCES `hall` (`id`);

--
-- Ограничения внешнего ключа таблицы `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `session` (`id`);

--
-- Ограничения внешнего ключа таблицы `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`id_hall`) REFERENCES `hall` (`id`),
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`);

--
-- Ограничения внешнего ключа таблицы `tiсket`
--
ALTER TABLE `tiсket`
  ADD CONSTRAINT `tiсket_ibfk_1` FOREIGN KEY (`Id_place`) REFERENCES `place` (`id`),
  ADD CONSTRAINT `tiсket_ibfk_2` FOREIGN KEY (`id_session`) REFERENCES `session` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
