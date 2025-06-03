package com.example.productmanagement.service;

import com.example.productmanagement.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService{

    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Laptop", "High performance laptop", 1200.00));
        products.put(2, new Product(2, "Smartphone", "Latest model smartphone", 800.00));
        products.put(3, new Product(3, "Tablet", "Portable tablet device", 400.00));
    }

    @Override
    public List<Product> findAllProducts() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void saveProduct(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findProductById(int id) {
        return products.get(id);
    }

    @Override
    public void deleteProductById(int id) {
        products.remove(id);
    }

    @Override
    public void updateProduct(int id, Product product) {
        products.put(id, product);
    }
}
