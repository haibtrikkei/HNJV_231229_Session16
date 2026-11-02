package ra.springmvc_db_hibernate.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ra.springmvc_db_hibernate.dao.ProductDAO;
import ra.springmvc_db_hibernate.entity.Product;
import ra.springmvc_db_hibernate.repository.ProductRepository;

import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {
    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    @Override
    public Product getProductById(Integer productId) {
        return productRepository.findById(productId);
    }

    @Override
    public boolean insertProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public boolean updateProduct(Product product) {
        return productRepository.update(product);
    }

    @Override
    public boolean deleteProduct(Integer productId) {
        return productRepository.delete(productId);
    }

    @Override
    public List<Product> getProductsByName(String name) {
        return productRepository.searchByName(name);
    }
}

