<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>

<div class="container mt-5">
  <h1>Customer List</h1>

  <table class="table table-striped table-bordered">
    <thead class="table-dark">
    <tr>
      <th>Name</th>
      <th>Birthday</th>
      <th>Address</th>
      <th>Image</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers}" var="customer">
      <tr>
        <td>${customer.name}</td>
        <td>${customer.birthday}</td>
        <td>${customer.address}</td>
        <td><img src="${customer.img}" alt="Customer Image" class="img-thumbnail" style="max-width: 100px; height: auto;"></td> <%-- Thêm class và style cho img --%>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script> <%-- Thêm Bootstrap JS (tùy chọn) --%>
</body>
</html>