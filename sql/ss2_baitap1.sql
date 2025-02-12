CREATE DATABASE SS2_bai1;
USE SS2_bai1;

CREATE TABLE phieuxuat (
    soPx INT PRIMARY KEY AUTO_INCREMENT,
    ngayxuat DATETIME
);

CREATE TABLE vattu (
    mavtu INT PRIMARY KEY AUTO_INCREMENT,
    tenvt VARCHAR(100)
);

CREATE TABLE chitietphiunhap (
    phieuxuat_id INT,
    vattu_id INT,
    DGxuat INT,
    SLxuat INT,
    FOREIGN KEY (phieuxuat_id)
        REFERENCES phieuxuat (soPx),
    FOREIGN KEY (vattu_id)
        REFERENCES vattu (mavtu),
    PRIMARY KEY (phieuxuat_id, vattu_id)
);

CREATE TABLE phieunhap (
    soPN INT PRIMARY KEY AUTO_INCREMENT,
    NgayNhap DATETIME
);

CREATE TABLE chitietphieunhap (
    soPN INT,
    mavtu INT,
    DGnhap INT,
    SLnhap INT,
    FOREIGN KEY (soPN)
        REFERENCES phieunhap (soPN),
    FOREIGN KEY (mavtu)
        REFERENCES vattu (mavtu),
    PRIMARY KEY (soPN, mavtu)
);

CREATE TABLE dondh (
    sodh INT PRIMARY KEY AUTO_INCREMENT,
    ngayDH DATETIME
);

CREATE TABLE chitietdonhang (
    mavtu INT,
    sodh INT,
    PRIMARY KEY (mavtu, sodh),
    FOREIGN KEY (mavtu)
        REFERENCES vattu (mavtu),
    FOREIGN KEY (sodh)
        REFERENCES dondh (sodh)
);

CREATE TABLE nhacc (
    mancc INT PRIMARY KEY AUTO_INCREMENT,
    tenncc NVARCHAR(100),
    diachi NVARCHAR(100)
);

CREATE TABLE sdt (
    number VARCHAR(15),
    id INT PRIMARY KEY AUTO_INCREMENT,
    nhacc_id INT,
    FOREIGN KEY (nhacc_id)
        REFERENCES nhacc (mancc)
);
