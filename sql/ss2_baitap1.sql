create database SS2_bai1;
create table phieuxuat(
phieuxuat_id int primary key auto_increment,
soPx int,
ngayxuat date
);
create table vattu(
vattu_id int primary key auto_increment,
mavtu varchar(20),
tenvt varchar(100)
);
create table chitietphiunhap(
phieuxuat_id int,
vattu_id int,
foreign key fk_phieuxuat_chitietphiunhap(phieuxuat_id) references phieuxuat(phieuxuat_id),
foreign key fk_vattu_chitietphiunhap(vattu_id) references vattu(vattu_id),
DGxuat int,
SLxuat int
);
