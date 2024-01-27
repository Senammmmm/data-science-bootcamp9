CREATE TABLE customers (
  id text,
  name text,
  gender text,
  age int,
  birthdate date,
  phone text
);

INSERT INTO customers
VALUES ('001', 'John', 'M', 23, '2000-01-01', '0123456789'),
  ('002', 'Thomas', 'M', 21, '2002-10-27', '0845569987'),
  ('003', 'Ashay', 'M', 26, '1997-04-06', '0658745123'),
  ('004', 'Lily', 'F', 30, '1993-08-19', '0875569412'),
  ('005', 'Sonia', 'F', 53, '1970-06-08', '0569987451'),
  ('006', 'Zack', 'M', 46, '1977-02-28', '0547891236');

.mode box
SELECT * FROM customers;

CREATE TABLE menus (
  menu_id text,
  menu text,
  price int,
  menu_group text
  );

INSERT INTO menus
VALUES ('M001', 'Smoked Salmon', 350, 'main dish'),
  ('M002','Margherita', 150, 'main dish'),
  ('M003','Pepperoni', 180, 'main dish'),
  ('M004','Hawaiian', 180, 'main dish'),
  ('M005','Vegetarian', 150, 'main dish'),
  ('M006','Quattro Formaggi', 200, 'main dish'),
  ('M007','BBQ Chicken', 230, 'main dish'),
  ('M008','Supreme', 300, 'main dish'),
  ('M009','White Pizza', 380, 'main dish'),
  ('M010','Spinach and Feta', 280, 'main dish'),
  ('M011','Mushroom and Onion', 200, 'main dish'),
  ('M012', 'Burger', 360, 'main dish'),
  ('M013', 'French Fried', 120, 'appitizer'),
  ('M014', 'Spaghetti', 250, 'main dish'),
  ('M015', 'Salad', 190, 'appitizer'),
  ('M016', 'Ice cream', 80, 'dessert'),
  ('M017', 'Cheesecake', 120, 'dessert'),
  ('M018', 'Taco', 150, 'appitizer'),
  ('M019', 'Spinach-Cheesse Bake', 180, 'appitizer'),
  ('M020', 'Fried Chicken', 160, 'appitizer' ),
  ('M021', 'Coke', 20, 'beverage' ),
  ('M022', 'Mineral water', 45, 'beverage'),
  ('M023', 'Sparkling water', 25, 'beverage');

.mode box
SELECT * FROM menus;

CREATE TABLE orders (
  order_id text,
  order_date date,
  customer_id text,
  menu_id text,
  quantity int,
  take_away boolean
);

INSERT INTO orders
VALUES ('O001', '2022-01-01', '001', 'M001', 1, false),
('O001', '2022-01-01','001', 'M002', 1, false),
('O001', '2022-01-01','001', 'M015', 2, false),
('O001', '2022-01-01','001', 'M016', 5, false),
('O001', '2022-01-01','001', 'M023', 10, false),
('O002', '2022-01-01','002', 'M001', 2, true),
('O003', '2022-02-14','003', 'M018', 3, true),
('O003', '2022-02-14','003', 'M022', 1, true),
('O004', '2022-03-01','004', 'M006', 2, false),
('O004', '2022-03-01','004', 'M002', 2, false),
('O004', '2022-03-01','004', 'M003', 2, false),
('O004', '2022-03-01','004', 'M001', 1, false),
('O004', '2022-03-01','004', 'M021', 4, false),
('O004', '2022-03-01','004', 'M023', 3, false),
('O005', '2022-03-01','004', 'M001', 2, true),
('O006', '2022-04-12','005', 'M001', 1, true),
('O006', '2022-04-12','005', 'M002', 1, true),
('O006', '2022-04-12','005', 'M003', 1, true),
('O006', '2022-04-12','005', 'M004', 1, true),
('O006', '2022-04-12','005', 'M005', 1, true),
('O006', '2022-04-12','005', 'M006', 1, true),
('O006', '2022-04-12','005', 'M007', 1, true),
('O006', '2022-04-12','005', 'M008', 1, true),
('O006', '2022-04-12','005', 'M009', 1, true),
('O006', '2022-04-12','005', 'M010', 1, true),
('O006', '2022-04-12','005', 'M011', 1, true),
('O006', '2022-04-12','005', 'M014', 1, true),
('O006', '2022-04-12','005', 'M020', 1, true),
('O006', '2022-04-12','005', 'M017', 3, true),
('O006', '2022-04-12','005', 'M019', 2, true),
('O007', '2022-04-30','006', 'M017', 1, false),
('O007', '2022-04-30','006', 'M001', 1, false),
('O007', '2022-04-30','006', 'M023', 1, false),
('O007', '2022-04-30','006', 'M015', 1, false),
('O007', '2022-04-30','006', 'M023', 1, false);

.mode box
SELECT * FROM orders;


SELECT
  t1.order_id,
  t1.customer_id,
  t1.menu_id,
  t1.quantity,
  t2.price,
  t1.quantity * t2.price AS total_price
FROM orders t1 JOIN menus t2
ON t1.menu_id = t2.menu_id;

-- How much is it for each order? And Who spends the most?
SELECT 
  name,
  order_id,
  SUM(total_price) AS total
FROM (
  SELECT
    t1.order_id,
    t1.customer_id,
    t1.menu_id,
    t1.quantity,
    t2.price,
    t1.quantity * t2.price AS total_price
  FROM orders t1 JOIN menus t2
  ON t1.menu_id = t2.menu_id
) AS t3 JOIN customers t4
ON t3.customer_id = t4.id
GROUP BY order_id
ORDER BY total desc;

-- Top 5 best seller menu
SELECT
  A.menu_id,
  B.menu,
  SUM(A.quantity) AS Total_Sold
FROM orders A JOIN menus B
ON A.menu_id = B.menu_id
GROUP BY 1
ORDER BY 3 DESC
Limit 5;

-- Top 5 best seller main dish
SELECT
  A.menu_id,
  B.menu,
  SUM(A.quantity) AS Total_Sold
FROM orders A JOIN menus B
ON A.menu_id = B.menu_id
WHERE B.menu_group = 'main dish'
GROUP BY 1
ORDER BY 3 DESC
Limit 5;
