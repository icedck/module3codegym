
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
    <a href="products">Back</a>
</p>
<form method="post">
    <fieldset>
        <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" id="name" value="${requestScope['product'].getName()}" required/></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="number" name="price" id="price" value="${requestScope['product'].getPrice()}" required/></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><textarea name="description" id="description">${requestScope['product'].getDescription()}</textarea></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" value="Update"></td>
        </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
