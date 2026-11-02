<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="vi">
<head>
    <title>Danh sách sản phẩm</title>
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
                    <li class="nav-item">
                        <a class="nav-link" href="loadStudents">Quản lý Sinh viên</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="loadProducts">Quản lý Sản phẩm</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="text-primary font-weight-bold">DANH SÁCH SẢN PHẨM</h2>
            <a href="initInsertProduct" class="btn btn-success">+ Thêm mới sản phẩm</a>
        </div>

        <!-- Alert messages -->
        <c:if test="${not empty message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${message}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
        <c:if test="${not empty err}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${err}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>

        <!-- Search Bar -->
        <div class="card mb-4 shadow-sm">
            <div class="card-body">
                <form action="loadProducts" method="get" class="form-inline">
                    <div class="form-group mr-2 flex-grow-1">
                        <input type="text" name="searchName" value="${searchName}" class="form-control w-100"
                               placeholder="Nhập tên sản phẩm cần tìm...">
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">Tìm kiếm</button>
                    <c:if test="${not empty searchName}">
                        <a href="loadProducts" class="btn btn-outline-secondary">Xóa bộ lọc</a>
                    </c:if>
                </form>
            </div>
        </div>

        <!-- Products Table -->
        <div class="table-responsive shadow-sm">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark text-center">
                    <tr>
                        <th style="width: 70px;">Mã SP</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá bán</th>
                        <th>Số lượng</th>
                        <th>Nhà sản xuất</th>
                        <th>Mô tả</th>
                        <th>Trạng thái</th>
                        <th style="width: 220px;">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty list}">
                            <c:forEach items="${list}" var="p">
                                <tr>
                                    <td class="text-center font-weight-bold">${p.productId}</td>
                                    <td>
                                        <a href="detailProduct?productId=${p.productId}" class="font-weight-bold text-dark">
                                            ${p.productName}
                                        </a>
                                    </td>
                                    <td class="text-right text-danger font-weight-bold">
                                        <fmt:formatNumber value="${p.price}" pattern="#,##0"/> VNĐ
                                    </td>
                                    <td class="text-center">${p.quantity}</td>
                                    <td>${p.producer}</td>
                                    <td>${p.description}</td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${p.status}">
                                                <span class="badge badge-success">Còn hàng</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-secondary">Hết hàng</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <a href="detailProduct?productId=${p.productId}" class="btn btn-info btn-sm">Chi tiết</a>
                                        <a href="initUpdateProduct?productId=${p.productId}" class="btn btn-warning btn-sm">Sửa</a>
                                        <a href="deleteProduct?productId=${p.productId}" class="btn btn-danger btn-sm"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm \'${p.productName}\' không?');">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="8" class="text-center text-muted py-4">
                                    Không tìm thấy sản phẩm nào!
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Optional JavaScript -->
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

