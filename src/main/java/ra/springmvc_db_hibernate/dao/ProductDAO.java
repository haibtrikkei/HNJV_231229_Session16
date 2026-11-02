package ra.springmvc_db_hibernate.dao;

import ra.springmvc_db_hibernate.entity.Product;

import java.util.List;

public interface ProductDAO {
    List<Product> getProducts();
    Product getProductById(Integer productId);
    boolean insertProduct(Product product);
    boolean updateProduct(Product product);
    boolean deleteProduct(Integer productId);
    List<Product> getProductsByName(String name);
}

