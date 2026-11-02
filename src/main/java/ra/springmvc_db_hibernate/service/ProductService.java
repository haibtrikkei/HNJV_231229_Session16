package ra.springmvc_db_hibernate.service;

import ra.springmvc_db_hibernate.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product> getAllProducts();
    Product getProductById(Integer productId);
    boolean saveProduct(Product product);
    boolean updateProduct(Product product);
    boolean deleteProduct(Integer productId);
    List<Product> searchProductsByName(String name);
}

