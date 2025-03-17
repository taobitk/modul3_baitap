CREATE DATABASE IF NOT EXISTS product_management; -- Tạo database (nếu chưa tồn tại)

USE product_management; -- Chọn database để sử dụng

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL
);
INSERT INTO products (name, price, quantity) VALUES
('Laptop', 1500, 10),
('Smartphone', 800, 20),
('Tablet', 300, 15),
('Headphones', 100, 50),
('Keyboard', 75, 30);
select * from products;