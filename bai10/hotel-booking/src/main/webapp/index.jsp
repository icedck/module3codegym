<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ - Đặt Phòng Khách Sạn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    <style>
        .hotel-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .hotel-card h3 {
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="my-4">Chào mừng đến với Hệ thống Đặt Phòng Khách Sạn!</h1>

    <h2 class="mb-3">Danh sách Khách Sạn</h2>

    <div class="row">
        <c:forEach var="hotel" items="${requestScope.hotels}">
            <div class="col-md-6 col-lg-4">
                <div class="hotel-card">
                    <h3>${hotel.name}</h3>
                    <p>Địa chỉ: ${hotel.address}</p>
                    <a href="rooms?hotelId=${hotel.hotelId}" class="btn btn-primary">Xem phòng</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>