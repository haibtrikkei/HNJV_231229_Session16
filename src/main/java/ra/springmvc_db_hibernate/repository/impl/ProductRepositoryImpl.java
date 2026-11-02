package ra.springmvc_db_hibernate.repository.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ra.springmvc_db_hibernate.entity.Product;
import ra.springmvc_db_hibernate.repository.ProductRepository;

import java.util.Collections;
import java.util.List;

@Repository
public class ProductRepositoryImpl implements ProductRepository {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Product> findAll() {
        Session session = sessionFactory.openSession();
        try {
            return session.createQuery("from Product", Product.class).list();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return Collections.emptyList();
    }

    @Override
    public Product findById(Integer productId) {
        Session session = sessionFactory.openSession();
        try {
            return session.get(Product.class, productId);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public boolean save(Product product) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(product);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            if (session.getTransaction() != null && session.getTransaction().isActive()) {
                session.getTransaction().rollback();
            }
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public boolean update(Product product) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.update(product);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            if (session.getTransaction() != null && session.getTransaction().isActive()) {
                session.getTransaction().rollback();
            }
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public boolean delete(Integer productId) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            Product product = session.get(Product.class, productId);
            if (product != null) {
                session.delete(product);
                session.getTransaction().commit();
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            if (session.getTransaction() != null && session.getTransaction().isActive()) {
                session.getTransaction().rollback();
            }
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public List<Product> searchByName(String name) {
        Session session = sessionFactory.openSession();
        try {
            String keyword = (name == null || name.trim().isEmpty()) ? "%" : "%" + name.trim() + "%";
            return session.createQuery("from Product where productName like :keyword", Product.class)
                    .setParameter("keyword", keyword)
                    .list();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return Collections.emptyList();
    }
}

