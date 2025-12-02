SELECT 
    OrderID,
    CustomerName,
    TRIM(product) AS Product
FROM ProductDetail,
JSON_TABLE(
    CONCAT('["', REPLACE(Products, ', ', '","'), '"]'),
    '$[*]' COLUMNS(product VARCHAR(100) PATH '$')
) AS prod;

CREATE TABLE Orders AS
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Step 2: Create OrderItems table (full dependency on primary key)
CREATE TABLE OrderItems AS
SELECT OrderID, Product, Quantity
FROM OrderDetails;
