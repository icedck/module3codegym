<%--
  Created by IntelliJ IDEA.
  User: phamkhanh
  Date: 6/2/2025
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<p>
  <a href="products">back</a>
</p>
form method="post">
    <fieldset>
        <table>
            <tr>
                <td>Are you sure you want to delete this product?</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>${requestScope['product'].getName()}</td>
            </tr>
            <tr>
                <td>Price:</td>
                <td>${requestScope['product'].getPrice()}</td>
            </tr>
            <tr>
                <td>Description:</td>
                <td>${requestScope['product'].getDescription()}</td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Delete"/>
                </td>
                <td><a href="products">back</a></td>
            </tr>
        </table>
    </fieldset>
</body>
</html>
