package ra.springmvc_db_hibernate.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ra.springmvc_db_hibernate.entity.Product;
import ra.springmvc_db_hibernate.repository.ProductRepository;
import ra.springmvc_db_hibernate.service.ProductService;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public Product getProductById(Integer productId) {
        return productRepository.findById(productId);
    }

    @Override
    public boolean saveProduct(Product product) {
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
    public List<Product> searchProductsByName(String name) {
        return productRepository.searchByName(name);
    }
}

