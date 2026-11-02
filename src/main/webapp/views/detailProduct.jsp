<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="vi">
<head>
    <title>Chi tiết sản phẩm</title>
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

    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-info text-white">
                        <h4 class="mb-0">CHI TIẾT SẢN PHẨM</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped table-bordered mb-4">
                            <tbody>
                                <tr>
                                    <th style="width: 30%;">Mã sản phẩm:</th>
                                    <td class="font-weight-bold text-primary">${product.productId}</td>
                                </tr>
                                <tr>
                                    <th>Tên sản phẩm:</th>
                                    <td class="font-weight-bold">${product.productName}</td>
                                </tr>
                                <tr>
                                    <th>Giá bán:</th>
                                    <td class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${product.price}" pattern="#,##0"/> VNĐ
                                    </td>
                                </tr>
                                <tr>
                                    <th>Số lượng tồn:</th>
                                    <td>${product.quantity}</td>
                                </tr>
                                <tr>
                                    <th>Nhà sản xuất:</th>
                                    <td>${product.producer}</td>
                                </tr>
                                <tr>
                                    <th>Trạng thái:</th>
                                    <td>
                                        <c:choose>
                                            <c:when test="${product.status}">
                                                <span class="badge badge-success p-2">Còn hàng</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-secondary p-2">Hết hàng</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Mô tả chi tiết:</th>
                                    <td>${product.description}</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="d-flex justify-content-between">
                            <a href="loadProducts" class="btn btn-outline-secondary">Quay lại danh sách</a>
                            <div>
                                <a href="initUpdateProduct?productId=${product.productId}" class="btn btn-warning">Chỉnh sửa</a>
                                <a href="deleteProduct?productId=${product.productId}" class="btn btn-danger"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');">Xóa sản phẩm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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

