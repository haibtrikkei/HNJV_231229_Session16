<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <title>List students</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container">
            <a class="navbar-brand" href="#">Quản Lý Hệ Thống</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="loadStudents">Quản lý Sinh viên</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="loadProducts">Quản lý Sản phẩm</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h1>LIST STUDENTS</h1>
            <div>
                <a href="initInsertStudent" class="btn btn-primary mr-2">+ Insert Student</a>
                <a href="loadProducts" class="btn btn-outline-success">Go to Products</a>
            </div>
        </div>
        <table class="table table-bordered table-hover">
            <thead class="thead-light">
                <tr>
                    <th>Student Id</th>
                    <th>Student Name</th>
                    <th>Gender</th>
                    <th>Birthday</th>
                    <th>Address</th>
                    <th>Class Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="s">
                    <tr>
                        <td>${s.stuId}</td>
                        <td>${s.stuName}</td>
                        <td>${s.gender?"Male":"Female"}</td>
                        <td><fmt:formatDate value="${s.birthday}" pattern="dd/MM/yyyy"/> </td>
                        <td>${s.address}</td>
                        <td>${s.className}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="initInsertStudent" class="btn btn-primary">Insert Student</a>
    </div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
