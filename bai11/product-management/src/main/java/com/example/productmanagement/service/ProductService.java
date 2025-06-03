package com.example.productmanagement.service;

import com.example.productmanagement.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAllProducts();
    void saveProduct(Product product);
    Product findProductById(int id);
    void deleteProductById(int id);
    void updateProduct(int id, Product product);
}
