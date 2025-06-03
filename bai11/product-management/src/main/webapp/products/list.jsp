<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
<h1>List of Products</h1>
<table border="1" cellpadding="8" cellspacing="0">
    <thead>
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>
                <a href="products?action=view&id=${product.id}">
                    <c:out value="${product.name}" />
                </a>
            </td>
            <td><c:out value="${product.price}" /></td>
            <td><c:out value="${product.description}" /></td>
            <td>
                <a href="products?action=edit&id=${product.id}">Edit</a>
            </td>
            <td>
                <a href="products?action=delete&id=${product.id}"
                   onclick="return confirm('Are you sure you want to delete this product?');">
                    Delete
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
