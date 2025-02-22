-- 1)	Verificare che i campi definiti come PK siano univoci. In altre parole, scrivi una query per determinare l’univocità dei valori di ciascuna PK (una query per tabella implementata).
-- tabella product
SHOW KEYS FROM product;
SELECT count(ID) AS numero_prodotti from product;
SELECT count(DISTINCT ID) FROM product;

-- tabella category
SHOW KEYS FROM category;
SELECT count(ID) AS numero_categorie FROM category;
SELECT count(DISTINCT ID) AS numero_categorie FROM category;

-- tabella sales
SHOW KEYS FROM sales;
SELECT count(ID) AS numero_ordini FROM sales;
SELECT count(distinct ID) as numero_ordini FROM sales;

-- tabella region
SHOW KEYS FROM region;
SELECT count(ID) AS numero_paesi FROM sales;
SELECT count(DISTINCT ID) AS numero_paesi FROM region;

-- 2)	Esporre l’elenco delle transazioni indicando nel result set il codice documento, la data, il nome del prodotto, la categoria del prodotto,
-- 		il nome dello stato, il nome della regione di vendita e un campo booleano valorizzato in base alla condizione che siano passati più di 180 
-- 		giorni dalla data vendita o meno (>180 -> True, <= 180 -> False)

SELECT sales.order_number, sales.sales_date, product.name, category.type_game, region.country, region.zone,
IF (datediff(CURRENT_DATE, sales.sales_date) > 180, 'true', 'false') as '>180gg'
FROM category
JOIN product on category.ID = product.categoryID
LEFT JOIN sales ON product.ID = sales.productID
JOIN region ON region.ID =  sales.regionID
ORDER BY sales.sales_date;

-- 3)	Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito. 
-- 		(ogni valore della condizione deve risultare da una query e non deve essere inserito a mano). Nel result set devono comparire solo il codice 
-- 		prodotto e il totale venduto.

SELECT product.ID, sales.total_price
FROM product
JOIN sales ON product.ID = sales.productID
where year(sales_date) = (SELECT MAX(YEAR(sales_date)) FROM sales)
GROUP BY product.ID, sales.total_price
HAVING sum(total_price) > (select avg(total_price) as avg_totalprice from sales);
-- prova di funzionamento
SELECT * FROM sales WHERE YEAR(sales_date) = 2025;

-- 4)	Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.

SELECT product.name, year(sales.sales_date) as year_sales, sum(total_price) as year_amount
FROM product
JOIN sales ON product.ID = sales.productID
GROUP BY product.ID, year_sales
ORDER BY product.name;

-- 5)	Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.

SELECT region.country, year(sales.sales_date) AS year_sales, sum(sales.total_price) as topolino
FROM region
JOIN sales on region.ID = sales.regionID
GROUP BY region.country, year_sales
ORDER BY year_sales desc, topolino desc;

-- 6)	Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato
SELECT Category.type_Game, SUM(Sales.order_Quantity) AS sommaQuantita
FROM Category
JOIN Product ON Category.ID = Product.categoryID
JOIN Sales ON Product.ID = Sales.productID
GROUP BY category.type_game
order by sommaQuantita desc limit 1;

SELECT * FROM product WHERE categoryID IN (1,2);
SELECT * FROM sales WHERE productID IN (1,11,14,17,2,12,20);


-- 7)	Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti.
-- 1° metodo
SELECT Product.ID, Product.name FROM Product 
LEFT JOIN Sales ON Product.ID = Sales.productID
WHERE Sales.productID IS NULL;
-- 2° metodo
SELECT Product.ID, Product.name FROM Product 
WHERE Product.ID NOT IN(SELECT Sales.productID FROM Sales);

-- 8)	Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” delle informazioni utili 
-- (codice prodotto, nome prodotto, nome categoria)

CREATE VIEW info_utili as (
SELECT product.ID, product.name, category.type_game FROM product
JOIN category on product.categoryID = category.ID
);

select * from info_utili;

-- 9)	Creare una vista per le informazioni geografiche

CREATE VIEW info_geo AS
SELECT region.country, region.zone, product.name, category.type_game, sales.total_price, sales.order_quantity
FROM region
JOIN sales ON region.ID = sales.regionID
JOIN product ON sales.productID = product.ID
JOIN category ON product.categoryID = category.ID;

select * from info_geo;