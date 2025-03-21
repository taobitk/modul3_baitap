package service;

import model.Product;

import java.util.List;

public interface IProductService {
     void addProduct(Product product);
     void updateProduct(Product product);
     void deleteProduct(int id);
      List<Product> getAllProduct();
     Product getProduct(int id);
}
