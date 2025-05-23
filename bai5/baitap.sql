CREATE DATABASE DEMO;

USE DEMO;

CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(20) UNIQUE NOT NULL,
    productName VARCHAR(100) NOT NULL,
    productPrice DECIMAL(10,2) NOT NULL CHECK (productPrice >= 0),
    productAmount INT NOT NULL CHECK (productAmount >= 0),
    productDescription TEXT,
    productStatus ENUM('Available', 'Out of Stock', 'Discontinued') NOT NULL
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUES
('P001', 'Laptop Dell XPS', 25000000, 10, 'Laptop hiệu suất cao, màn hình 15 inch', 'Available'),
('P002', 'iPhone 15 Pro', 32000000, 5, 'Điện thoại cao cấp, chip A17 Pro', 'Available'),
('P003', 'Samsung Galaxy S23', 29000000, 8, 'Điện thoại Android mạnh mẽ, camera 108MP', 'Available'),
('P004', 'Tai nghe Sony WH-1000XM5', 8500000, 15, 'Tai nghe chống ồn tốt nhất của Sony', 'Available'),
('P005', 'Bàn phím cơ Logitech', 2300000, 20, 'Bàn phím cơ chất lượng cao, switch GX Brown', 'Available');

CREATE UNIQUE INDEX idx_product_code ON Products (productCode);
EXPLAIN SELECT * FROM Products WHERE productCode = 'P004';
 
CREATE INDEX idx_product_name_price ON Products(productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productName = 'Laptop Dell XPS' AND productPrice > 20000000;

CREATE VIEW products_view AS
    SELECT 
        productCode, productName, productPrice, productStatus
    FROM
        products;

SELECT 
    *
FROM
    products_view;
    
CREATE OR REPLACE VIEW products_view AS
    SELECT 
        productCode, productName, productPrice, productStatus
    FROM
        products
    WHERE
        productAmount = 5;

SELECT 
    *
FROM
    products_view;
    
DROP VIEW products_view;

DELIMITER //
CREATE PROCEDURE findAllProducts()
BEGIN
  SELECT * FROM Products;
END //
DELIMITER ;

CALL findAllProducts();

DELIMITER //
CREATE PROCEDURE addProduct(
    IN pCode VARCHAR(20),
    IN pName VARCHAR(100),
    IN pPrice DECIMAL(10,2),
    IN pAmount INT,
    IN pDescription TEXT,
    IN pStatus ENUM('Available', 'Out of Stock', 'Discontinued')
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (pCode, pName, pPrice, pAmount, pDescription, pStatus);
END //
DELIMITER ;

CALL addProduct('P006', 'Smartwatch Apple', 7500000, 10, 'Đồng hồ thông minh', 'Available');

DELIMITER //
CREATE PROCEDURE updateProduct(
    IN pId INT,
    IN pPrice DECIMAL(10,2),
    IN pAmount INT,
    IN pDescription TEXT,
    IN pStatus ENUM('Available', 'Out of Stock', 'Discontinued')
)
BEGIN
    UPDATE Products
    SET productPrice = pPrice,
        productAmount = pAmount,
        productDescription = pDescription,
        productStatus = pStatus
    WHERE Id = pId;
END //
DELIMITER ;

CALL updateProduct(2, 31000000, 6, 'iPhone 15 Pro - phiên bản nâng cấp', 'Available');

DELIMITER //
CREATE PROCEDURE deleteProduct(IN pId INT)
BEGIN
    DELETE FROM Products WHERE Id = pId;
END //
DELIMITER ;

CALL deleteProduct(3);