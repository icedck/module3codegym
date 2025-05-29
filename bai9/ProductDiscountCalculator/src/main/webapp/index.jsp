<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    <title>Product Discount Calculator</title>
</head>
<body>
<form action="discount-servlet" method="post" class="form-group">
    <h1>Product Discount Calculator</h1>
    <label for="productDescription" class="form-label">Product Description:</label>
    <input class="form-control" type="text" id="productDescription" name="productDescription" required><br><br>

    <label for="originalPrice" class="form-label">Original Price:</label>
    <input class="form-control" type="number" id="originalPrice" name="originalPrice" required><br><br>

    <label for="discountPercentage" class="form-label">Discount Percentage:</label>
    <input class="form-control" type="number" id="discountPercentage" name="discountPercentage" step="0.01" required><br><br>

    <button class="btn btn-primary" type="submit" id="submit">Calculate Discount</button>
</form>
</body>
</html>