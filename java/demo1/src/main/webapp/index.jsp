<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h2>Nhập Thông Tin Sản Phẩm</h2>
<form action="/display-discount" method="get">
    <label for="description">Product Description:</label><br>
    <input type="text" id="description" name="description" required><br><br>

    <label for="list_price">List Price:</label><br>
    <input type="number" id="list_price" name="list_price" required><br><br>

    <label for="discount">Discount Percent:</label><br>
    <input type="number" id="discount" name="discount" required><br><br>

    <input type="submit" value="Gửi">
</form>

</body>
</html>