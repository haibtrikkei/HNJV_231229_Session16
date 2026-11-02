package ra.springmvc_db_hibernate.repository;

import ra.springmvc_db_hibernate.entity.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    Product findById(Integer productId);
    boolean save(Product product);
    boolean update(Product product);
    boolean delete(Integer productId);
    List<Product> searchByName(String name);
}

