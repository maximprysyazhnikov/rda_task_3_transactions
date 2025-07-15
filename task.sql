-- Use our database
USE ShopDB;

START TRANSACTION;

-- 1. Створюємо нове замовлення
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- 2. Отримуємо останнє ID замовлення
SET @last_order_id = LAST_INSERT_ID();

-- 3. Додаємо позицію замовлення (OrderItem)
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@last_order_id, 1, 1);

-- 4. Оновлюємо кількість на складі (WarehouseAmount)
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;