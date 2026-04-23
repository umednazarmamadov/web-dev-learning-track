-- =============================================
-- SQL Лабораторные работы - RUDN University
-- Студент: Umed Nazarmamadov
-- =============================================

-- ЛАБОРАТОРНАЯ 2

-- 1. Найти все параметры ПК с 8x или 40x CD и ценой более 600, отсортировать
SELECT *
FROM pc
WHERE pc.cd = '8x' OR pc.cd = '40x' AND price > 600
ORDER BY pc.speed, pc.price;

-- 2. Для каждого производителя лаптопы с HD >= 10 и RAM >= 64мб
SELECT pr.maker, lp.speed
FROM product pr, laptop lp
WHERE pr.model = lp.model
AND lp.hd >= 10
AND lp.ram >= 8
ORDER BY pr.maker;

-- 3. Номера моделей, тип и цены ноутбуков производителя А, по убыванию цены
SELECT pr.maker, pr.type, lp.model, lp.price
FROM product pr, laptop lp
WHERE pr.model = lp.model
AND pr.maker = 'A'
ORDER BY lp.price DESC;

-- =============================================
-- ЛАБОРАТОРНАЯ 3

-- 1. Производитель, номер модели и цена ноутбуков стоимостью до 1000
SELECT pr.maker, lp.model, lp.price
FROM product pr, laptop lp
WHERE pr.model = lp.model
AND lp.price <= 1000;

-- 2. Для каждой модели ПК количество, макс и мин RAM, сгруппировать по моделям
SELECT model, COUNT(pc.model), MAX(pc.ram), MIN(pc.ram)
FROM pc
GROUP BY model;

-- 3. Модель, цена каждого ноутбука и мин/макс цена для всех ноутбуков
SELECT model, price
FROM laptop
UNION ALL
SELECT 'Min Price', MIN(price)
FROM laptop
UNION ALL
SELECT 'Max Price', MAX(price)
FROM laptop
ORDER BY price;

-- =============================================
-- ЛАБОРАТОРНАЯ 4

-- 1. Количество товаров каждого типа у каждого производителя
SELECT pr.maker, pr.type, COUNT(type)
FROM product pr
GROUP BY pr.maker, pr.type
ORDER BY pr.maker;

-- 2. Самый дорогой товар каждого типа
SELECT MAX(pc.price), pr.type
FROM product pr JOIN pc ON (pc.model=pr.model)
GROUP BY pr.type
UNION
SELECT MAX(lp.price), pr.type
FROM product pr JOIN laptop lp ON (lp.model=pr.model)
GROUP BY pr.type
UNION
SELECT MAX(print.price), pr.type
FROM product pr JOIN printer print ON (print.model=pr.model)
GROUP BY pr.type;

-- 3. Производители ноутбуков и ПК ценой более 600, но не принтеров
SELECT pr.maker
FROM product pr JOIN laptop lp ON (lp.model=pr.model)
WHERE lp.price > 600
INTERSECT
SELECT pr.maker
FROM product pr JOIN pc ON (pc.model=pr.model)
WHERE pc.price > 600
EXCEPT
SELECT pr.maker
FROM product pr JOIN printer ON (printer.model=pr.model);

-- =============================================
-- ЛАБОРАТОРНАЯ 5

-- 1. Странная сумма для ноутбуков и ПК
SELECT (CAST(lp.model AS numeric) + lp.price + lp.ram) AS strange_sum
FROM laptop lp
UNION ALL
SELECT (CAST(pc.model AS numeric) + pc.price + pc.ram) AS strange_sum
FROM PC pc;

-- 2. Скорость ПК, количество и категория (быстрая/медленная/промежуточная)
SELECT pc.speed, COUNT(pc.speed),
CASE pc.speed
WHEN (SELECT MAX(speed) FROM PC) THEN 'быстрая'
WHEN (SELECT MIN(speed) FROM PC) THEN 'медленная'
ELSE 'промежуточная'
END AS pc_speed
FROM PC pc
GROUP BY speed;

-- =============================================
-- ЛАБОРАТОРНАЯ 6

-- 1. Производители ноутбуков и ПК, но не принтеров (используя EXISTS)
SELECT DISTINCT maker
FROM product AS lp
WHERE type = 'Laptop' AND
EXISTS (SELECT maker FROM product WHERE type = 'PC' AND maker = lp.maker)
AND NOT EXISTS (SELECT maker FROM product WHERE type = 'Printer' AND maker = lp.maker);

-- 2. Производители ПК, чья цена + 50$ ниже средней цены ноутбука
SELECT pr.maker, pr.model
FROM pc pc
JOIN product pr USING(model)
WHERE (pc.price + 50) < (SELECT AVG(price) FROM laptop)
AND (pc.ram * 1.5) >= (SELECT AVG(ram) FROM laptop)
AND (pc.speed * 1.2) >= (SELECT AVG(speed) FROM laptop);