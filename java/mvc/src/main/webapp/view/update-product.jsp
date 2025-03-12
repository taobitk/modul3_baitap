<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Chỉnh sửa sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<div class="container">
  <h1>Chỉnh sửa sản phẩm</h1>

  <form action="/home?action=update" method="post">
    <input type="hidden" name="id" value="${product.id}"> <%-- Trường ẩn để lưu ID --%>

    <div class="mb-3">
      <label for="name" class="form-label">Tên sản phẩm:</label>
      <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
    </div>

    <div class="mb-3">
      <label for="price" class="form-label">Giá:</label>
      <input type="number" class="form-control" id="price" name="price" value="${product.price}" required>
    </div>

    <div class="mb-3">
      <label for="quantity" class="form-label">Số lượng:</label>
      <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}" required>
    </div>

    <button type="submit" class="btn btn-primary">Cập nhật</button>
    <a href="/home" class="btn btn-secondary">Hủy</a>
  </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>