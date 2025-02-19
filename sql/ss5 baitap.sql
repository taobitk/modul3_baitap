CREATE DATABASE demo2;
USE demo2;

CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(255) NOT NULL,
    productPrice DECIMAL(10, 2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus BOOLEAN NOT NULL
);


INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
('P001', 'Laptop Dell', 1200.00, 10, 'Laptop Dell với cấu hình mạnh mẽ, màn hình 15.6 inch', true),
('P002', 'Smartphone Samsung', 800.00, 25, 'Smartphone Samsung Galaxy S21 với camera 108MP', true),
('P003', 'Máy tính bảng iPad', 600.00, 15, 'iPad Air mới nhất với màn hình Retina', true),
('P004', 'Tai nghe Sony', 150.00, 30, 'Tai nghe Sony chống ồn với chất lượng âm thanh tuyệt vời', true),
('P005', 'Loa Bluetooth JBL', 100.00, 40, 'Loa Bluetooth JBL âm thanh mạnh mẽ, dễ di động', true),
('P006', 'Máy ảnh Canon EOS', 1500.00, 12, 'Máy ảnh Canon EOS 5D Mark IV, thích hợp cho nhiếp ảnh chuyên nghiệp', true),
('P007', 'Smartwatch Apple', 350.00, 50, 'Smartwatch Apple Series 6 với tính năng theo dõi sức khỏe', true),
('P008', 'Bàn phím cơ Logitech', 90.00, 20, 'Bàn phím cơ Logitech với đèn LED RGB', true),
('P009', 'Chuột chơi game Razer', 70.00, 45, 'Chuột chơi game Razer với cảm biến 16,000 DPI', true),
('P010', 'Màn hình LG 27 inch', 350.00, 35, 'Màn hình LG 27 inch, độ phân giải 4K', true),
('P011', 'Laptop Asus', 1100.00, 18, 'Laptop Asus VivoBook với cấu hình mạnh mẽ cho công việc văn phòng', true),
('P012', 'Smartphone iPhone', 999.00, 40, 'Smartphone iPhone 12 Pro với camera 12MP và màn hình OLED', true),
('P013', 'Tủ lạnh Samsung', 800.00, 8, 'Tủ lạnh Samsung 350L, tiết kiệm năng lượng', true),
('P014', 'Máy xay sinh tố Philips', 50.00, 60, 'Máy xay sinh tố Philips với công suất mạnh mẽ', true),
('P015', 'Nồi cơm điện Panasonic', 60.00, 55, 'Nồi cơm điện Panasonic 1L, nấu cơm nhanh chóng', true),
('P016', 'Máy hút bụi Dyson', 500.00, 10, 'Máy hút bụi Dyson với công nghệ mạnh mẽ, dễ dàng làm sạch mọi ngóc ngách', true),
('P017', 'Máy chiếu Epson', 400.00, 7, 'Máy chiếu Epson Full HD, phù hợp cho hội họp và giải trí', true),
('P018', 'Giày thể thao Nike', 120.00, 30, 'Giày thể thao Nike, thoải mái và bền bỉ', true),
('P019', 'Áo khoác Adidas', 80.00, 25, 'Áo khoác Adidas cho mùa đông ấm áp', true),
('P020', 'Mũ bảo hiểm', 20.00, 100, 'Mũ bảo hiểm chất lượng cao, an toàn cho người sử dụng', true);


-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX index_productCode ON Products(productCode);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX index_productName_productPrice ON Products(productName, productPrice);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';
-- So sánh câu truy vấn trước và sau khi tạo index
-- có index sẽ tìm nhanh hơn

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW Product_Info AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- Tiến hành sửa đổi view
CREATE OR REPLACE VIEW Product_Info AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;

-- Tiến hành xoá view
DROP VIEW IF EXISTS ProductInfo;

-- Tạo Stored Procedure để lấy tất cả thông tin của tất cả các sản phẩm
DELIMITER $$

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END$$

DELIMITER ;

-- Tạo Stored Procedure để thêm một sản phẩm mới
DELIMITER $$

CREATE PROCEDURE AddProduct(
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(255),
    IN p_productPrice DECIMAL(10, 2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus BOOLEAN
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END$$

DELIMITER ;

-- Tạo Stored Procedure để sửa thông tin sản phẩm theo id
DELIMITER $$

CREATE PROCEDURE UpdateProduct(
    IN p_id INT,
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(255),
    IN p_productPrice DECIMAL(10, 2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus BOOLEAN
)
BEGIN
    UPDATE Products
    SET productCode = p_productCode,
        productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    WHERE Id = p_id;
END$$

DELIMITER ;

-- Tạo Stored Procedure để xóa sản phẩm theo id
DELIMITER $$

CREATE PROCEDURE DeleteProduct(
    IN p_id INT
)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END$$

DELIMITER ;




