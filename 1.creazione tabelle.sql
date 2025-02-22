CREATE DATABASE toysgroup;
use toysgroup;

-- creazione tabelle

CREATE TABLE category (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    type_game VARCHAR(50),
    theme VARCHAR(50)
    );
    
CREATE TABLE product (
	ID INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50),
	color VARCHAR(50),
	racommended_age VARCHAR(5),
	list_price DECIMAL(10,2),
	standard_cost DECIMAL(10,2),
    categoryID INT,
    FOREIGN KEY(categoryID) REFERENCES category (ID)
    );
    
CREATE TABLE sales (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    sales_date DATE,
    order_quantity SMALLINT,
    unit_price DECIMAL (10,2),
    productID INT,
    FOREIGN KEY (productID) REFERENCES product(ID)
    );
    
CREATE TABLE region (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(50),
    zone VARCHAR(50),
    salesID INT,
    FOREIGN KEY (salesID) REFERENCES sales(ID)
    );
    
INSERT INTO category (type_game, theme) VALUES
('Educational', 'Science'),
('Educational', 'Math'),
('Building', 'Construction'),
('Building', 'Architecture'),
('Action Figures', 'Superheroes'),
('Action Figures', 'Dinosaurs'),
('Role Play', 'Fantasy'),
('Role Play', 'Career'),
('Puzzles', 'Jigsaw'),
('Puzzles', 'Logic');

INSERT INTO product (name, color, racommended_age, list_price, standard_cost, categoryID) VALUES
('Science Kit', 'Blue', '8+', 29.99, 15.00, 1),
('Math Game', 'Green', '6+', 19.99, 10.00, 2),
('Building Blocks', 'Multicolor', '4+', 24.99, 12.50, 3),
('Miniature House', 'Red', '7+', 39.99, 20.00, 4),
('Superhero Figure', 'Black', '5+', 14.99, 7.50, 5),
('Dinosaur Toy', 'Brown', '5+', 18.99, 9.50, 6),
('Fantasy Sword', 'Silver', '10+', 12.99, 6.00, 7),
('Doctor Set', 'White', '3+', 16.99, 8.50, 8),
('Jigsaw Puzzle', 'Yellow', '6+', 9.99, 5.00, 9),
('Logic Puzzle', 'Purple', '10+', 14.99, 7.00, 10),
('Chemistry Set', 'Blue', '8+', 34.99, 17.00, 1),
('Geometry Kit', 'Green', '6+', 21.99, 11.00, 2),
('Tower Blocks', 'Multicolor', '4+', 29.99, 15.50, 3),
('Robot Toy', 'Grey', '7+', 49.99, 25.00, 1),
('Adventure Figure', 'Red', '5+', 16.99, 8.50, 5);

INSERT INTO sales (order_quantity, unit_price, order_date, sales_date, productID) VALUES
(3, 24.99, '2025-01-05', '2025-01-06', 3),
(5, 29.99, '2025-01-01', '2025-01-02', 1),
(4, 14.99, '2025-02-08', '2025-02-09', 5),
(3, 34.99, '2025-01-23', '2025-01-24', 12),
(6, 18.99, '2025-01-11', '2025-01-12', 6),
(4, 24.99, '2025-02-04', '2025-02-05', 3),
(7, 14.99, '2025-01-09', '2025-01-10', 5),
(3, 14.99, '2025-01-19', '2025-01-20', 10),
(2, 29.99, '2025-01-21', '2025-01-22', 11),
(5, 19.99, '2025-01-29', '2025-01-30', 15),
(4, 9.99, '2025-01-17', '2025-01-18', 9),
(6, 16.99, '2025-01-15', '2025-01-16', 8),
(5, 12.99, '2025-01-13', '2025-01-14', 7),
(2, 39.99, '2025-01-07', '2025-01-08', 4),
(3, 39.99, '2025-02-06', '2025-02-07', 4),
(4, 19.99, '2025-02-02', '2025-02-03', 2),
(3, 29.99, '2025-01-31', '2025-02-01', 1),
(5, 19.99, '2025-01-03', '2025-01-04', 2),
(2, 22.99, '2025-01-25', '2025-01-26', 13),
(4, 39.99, '2025-01-27', '2025-01-28', 14);

INSERT INTO region (country, zone, salesID) VALUES
('France', 'West Europe', 7),
('Ireland', 'North Europe', 19),
('Portugal', 'South Europe', 12),
('Denmark', 'North Europe', 11),
('Czech Republic', 'East Europe', 14),
('Sweden', 'North Europe', 5),
('Greece', 'South Europe', 10),
('Poland', 'East Europe', 4),
('Belgium', 'West Europe', 17),
('Italy', 'South Europe', 2),
('Finland', 'North Europe', 9),
('Netherlands', 'West Europe', 13),
('Norway', 'North Europe', 1),
('Hungary', 'East Europe', 8),
('Iceland', 'North Europe', 15),
('Germany', 'West Europe', 3),
('Slovakia', 'East Europe', 18),
('Malta', 'South Europe', 16),
('Spain', 'South Europe', 6),
('Cyprus', 'South Europe', 20);

-- siccome nella task 4 es.2 mi chiede di inserire nel result set il 'codice documento' inserisco nella tabella sales il record 'order_number'
ALTER TABLE sales
ADD COLUMN order_number INT AFTER ID;

ALTER TABLE sales 
MODIFY order_number VARCHAR(5);

-- adesso popolo solo ''order number'

UPDATE sales SET order_number = 
    CASE 
        WHEN ID = 1 THEN 'AB001'
        WHEN ID = 2 THEN 'CD002'
        WHEN ID = 3 THEN 'EF003'
        WHEN ID = 4 THEN 'GH004'
        WHEN ID = 5 THEN 'IJ005'
        WHEN ID = 6 THEN 'KL006'
        WHEN ID = 7 THEN 'MN007'
        WHEN ID = 8 THEN 'OP008'
        WHEN ID = 9 THEN 'QR009'
        WHEN ID = 10 THEN 'ST010'
        WHEN ID = 11 THEN 'UV011'
        WHEN ID = 12 THEN 'WX012'
        WHEN ID = 13 THEN 'YZ013'
        WHEN ID = 14 THEN 'AB014'
        WHEN ID = 15 THEN 'CD015'
        WHEN ID = 16 THEN 'EF016'
        WHEN ID = 17 THEN 'GH017'
        WHEN ID = 18 THEN 'IJ018'
        WHEN ID = 19 THEN 'KL019'
        WHEN ID = 20 THEN 'MN020'
    END;

-- siccome nella task 4 es 2 mi chiede un campo booleano valorizzato in base alla condizione che siano passati + di 180gg dalla data di vendita, cambio le date d'ordine e le date di vendita
START TRANSACTION;
UPDATE sales SET sales_date = 
    CASE 
        WHEN ID = 1 THEN '2023-01-06'
        WHEN ID = 2 THEN '2023-03-15'
        WHEN ID = 3 THEN '2023-05-22'
        WHEN ID = 4 THEN '2024-02-06'
        WHEN ID = 5 THEN '2024-04-18'
        WHEN ID = 6 THEN '2024-07-11'
        WHEN ID = 7 THEN '2024-09-29'
        WHEN ID = 8 THEN '2025-01-17'
        WHEN ID = 9 THEN '2025-03-10'
        WHEN ID = 10 THEN '2025-05-25'
        WHEN ID = 11 THEN '2023-11-06'
        WHEN ID = 12 THEN '2023-12-21'
        WHEN ID = 13 THEN '2024-03-05'
        WHEN ID = 14 THEN '2024-06-24'
        WHEN ID = 15 THEN '2024-08-15'
        WHEN ID = 16 THEN '2024-11-07'
        WHEN ID = 17 THEN '2025-01-30'
        WHEN ID = 18 THEN '2025-03-25'
        WHEN ID = 19 THEN '2025-06-05'
        WHEN ID = 20 THEN '2023-10-11'
    END;
ROLLBACK;
UPDATE sales SET order_date =
	CASE 
        WHEN ID = 1 THEN '2022-12-27'
        WHEN ID = 2 THEN '2023-03-05'
        WHEN ID = 3 THEN '2023-05-12'
        WHEN ID = 4 THEN '2024-01-27'
        WHEN ID = 5 THEN '2024-04-08'
        WHEN ID = 6 THEN '2024-07-01'
        WHEN ID = 7 THEN '2024-09-19'
        WHEN ID = 8 THEN '2025-01-07'
        WHEN ID = 9 THEN '2025-02-28'
        WHEN ID = 10 THEN '2025-05-15'
        WHEN ID = 11 THEN '2023-10-27'
        WHEN ID = 12 THEN '2023-12-11'
        WHEN ID = 13 THEN '2024-02-24'
        WHEN ID = 14 THEN '2024-06-14'
        WHEN ID = 15 THEN '2024-08-05'
        WHEN ID = 16 THEN '2024-10-28'
        WHEN ID = 17 THEN '2025-01-20'
        WHEN ID = 18 THEN '2025-03-15'
        WHEN ID = 19 THEN '2025-05-26'
        WHEN ID = 20 THEN '2023-10-01'
    END;
    
-- per evitare che risucceda che le date non collimino tra loro inserisco un check sulla tbella sales in caso volessi aggiungere un altro campo
    
ALTER TABLE sales
ADD CONSTRAINT sales_date_check CHECK (sales_date >= order_date);

-- siccome devo avere anche dei prodotti invenduti aggiungo alla tabella 'product' 5 campi di prodotti che non risulteranno venduti

INSERT INTO product (name, color, racommended_age, list_price, standard_cost, categoryID) VALUES
('Magic Set', 'Black', '10+', 29.99, 15.00, 7),
('Astronomy Kit', 'Blue', '8+', 39.99, 20.00, 1),
('Art Supplies', 'Multicolor', '4+', 19.99, 10.00, 6),
('RC Car', 'Red', '7+', 49.99, 25.00, 3),
('Board Game', 'Green', '5+', 24.99, 12.50, 2);

-- siccome in alcune esercizi mi chiede di avere il prezzo totale dei prodotti mi inserisco la colonna 'total price'

ALTER TABLE sales 
ADD COLUMN total_price DECIMAL(10,2);

UPDATE sales SET total_price
= order_quantity * unit_price;

-- ho sbagliato a mettere la foreign key in region e sales

ALTER TABLE sales 
ADD COLUMN regionID INT; 

ALTER TABLE sales 
ADD CONSTRAINT fk_regionID FOREIGN KEY (regionID) REFERENCES region(ID); 

UPDATE sales
JOIN region ON sales.ID = region.salesID
set sales.regionID = region.ID;

START TRANSACTION;
SHOW CREATE TABLE region;
ALTER TABLE region
DROP FOREIGN KEY region_ibfk_1;
ROLLBACK;

ALTER TABLE region DROP COLUMN salesID;
    
select product.ID, product.name, sales.order_number, sales.order_quantity
from product
left join sales on product.ID = sales.productID;