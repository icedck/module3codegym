<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Currency Converter</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Currency Converter</h2>
<form action="convert" method="post">
  <label>Rate: </label><br>
  <input type="text" name="rate" placeholder="RATE" value="22000" readonly><br><br>
    <label>USD: </label><br>
    <input type="text" name="usd" placeholder="USD"><br><br>
  <input type="submit" id="submit" value="Convert">
</form>
</body>
</html>