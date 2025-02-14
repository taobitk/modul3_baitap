use QuanLyBanHang;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT 
    oID, oDate, oTotalPrice
FROM
    Order_;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    c.cName as Customer_name, p.pName as Product_name
FROM customer c join order_ o on c.cID = o.cID JOIN orderdetail od on o.oID = od.oid join product p on od.pid = p.pid;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT 
    c.cName
FROM
    customer c
        LEFT JOIN
    Order_ o ON c.cID = o.cID
        LEFT JOIN
    orderdetail od ON o.oID = od.oid
WHERE
    od.oid IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

SELECT 
    o.oID, o.oDate, SUM(od.odQTY * p.pPrice) AS oTotalPrice
FROM
    Order_ o
        JOIN
    orderdetail od ON o.oID = od.oid
        JOIN
    product p ON od.pid = p.pid
GROUP BY o.oID , o.oDate;

