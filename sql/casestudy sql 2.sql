-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.
-- đã thêm
use furama;


-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien 
where ho_ten like 'H%' 
or ho_ten like 'T%' 
or ho_ten like 'K%' 
AND LENGTH(ho_ten) <= 15; 


-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang 
WHERE TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) BETWEEN 18 AND 50
AND (dia_chi LIKE '%Đà Nẵng%' OR dia_chi LIKE '%Quảng Trị%');


-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
--      Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
--      Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT kh.ho_ten, lk.ten_loai_khach, COUNT(hd.ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang
ORDER BY so_lan_dat_phong ASC;


-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT 
    kh.ma_khach_hang, 
    kh.ho_ten, 
    lk.ten_loai_khach, 
    hd.ma_hop_dong, 
    dv.ten_dich_vu, 
    hd.ngay_lam_hop_dong, 
    hd.ngay_ket_thuc, 
    (dv.chi_phi_thue + IFNULL(dvdk.gia * 1, 0)) AS tong_tien
FROM 
    khach_hang kh
JOIN 
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN 
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN 
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN 
    dich_vu_di_kem dvdk ON hd.ma_hop_dong = dvdk.ma_dich_vu_di_kem
ORDER BY 
    kh.ma_khach_hang, hd.ma_hop_dong;


-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
--  của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3). 
-- để tạm đó 
SELECT 
    dv.ma_dich_vu, 
    dv.ten_dich_vu, 
    dv.dien_tich, 
    dv.chi_phi_thue, 
    ldv.ten_loai_dich_vu
FROM 
    dich_vu dv
JOIN 
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
JOIN 
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE 
    (hd.ma_hop_dong IS NULL OR (YEAR(hd.ngay_lam_hop_dong) < 2021 OR MONTH(hd.ngay_lam_hop_dong) NOT IN (1, 2, 3)))
group by 
	ma_dich_vu
ORDER BY 
    dv.ma_dich_vu;
    
    
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT 
    dv.ma_dich_vu, 
    dv.ten_dich_vu, 
    dv.dien_tich, 
    dv.so_nguoi_toi_da, 
    dv.chi_phi_thue, 
    ldv.ten_loai_dich_vu
FROM 
    dich_vu dv
JOIN 
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
LEFT JOIN 
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE 
    YEAR(hd.ngay_lam_hop_dong) = 2020
    AND NOT EXISTS (
        SELECT 1
        FROM hop_dong hd2
        WHERE hd2.ma_dich_vu = dv.ma_dich_vu
        AND YEAR(hd2.ngay_lam_hop_dong) = 2021
    )
group by
	ma_dich_vu
ORDER BY 
    dv.ma_dich_vu;
    
    
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Cách 1: Sử dụng DISTINCT
SELECT DISTINCT ho_ten
FROM khach_hang;
-- Cách 2: Sử dụng GROUP BY
SELECT ho_ten
FROM khach_hang
GROUP BY ho_ten;



-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
	SELECT 
		MONTH(hd.ngay_lam_hop_dong) AS thang,
		COUNT(DISTINCT hd.ma_khach_hang) AS so_khach_hang,
		SUM(hd.tien_dat_coc) AS doanh_thu
	FROM 
		hop_dong hd
	WHERE 
		YEAR(hd.ngay_lam_hop_dong) = 2021
	GROUP BY 
		MONTH(hd.ngay_lam_hop_dong)
	ORDER BY 
		thang;


-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
use furama;
SELECT 
    hd.ma_hop_dong, 
    hd.ngay_lam_hop_dong, 
    hd.ngay_ket_thuc, 
    hd.tien_dat_coc, 
    SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM 
    hop_dong hd
LEFT JOIN 
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN 
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY 
    hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc
ORDER BY 
    hd.ma_hop_dong;

