<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="vi">
<head>
    <title>Thêm mới sản phẩm</title>
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
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">THÊM MỚI SẢN PHẨM</h4>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty err}">
                            <div class="alert alert-danger" role="alert">
                                ${err}
                            </div>
                        </c:if>

                        <form:form action="insertProduct" modelAttribute="product" method="post">
                            <div class="form-group">
                                <label for="productName" class="font-weight-bold">Tên sản phẩm <span class="text-danger">*</span></label>
                                <form:input path="productName" class="form-control" id="productName" placeholder="Nhập tên sản phẩm" required="required"/>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="price" class="font-weight-bold">Giá bán (VNĐ) <span class="text-danger">*</span></label>
                                    <form:input path="price" type="number" step="0.01" min="0" class="form-control" id="price" placeholder="0" required="required"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="quantity" class="font-weight-bold">Số lượng tồn kho <span class="text-danger">*</span></label>
                                    <form:input path="quantity" type="number" min="0" class="form-control" id="quantity" placeholder="0" required="required"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="producer" class="font-weight-bold">Nhà sản xuất</label>
                                <form:input path="producer" class="form-control" id="producer" placeholder="Nhập tên hãng / nhà sản xuất"/>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold d-block">Trạng thái</label>
                                <div class="form-check form-check-inline">
                                    <form:radiobutton path="status" value="true" class="form-check-input" id="statusActive" checked="checked"/>
                                    <label class="form-check-label" for="statusActive">Còn hàng</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <form:radiobutton path="status" value="false" class="form-check-input" id="statusInactive"/>
                                    <label class="form-check-label" for="statusInactive">Hết hàng</label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description" class="font-weight-bold">Mô tả chi tiết</label>
                                <form:textarea path="description" class="form-control" id="description" rows="4" placeholder="Nhập mô tả sản phẩm..."/>
                            </div>

                            <div class="mt-4">
                                <button type="submit" class="btn btn-primary px-4">Lưu lại</button>
                                <button type="reset" class="btn btn-secondary px-4">Nhập lại</button>
                                <a href="loadProducts" class="btn btn-outline-dark float-right">Quay lại danh sách</a>
                            </div>
                        </form:form>
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

