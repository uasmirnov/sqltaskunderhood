-- create tables

-- CREATE TABLE test.products (
--     id INT NOT NULL AUTO_INCREMENT,
--     date DATE,
--     product_id INT NOT NULL,
--     quantity INT NOT NULL,
--     PRIMARY KEY (id)
-- );
-- INSERT INTO test.products (
--     date,
--     product_id,
--     quantity
-- )
-- VALUES
--     ("2020-01-01",1,500),
--     ("2020-01-01",2,3000),
--     ("2020-01-01",3,25),
--     ("2020-01-02",1,450),
--     ("2020-01-02",2,2500),
--     ("2020-01-02",3,23),
--     ("2020-01-03",1,311),
--     ("2020-01-03",2,970),
--     ("2020-01-03",3,20),
--     ("2020-01-04",1,1000),
--     ("2020-01-04",2,10000),
--     ("2020-01-04",3,50),
--     ("2020-01-05",1,632),
--     ("2020-01-05",2,7868),
--     ("2020-01-05",3,39),
--     ("2020-01-06",1,632),
--     ("2020-01-06",2,7868),
--     ("2020-01-06",3,39),
--     ("2020-01-07",1,737),
--     ("2020-01-07",2,6999),
--     ("2020-01-07",3,37),
--     ("2020-01-08",1,590),
--     ("2020-01-08",2,4500),
--     ("2020-01-08",3,29),
--     ("2020-01-09",1,311),
--     ("2020-01-09",2,970),
--     ("2020-01-09",3,20),
--     ("2020-01-10",1,1000),
--     ("2020-01-10",2,10000),
--     ("2020-01-10",3,50);
--
-- CREATE TABLE test.price_log (
--     id INT NOT NULL AUTO_INCREMENT,
--     date DATE,
--     product_id INT NOT NULL,
--     price INT NOT NULL,
--     PRIMARY KEY (id)
-- );
--
-- INSERT INTO test.price_log (
--     date,
--     product_id,
--     price
-- )
-- VALUES
--     ("2020-01-01",1,30),
--     ("2020-01-01",2,10),
--     ("2020-01-01",3,750),
--     ("2020-01-03",1,33),
--     ("2020-01-03",2,17),
--     ("2020-01-03",2,20),
--     ("2020-01-04",1,32),
--     ("2020-01-02",2,17),
--     ("2020-01-09",2,20),
--     ("2020-01-05",3,699);

-- Написать SQL запрос, который выведет за каждый день с 2020-01-01 по 2020-01-10 стоимость всех
-- товаров на складе (таблица products).
-- Например за 2020-01-01 для товара (1) получается 500*30 + для товара (2) 3000*10 + для товара (3)
-- 25*750 = 63750, а за 2020-01-03 - 311*33 + 970*17 + 20*750 = 41753.

SELECT
    products.date,
    SUM(pl.price * products.quantity) AS total_price
FROM
    test.price_log pl
JOIN test.products ON pl.product_id = products.product_id
    AND pl.date = products.date
WHERE products.date
    BETWEEN '2020-01-01' AND '2020-01-10'
GROUP BY products.date
ORDER BY products.date
;