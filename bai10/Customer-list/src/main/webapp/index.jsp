<%@ page import="java.util.*"%>
<%@ page import="com.example.customerlist.model.Customer" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <style>
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            text-align: left;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            width: 100px;
            height: auto;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>

<%
    List<Customer> customers = new ArrayList<>();
    customers.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://picsum.photos/id/237/200/300"));
    customers.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://picsum.photos/id/237/200/300"));
    customers.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://picsum.photos/id/237/200/300"));
    customers.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://picsum.photos/id/237/200/300"));
    request.setAttribute("customersList", customers);
%>

<h1>Danh sách khách hàng</h1>
<table>
    <thead>
        <tr>
            <th>Họ và tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="customer" items="${customersList}">
            <tr>
                <td>${customer.name}</td>
                <td>${customer.dob}</td>
                <td>${customer.address}</td>
                <td><img src="${customer.image}" alt="Customer Image" width="50" height="50"/></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>