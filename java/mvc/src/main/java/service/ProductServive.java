package service;

import model.Product;
import repository.ProductRepository;

import java.util.List;

public class ProductServive implements IProductService {
    @Override
    public void addProduct(Product product) {
        ProductRepository.add(product); // Implemented addProduct
    }

    @Override
    public void updateProduct(Product product) {
        ProductRepository.update(product);
    }

    @Override
    public void deleteProduct(int id) {
        ProductRepository.delete(id);
    }

    @Override
    public List<Product> getAllProduct() {
        List<Product> products = ProductRepository.getAll();
        return products;
    }


    @Override
    public Product getProduct(int id) {
        return null;
    }

}