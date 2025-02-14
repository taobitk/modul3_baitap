create database QuanLyBanHang ;
use QuanLyBanHang;
CREATE TABLE customer (
    cID INT PRIMARY KEY AUTO_INCREMENT,
    cName VARCHAR(50),
    cAge INT
);
CREATE TABLE Order_ (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    oDate DATETIME,
    oTotalPrice INT,
    FOREIGN KEY (cID)
        REFERENCES customer (cID)
);
CREATE TABLE product (
    pid INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(50),
    pPrice INT
);
CREATE TABLE orderdetail (
    oid INT,
    pid INT,
    odQTY INT,
    FOREIGN KEY (oid)
        REFERENCES Order_ (oID),
    FOREIGN KEY (pid)
        REFERENCES product (pid),
    PRIMARY KEY (oid , pid)
);

INSERT INTO product (pID, pName, pPrice) VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);


INSERT INTO Order_ (oID, cID, oDate, oTotalPrice) VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);


INSERT INTO customer (cID, cName, cAge) VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

INSERT INTO orderdetail (oid, pid, odQTY) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);
