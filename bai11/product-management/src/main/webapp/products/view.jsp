<%--
  Created by IntelliJ IDEA.
  User: phamkhanh
  Date: 6/2/2025
  Time: 11:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product details</title>
</head>
<body>
<p>
  <a href="products">Back</a>
</p>
<table>
    <tr>
        <th>Name</th>
        <td>${requestScope['product'].getName()}</td>
    </tr>
    <tr>
        <th>Price</th>
        <td>${requestScope['product'].getPrice()}</td>
    </tr>
    <tr>
        <th>Description</th>
        <td>${requestScope['product'].getDescription()}</td>
    </tr>
</table>
</body>
</html>
