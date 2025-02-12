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
