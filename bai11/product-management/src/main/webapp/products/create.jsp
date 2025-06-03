<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<h1>Create Product</h1>
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
        <td><input type="text" name="name" id="name"/></td>
      </tr>
      <tr>
        <td>Price:</td>
        <td><input type="number" name="price" id="price"/></td>
      </tr>
      <tr>
        <td>Description:</td>
        <td><textarea name="description" id="description"></textarea></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="Create"/>
        </td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>
