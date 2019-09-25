SELECT 'ФИО: Чащин Дмитрий Александрович';
--1.1 SELECT , LIMIT - выбрать 10 записей из таблицы ratings
SELECT '1.1 SELECT , LIMIT - выбрать 10 записей из таблицы ratings';
SELECT * FROM RATINGS LIMIT 10;
--1.2 WHERE, LIKE - выбрать из таблицы links всё записи, у которых imdbid оканчивается на "42", а поле movieid между 100 и 1000
SELECT '1.2 WHERE, LIKE - выбрать из таблицы links всё записи, у которых imdbid оканчивается на "42", а поле movieid между 100 и 1000';
SELECT * FROM links
 WHERE CAST(imdbid AS TEXT) LIKE '%42'
 AND movieid BETWEEN 100 AND 1000;
--2. Сложные выборки: JOIN
--2.1 INNER JOIN выбрать из таблицы links все imdbId, которым ставили рейтинг 5
SELECT '2. Сложные выборки: JOIN';
SELECT '2.1 INNER JOIN выбрать из таблицы links все imdbId, которым ставили рейтинг 5';
SELECT imdbid FROM links INNER JOIN ratings
 ON links.movieid = ratings.movieid
 WHERE ratings.rating = 5;
--3. Аггрегация данных: базовые статистики
--3.1 COUNT() Посчитать число фильмов без оценок 
SELECT '3. Аггрегация данных: базовые статистики';
SELECT '3.1 COUNT() Посчитать число фильмов без оценок ';
SELECT COUNT(*) FROM ratings
 WHERE rating = NULL;
--или же
--SELECT COUNT(*) FROM ratings
-- WHERE CAST(rating AS TEXT) = '';
--3.2 GROUP BY, HAVING вывести top-10 пользователей, у который средний рейтинг выше 3.5
SELECT '3.2 GROUP BY, HAVING вывести top-10 пользователей, у который средний рейтинг выше 3.5';
SELECT userid, avg(rating) FROM ratings
 GROUP BY userid HAVING avg(rating) > 3.5
 ORDER BY avg(rating) DESC LIMIT 10;
--4. Иерархические запросы
--4.1 Подзапросы: достать любые 10 imbdId из links у которых средний рейтинг больше 3.5.
SELECT '4. Иерархические запросы';
SELECT '4.1 Подзапросы: достать любые 10 imbdId из links у которых средний рейтинг больше 3.5';
SELECT imdbid FROM links INNER JOIN ratings
 ON links.movieid = ratings.movieid
  GROUP BY imdbid HAVING avg(rating) > 3.5
  LIMIT 10;
--4.2 Common Table Expressions: посчитать средний рейтинг по пользователям, у которых более 10 оценок.
--Нужно подсчитать средний рейтинг по все пользователям, которые попали под условие - то есть в ответе должно быть одно число.
SELECT '4.2 Common Table Expressions: посчитать средний рейтинг по пользователям, у которых более 10 оценок.';
SELECT 'Нужно подсчитать средний рейтинг по все пользователям, которые попали под условие - то есть в ответе должно быть одно число.';
SELECT avg(avg_per_user)
 FROM (SELECT avg(rating) AS avg_per_user
  FROM ratings
  GROUP BY userid HAVING COUNT(userid) > 10)
 AS avg_all_users;